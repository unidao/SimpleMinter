pragma solidity 0.4.24;


// Mainnet-specific constants
contract Constants {

    // Tokens
    address internal constant BAT = 0x0D8775F648430679A709E98d2b0Cb6250d2887EF; // digits 18
    address internal constant DAI = 0x6b175474e89094c44da98b954eedeac495271d0f; // digits 18
    address internal constant REP = 0x1985365e9f78359a9B6AD760e32412f4a445E862; // digits 18
    address internal constant SAI = 0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359; // digits 18
    address internal constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48; // digits 6
    address internal constant WBTC = 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599; // digits 8
    address internal constant ZRX = 0xE41d2489571d322189246DaFA5ebDe1F4699F498; // digits 18
    address internal constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // digits 18

    // Compound comptroller
    address internal constant COMP = 0x3d9819210A31b4961b30EF54bE2aeD79B9c9Cd3B;

    // Compound cTokens
    address internal constant CBAT = 0x6C8c6b02E7b2BE14d4fA6022Dfd6d75921D90E4E; // digits 8
    address internal constant CDAI = 0x5d3a536e4d6dbd6114cc1ead35777bab948e3643; // digits 8
    address internal constant CETH = 0x4Ddc2D193948926D02f9B1fE9e1daa0718270ED5; // digits 8
    address internal constant CREP = 0x158079Ee67Fce2f58472A96584A73C7Ab9AC95c1; // digits 8
    address internal constant CSAI = 0xF5DCe57282A584D2746FaF1593d3121Fcac444dC; // digits 8
    address internal constant CUSDC = 0x39AA39c021dfbaE8faC545936693aC917d5E7563; // digits 8
    address internal constant CWBTC = 0xC11b1268C1A384e55C48c2391d8d480264A3A7F4; // digits 8
    address internal constant CZRX = 0xB3319f5D18Bc0D84dD1b4825Dcde5d5f7266d407; // digits 8

    // Uniswap Exchanges
    address internal constant UBAT = 0x2E642b8D59B45a1D8c5aEf716A84FF44ea665914;
    address internal constant UDAI = 0x2a1530C4C41db0B0b2bB646CB5Eb1A67b7158667;
    address internal constant UREP = 0x48B04d2A05B6B604d8d5223Fd1984f191DED51af;
    address internal constant USAI = 0x09cabEC1eAd1c0Ba254B09efb3EE13841712bE14;
    address internal constant UUSDC = 0x97deC872013f6B5fB443861090ad931542878126;
    address internal constant UWBTC = 0x4d2f5cFbA55AE412221182D8475bC85799A5644b;
    address internal constant UZRX = 0xaE76c84C9262Cdb9abc0C2c8888e62Db8E22A0bF;
    address internal constant UWETH = 0xA2881A90Bf33F03E7a3f803765Cd2ED5c8928dFb;

    // Compound Maximillion proxy-contract (with repayBehalf(address))
    address internal constant CMX = 0xf859A1AD94BcF445A406B892eF0d3082f4174088;

    // KyberNetwork proxy
    address internal constant KN = 0x818E6FECD516Ecc3849DAf6845e3EC868087B755;
    address internal constant KETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    // GST2 Gas token
    address internal constant GST2 = 0xb3F879cb30FE243b4Dfee438691c04;

    // Oasis
    address internal constant OASIS = 0x39755357759ce0d7f32dc8dc45414cca409ae24e;

    // Maker Migration
    address internal constant MAKER_MIGRATION = 0xc73e0383F3Aff3215E6f04B0331D58CeCf0Ab849;

    // OTC
    address internal constant OTC = 0xD924BDd6fA7fd3D0Eb1337853a814a4263dCbfe8;

    // 1inch
    address internal constant ONEINCH = 0x11111254369792b2Ca5d084aB5eEA397cA8fa48B;
    address internal constant ONEINCH_SPENDER = 0xE4C9194962532fEB467DCe8b3d42419641c6eD2E;
}

