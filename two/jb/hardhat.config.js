require("@nomiclabs/hardhat-waffle");
/**
 * @type import('hardhat/config').HardhatUserConfig
 */
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
//账号秘钥

const ROPSTEN_PRIVATE_KEY = "3e0344a...key...e7c2e0cb42ce";

module.exports = {
  networks: {
    ropsten: {

      url: `https://bsc.getblock.io/testnet/?api_key=7cfcebc3-388d-4d66-ba85-127915ebd320`,
      accounts: [`0x${ROPSTEN_PRIVATE_KEY}`]
    }

  },

    solidity: {
    // 编译版本
    compilers: [
      {
        version: "0.8.4",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        }
      },
    ]
  },

};




