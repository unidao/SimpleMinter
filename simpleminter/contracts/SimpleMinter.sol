pragma solidity ^0.4.24;

import "@aragon/os/contracts/lib/token/ERC20.sol";
import "@aragon/os/contracts/apps/AragonApp.sol";
import "@aragon/apps-token-manager/contracts/TokenManager.sol";
import "@aragon/apps-vault/contracts/Vault.sol";
import "@aragon/os/contracts/lib/math/SafeMath.sol";
import "@aragon/os/contracts/common/SafeERC20.sol";

import "../common/contracts/Compound.sol";
// import "../common/contracts/Rinkeby.sol";
import "../common/contracts/Mainnet.sol";


contract SimpleMinter is AragonApp, Constants {
    using SafeMath for uint256;
    using SafeERC20 for ERC20;
    /// ACL
    // bytes32 constant public MINT_ROLE = keccak256("MINT_ROLE");
    // bytes32 constant public REDEEM_ROLE = keccak256("REDEEM_ROLE");
    bytes32 constant public MINT_ROLE = 0x154c00819833dac601ee5ddded6fda79d9d8b506b911b3dbd54cdb95fe6c3686;
    bytes32 constant public REDEEM_ROLE = 0x23ab158aaf38f3699bf4266a91ca312794fa7ad6ee01e00dd03738daa058501e;

    address constant private COLLATERAL = CDAI;
    string private constant ERROR_TRANSFER_FAILED = "ERROR_TRANSFER_FAILED";
    string private constant ERROR_ACTIVE = "ERROR_ACTIVE";
    string private constant ERROR_LOANS = "ERROR_LOANS";
    string private constant ERROR_BALANCE = "ERROR_BALANCE";
    string private constant ERROR_AMOUNT_ZERO = "ERROR_AMOUNT_ZERO";

    event Mint(address sender, address assetToken, uint256 invested, address equityToken, uint256 minted);

    TokenManager private tm;
    Vault private agent;

    function initialize(TokenManager _tm, Vault _agent) public onlyInit {
        tm = _tm;
        agent = _agent;
        initialized();
    }

    /**
     * @notice Transfer `_amount` collateral from `_to` and mint Q-tokens for him
     * @param _to Address _to supplies collateral and gets tokens in exchange
     * @param _amount Amount of collateral to transfer from (must be approved)
     */
    function mint(address _to, uint256 _amount)
        external
        auth(MINT_ROLE)
        onlyPassive
    {
        require(_amount > 0, ERROR_AMOUNT_ZERO);
        uint256 mintAmount = _amount.mul(tm.token().totalSupply()).div(agent.balance(COLLATERAL));
        require(ERC20(COLLATERAL).safeTransferFrom(_to, agent, _amount), ERROR_TRANSFER_FAILED);
        tm.mint(_to, mintAmount);
        emit Mint(_to, COLLATERAL, _amount, tm.token(), mintAmount);
    }

    /**
     * @notice Safe redeems `_amount` of Q-tokens for main asset
     * @param _amount Amount of Q-tokens to redeem
     */
    function redeem(uint256 _amount)
        external
        auth(REDEEM_ROLE)
        onlyPassive
    {
        require(_amount > 0, ERROR_AMOUNT_ZERO);
        require(tm.spendableBalanceOf(msg.sender) >= _amount, ERROR_BALANCE);
        uint256 totalSupply = tm.token().totalSupply();

        // TODO: add ETH transfer here
        ERC20 token = ERC20(COLLATERAL);
        uint256 transferAmount = _amount.mul(agent.balance(token)).div(totalSupply);
        agent.transfer(token, msg.sender, transferAmount); // no need to emit event - agent does it for us

        tm.burn(msg.sender, _amount); // no need to emit event - MiniMe emits Transfer to 0
    }

    /**
     * @notice Urgent redeems `_amount` of Q tokens for all common assets
     * @param _amount Amount of Q-tokens to redeem
     */
    function redeemUrgent(uint256 _amount)
        external
        auth(REDEEM_ROLE)
        noLoans
    {
        require(_amount > 0, ERROR_AMOUNT_ZERO);
        require(tm.spendableBalanceOf(msg.sender) >= _amount, ERROR_BALANCE);
        uint256 totalSupply = tm.token().totalSupply();
        address[17] memory tokens = [
            BAT, DAI, ETH, REP, SAI, USDC, WBTC, ZRX, WETH,
            CBAT, CDAI, CETH, CREP, CSAI, CUSDC, CWBTC, CZRX
        ];
        for (uint i = 0; i < tokens.length; ++i) {
            ERC20 token = ERC20(tokens[i]);
            uint256 transferAmount = _amount.mul(agent.balance(token)).div(totalSupply);
            if (transferAmount > 0)
                agent.transfer(token, msg.sender, transferAmount); // no need to emit event - agent does it for us
        }

        tm.burn(msg.sender, _amount); // no need to emit event - MiniMe emits Transfer to 0
    }

    modifier onlyPassive { // more strict - main asset only, no loans
        require(_isPassive(), ERROR_ACTIVE);
        require(_hasNoLoans(), ERROR_LOANS);
        _;
    }

    modifier noLoans { // less strict - no loans only
        require(_hasNoLoans(), ERROR_LOANS);
        _;
    }

    function _hasNoLoans() internal view returns (bool) {
        address[8] memory tokens = [ CBAT, CDAI, CETH, CREP, CSAI, CUSDC, CWBTC, CZRX ];
        for (uint i = 0; i < tokens.length; ++i) {
            CToken t = CToken(tokens[i]);
            if (t.borrowBalanceCurrent(agent) > 0)
                return false;
        }
        return true;
    }

    function _isPassive() internal view returns (bool) {
        bool res = true;
        address[17] memory tokens = [
            BAT, DAI, ETH, REP, SAI, USDC, WBTC, ZRX, WETH,
            CBAT, CDAI, CETH, CREP, CSAI, CUSDC, CWBTC, CZRX
        ];
        for (uint i = 0; i < tokens.length; ++i) {
            ERC20 t = ERC20(tokens[i]);
            if (t == COLLATERAL) {
                res = res && agent.balance(t) > 0;
            } else if (t == ETH) {
                res = res && agent.balance(t) < 0.1 ether; // ether can't be exact zero
            } else {
                res = res && agent.balance(t) == 0;
            }
        }
        return res;
    }

}
