pragma solidity 0.4.24;


// Rinkeby-specific constants
contract Constants {

    // Tokens
    address internal constant BAT = 0xbf7a7169562078c96f0ec1a8afd6ae50f12e5a99;
    address internal constant DAI = 0x0;
    address internal constant REP = 0x6e894660985207feb7cf89faf048998c71e8ee89;
    address internal constant SAI = 0x5592ec0cfb4dbc12d3ab100b257153436a1f0fea;
    address internal constant USDC = 0x4dbcdf9b62e891a7cec5a2568c3f4faf9e8abe2b;
    address internal constant WBTC = 0x577d296678535e4903d59a4c929b718e1d575e0a;
    address internal constant ZRX = 0xddea378a6ddc8afec82c36e9b0078826bf9e68b6;
    address internal constant WETH = 0x0;

    // Compound cTokens
    address internal constant CBAT = 0xebf1a11532b93a529b5bc942b4baa98647913002;
    address internal constant CDAI = 0x0;
    address internal constant CETH = 0xd6801a1dffcd0a410336ef88def4320d6df1883e;
    address internal constant CREP = 0xebe09eb3411d18f4ff8d859e096c533cac5c6b60;
    address internal constant CSAI = 0x6d7f0754ffeb405d23c51ce938289d4835be3b14;
    address internal constant CUSDC = 0x5b281a6dda0b271e91ae35de655ad301c976edb1;
    address internal constant CWBTC = 0x0014f450b8ae7708593f4a46f8fa6e5d50620f96;
    address internal constant CZRX = 0x52201ff1720134bbbbb2f6bc97bf3715490ec19b;

    address internal constant COMP = 0x2eaa9d77ae4d8f9cdd9faacd44016e746485bddb;

    // Uniswap Exchanges
    address internal constant UBAT = 0x0;
    address internal constant UDAI = 0x0;
    address internal constant USAI = 0xaF51BaAA766b65E8B3Ee0C2c33186325ED01eBD5;
    address internal constant UREP = 0x0;
    address internal constant UUSDC = 0x0;
    address internal constant UWBTC = 0x0;
    address internal constant UZRX = 0x0;
    address internal constant UWETH = 0x0;

    // Compound Maximillion proxy-contract (with repayBehalf(address))
    address internal constant CMX = 0xfbbdba59516ada2eadf50f96ce0151edc9e0a674;

    // KyberNetwork proxy
    address internal constant KN = 0xF77eC7Ed5f5B9a5aee4cfa6FFCaC6A4C315BaC76;
    address internal constant KETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    // GST2 Gas token
    address internal constant GST2 = 0xb3F879cb30FE243b4Dfee438691c04;

    // Oasis
    address internal constant OASIS = 0x0;

    // Maker Migration
    address internal constant MAKER_MIGRATION = 0x0;

    // OTC
    address internal constant OTC = 0x0;

    // 1inch
    address internal constant ONEINCH = 0x0;
    address internal constant ONEINCH_SPENDER = 0x0;
}
