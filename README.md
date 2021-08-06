# Multi Chain Deployment

Here we wil deploy an ERC20 token and his ICO on several networks.  
We will follow always the same path to achieve the deployment:

1. Configure the network in `hardhat.config.js`
2. Set up the network in the Metamask (Networks => CustomRPC)
3. Get some token with the faucet
4. Deploy contracts

---

## Binance Smart Chain

### Testnet

#### Hardhat config

```js
module.exports = {
  networks: {
    bscTestnet: {
      url: "https://data-seed-prebsc-1-s1.binance.org:8545",
      chainId: 97,
      gasPrice: 20000000000,
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
};
```

#### Metamask configuration

| Parameter          | Value                                          |
| ------------------ | ---------------------------------------------- |
| Network name       | BSC Testnet                                    |
| New RPC URL        | https://data-seed-prebsc-1-s1.binance.org:8545 |
| ChainID            | 97                                             |
| Currency symbol    | BNB                                            |
| Block Explorer URL | https://testnet.bscscan.com                    |
|                    |                                                |
| **Faucet**         | **https://testnet.binance.org/faucet-smart**   |

---

### Mainnet

⚠️**Not tested yet**

#### Hardhat config

```js
module.exports = {
  networks: {
    bscMainnet: {
      url: "https://bsc-dataseed.binance.org/",
      chainId: 56,
      gasPrice: 20000000000,
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
};
```

#### Metamask configuration

| Parameter          | Value                              |
| ------------------ | ---------------------------------- |
| Network name       | Binance Smart Chain                |
| New RPC URL        | https://bsc-dataseed1.binance.org/ |
| ChainID            | 56                                 |
| Currency symbol    | BNB                                |
| Block Explorer URL | https://bscscan.com/               |

---

## Polygon - MATIC

### Mumbai testnet

#### Hardhat config

```js
module.exports = {
  networks: {
    polygonTestnet: {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
};
```

#### Metamask configuration

| Parameter          | Value                                   |
| ------------------ | --------------------------------------- |
| Network name       | Polygon Mumbai Testnet                  |
| New RPC URL        | https://rpc-mumbai.matic.today          |
| ChainID            | 80001                                   |
| Currency symbol    | MATIC                                   |
| Block Explorer URL | https://explorer-mumbai.maticvigil.com/ |
|                    |                                         |
| **Faucet**         | **https://faucet.matic.network/**       |

---

### Mainnet

**Docs:** https://docs.matic.network/docs/develop/network-details/network  
⚠️**Not tested yet**

#### Hardhat config

```js
module.exports = {
  networks: {
    polygonMainnet: {
      url: "https://rpc-mainnet.maticvigil.com",
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
};
```

#### Metamask configuration

| Parameter          | Value                               |
| ------------------ | ----------------------------------- |
| Network name       | Matic mainnet                       |
| New RPC URL        | https://rpc-mainnet.maticvigil.com/ |
| ChainID            | 137                                 |
| Currency symbol    | MATIC                               |
| Block Explorer URL | https://polygonscan.com/            |

---

## Avalanche

**Docs:** https://docs.avax.network/build/tutorials/platform/launch-your-ethereum-dapp

### FUJI Testnet

⚠️**Not tested yet**

#### Hardhat config

```js
module.exports = {
  networks: {
    fujiCChain: {
      url: "https://api.avax-test.network/ext/bc/C/rpc",
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
};
```

#### Metamask configuration

| Parameter          | Value                                      |
| ------------------ | ------------------------------------------ |
| Network name       | Avalanche FUJI C-Chain                     |
| New RPC URL        | https://api.avax-test.network/ext/bc/C/rpc |
| ChainID            | 43113                                      |
| Currency symbol    | AVAX                                       |
| Block Explorer URL | https://cchain.explorer.avax-test.network  |
|                    |                                            |
| **Faucet**         | **https://faucet.avax-test.network/**      |

---

### Mainnet

⚠️**Not tested yet**

#### Hardhat config

```js
module.exports = {
  networks: {
    avaxCChain: {
      url: "https://api.avax.network/ext/bc/C/rpc",
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
};
```

#### Metamask configuration

| Parameter          | Value                                 |
| ------------------ | ------------------------------------- |
| Network name       | Avalanche C-Chain                     |
| New RPC URL        | https://api.avax.network/ext/bc/C/rpc |
| ChainID            | 43114                                 |
| Currency symbol    | AVAX                                  |
| Block Explorer URL | https://cchain.explorer.avax.network  |

---

## Astar

**Docs:** https://docs.astar.network/build/smart-contracts/ethereum-virtual-machine/ethereum-contract-on-dusty-network

### Testnet

⚠️**Not tested yet**

#### Hardhat config

```js
module.exports = {
  networks: {
    dusty: {
      url: "https://rpc.dusty.plasmnet.io:8545",
      chainID: 80,
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
};
```

#### Metamask configuration

| Parameter          | Value                                                                                                                                |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| Network name       | Dusty                                                                                                                                |
| New RPC URL        | https://rpc.dusty.plasmnet.io:8545                                                                                                   |
| ChainID            | 80                                                                                                                                   |
| Currency symbol    | PLD                                                                                                                                  |
| Block Explorer URL | Not specified in the doc                                                                                                             |
|                    |                                                                                                                                      |
| **Faucet**         | **[Convert your ETH](https://polkatools.hoonkim.me/index.html) address an paste it on the [Discord](https://discord.gg/PTtZZFxneP)** |

---

## Moonbeam

### Testnet

**Docs:** https://docs.moonbeam.network/getting-started/moonbase/connect/

⚠️**Not tested yet**

#### Hardhat config

```js
module.exports = {
  networks: {
    dusty: {
      url: "https://rpc.testnet.moonbeam.network",
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
};
```

#### Metamask configuration

| Parameter          | Value                                                                                                  |
| ------------------ | ------------------------------------------------------------------------------------------------------ |
| Network name       | Moonbase Alpha                                                                                         |
| New RPC URL        | https://rpc.testnet.moonbeam.network                                                                   |
| ChainID            | 1287                                                                                                   |
| Currency symbol    | DEV                                                                                                    |
| Block Explorer URL | https://moonbase-blockscout.testnet.moonbeam.network/                                                  |
|                    |                                                                                                        |
| **Faucet**         | **Join the [Discord](https://discord.com/invite/PfpUATX) => Miscellaneous => !faucet send ETHaddress** |
