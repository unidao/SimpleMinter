pragma solidity 0.4.24;

// Compound-specific interfaces

interface CToken {
    function balanceOfUnderlying(address) public view returns (uint);
    function borrowBalanceCurrent(address account) public view returns (uint);
    function redeemUnderlying(uint) external returns (uint);
    function borrow(uint) external returns (uint);
}

interface CErc20 {
    function mint(uint) external returns (uint);
    function repayBorrow(uint) external returns (uint);
    function liquidateBorrow(address,uint,address) external returns (uint);
}

interface CEther {
    function mint(uint) external payable;
    function repayBorrow(uint) external payable;
    function liquidateBorrow(address,address) external payable;
}

interface Comptroller {
    function getAccountLiquidity(address) public view returns (uint, uint, uint);
}

