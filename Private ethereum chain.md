# Private ethereum chain


From https://souptacular.gitbooks.io/ethereum-tutorials-and-tips-by-hudson/content/private-chain.html, https://github.com/ethereum/go-ethereum/wiki/Private-network, the Ethereum docs, and other sources.

By the end of this doc you'll have your own Ethereum blockchain, completely separate from the rest of
the world. This is not to be confused with one of the public "testnets", though it's a similar idea.
Mining is easy here -- you'll generate coins easily -- but you won't have anywhere to spend them.
But if you want to test things out (like writing contracts you might not want people to see yet),
this is where you want to do it.

A private chain consists of:
* Configuration file creating the first ("genesis") block
* Private directory for data
* Custom networkID
* A running node with access to the data

# Creating a private chain
By the end of this section, you'll have a private Ethereum blockchain on your machine, with a running node, an account to hold your private Ether, and some mined Ether in that account.

Note this assumes you have `geth` already installed and in the path. If you don't, visit the [Ethereum CLI page](https://www.ethereum.org/cli) .

### 1 - Create a directory.
```
mkdir -p ~/chains/private37
cd ~/chains/private37
```

In this case the "37" is an arbitrary integer that I'll match the chainID to.

### 2 - Create a genesis block config file
Change to the new directory and create a file called **genesis.json** with the config for the first block, called the [genesis block](http://ethdocs.org/en/latest/network/test-networks.html#the-genesis-file).

genesis.json: (example)
```json
{
    "config": {
        "chainId": 37,
        "homesteadBlock": 0,
        "eip155Block": 0,
        "eip158Block": 0
    },
    "difficulty": "200000000",
    "gasLimit": "2100000",
    "alloc": { }
}
```


### 3 - Initialize the genesis block
`geth --datadir ~/chains/private37 init genesis.json`

### 4 - Create an account on the chain

Run `geth --datadir ~/chains/private37 account new` to create a new account. Set a password you won't forget.

### 5 - Using the new chain

Choose an arbitrary integer for your networkID or keep what is shown here.
For now, until we can secure things some, disallow connections from peers (`--maxpeers 0`)  and prevent peer discovery (`--nodiscover`).

`geth --datadir ~/chains/private37  --rpc --networkid 37 --nodiscover --maxpeers 0 console`

### 6 - Start mining
Mine some coin into your primary account.
From geth's console:

`> mining.start(4)`

It will create the [DAG](https://github.com/ethereum/wiki/wiki/Ethash-DAG) (a dataset needed for Ethereum's style of proof-of-work mining), then begin mining.

Let it mine for a few minutes after DAG creation (until you see messages on the cnsole about 'mined potential block'), then check your balance.

### 7 - Check your balance

Check your balance:

`> web3.fromWei(eth.getBalance(eth.coinbase), "ether")`





### Putting it all together
```
bhmbp:~ bhart$ mkdir -p ~/chains/private37
bhmbp:~ bhart$ cd ~/chains/private37
bhmbp:private37 bhart$ vi genesis.json
bhmbp:private37 bhart$ vi genesis.json
bhmbp:private37 bhart$ geth --datadir ~/chains/private37 init genesis.json
WARN [05-20|08:24:26] No etherbase set and no accounts found as default
INFO [05-20|08:24:26] Allocated cache and file handles         database=/Users/bhart/chains/private37/geth/chaindata cache=16 handles=16
INFO [05-20|08:24:26] Writing custom genesis block
INFO [05-20|08:24:26] Successfully wrote genesis state         database=chaindata                                    hash=fcf2d3…874b60
INFO [05-20|08:24:26] Allocated cache and file handles         database=/Users/bhart/chains/private37/geth/lightchaindata cache=16 handles=16
INFO [05-20|08:24:26] Writing custom genesis block
INFO [05-20|08:24:26] Successfully wrote genesis state         database=lightchaindata                                    hash=fcf2d3…874b60
bhmbp:private37 bhart$ geth --datadir ~/chains/private37 account new
WARN [05-20|08:24:34] No etherbase set and no accounts found as default
Your new account is locked with a password. Please give a password. Do not forget this password.
Passphrase:
Repeat passphrase:
Address: {a9b1794a56a88ff6dbde28610c399ec348f8b353}
bhmbp:private37 bhart$ geth --datadir ~/chains/private37  --rpc --networkid 37 --nodiscover --maxpeers 0 console
INFO [05-20|08:24:49] Starting peer-to-peer node               instance=Geth/v1.6.1-stable-021c3c28/darwin-amd64/go1.8.1
INFO [05-20|08:24:49] Allocated cache and file handles         database=/Users/bhart/chains/private37/geth/chaindata cache=128 handles=1024
WARN [05-20|08:24:49] Upgrading chain database to use sequential keys
INFO [05-20|08:24:49] Initialised chain configuration          config="{ChainID: 37 Homestead: 0 DAO: <nil> DAOSupport: false EIP150: <nil> EIP155: 0 EIP158: 0 Engine: unknown}"
INFO [05-20|08:24:49] Disk storage enabled for ethash caches   dir=/Users/bhart/chains/private37/geth/ethash count=3
INFO [05-20|08:24:49] Disk storage enabled for ethash DAGs     dir=/Users/bhart/.ethash                      count=2
INFO [05-20|08:24:49] Database conversion successful
WARN [05-20|08:24:49] Upgrading db log bloom bins
INFO [05-20|08:24:49] Bloom-bin upgrade completed              elapsed=100.506µs
INFO [05-20|08:24:49] Initialising Ethereum protocol           versions="[63 62]" network=37
INFO [05-20|08:24:49] Loaded most recent local header          number=0 hash=fcf2d3…874b60 td=200000000
INFO [05-20|08:24:49] Loaded most recent local full block      number=0 hash=fcf2d3…874b60 td=200000000
INFO [05-20|08:24:49] Loaded most recent local fast block      number=0 hash=fcf2d3…874b60 td=200000000
INFO [05-20|08:24:49] Starting P2P networking
INFO [05-20|08:24:49] RLPx listener up                         self="enode://28ea81602c784c75941bc64d5937e1b7ed23724bf6f46c64b247c4b112e015823b8f3642c4082c041cd6d97f445453ea523a7b78855f7408fc753e91388887a4@[::]:30303?discport=0"
INFO [05-20|08:24:49] IPC endpoint opened: /Users/bhart/chains/private37/geth.ipc
INFO [05-20|08:24:49] HTTP endpoint opened: http://127.0.0.1:8545
Welcome to the Geth JavaScript console!

instance: Geth/v1.6.1-stable-021c3c28/darwin-amd64/go1.8.1
coinbase: 0xa9b1794a56a88ff6dbde28610c399ec348f8b353
at block: 0 (Wed, 31 Dec 1969 16:00:00 PST)
 datadir: /Users/bhart/chains/private37
 modules: admin:1.0 debug:1.0 eth:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

> miner.start(4)
INFO [05-20|08:25:30] Updated mining threads                   threads=4
INFO [05-20|08:25:30] Starting mining operation
null
> INFO [05-20|08:25:30] Commit new mining work                   number=1 txs=0 uncles=0 elapsed=250.187µs
INFO [05-20|08:25:32] Generating DAG in progress               epoch=0 percentage=0 elapsed=1.615s
INFO [05-20|08:25:34] Generating DAG in progress               epoch=0 percentage=1 elapsed=3.471s
INFO [05-20|08:25:36] Generating DAG in progress               epoch=0 percentage=2 elapsed=4.997s
.
.<SNIP>
.
INFO [05-20|08:28:15] Generating DAG in progress               epoch=0 percentage=98 elapsed=2m44.238s
INFO [05-20|08:28:17] Generating DAG in progress               epoch=0 percentage=99 elapsed=2m46.057s
INFO [05-20|08:28:17] Generated ethash verification cache      epoch=0 elapsed=2m46.060s
INFO [05-20|08:28:25] Generating DAG in progress               epoch=1 percentage=0  elapsed=3.422s
INFO [05-20|08:28:28] Generating DAG in progress               epoch=1 percentage=1  elapsed=6.589s
INFO [05-20|08:28:31] Generating DAG in progress               epoch=1 percentage=2  elapsed=9.974s
.
.<SNIP>
.
INFO [05-20|08:34:25] Generating DAG in progress               epoch=1 percentage=98 elapsed=6m3.405s
INFO [05-20|08:34:28] Generating DAG in progress               epoch=1 percentage=99 elapsed=6m7.053s
INFO [05-20|08:34:28] Generated ethash verification cache      epoch=1 elapsed=6m7.056s

INFO [05-20|08:57:38] Successfully sealed new block            number=1 hash=7834b7…c36d74
INFO [05-20|08:57:38] 🔨 mined potential block                  number=1 hash=7834b7…c36d74
INFO [05-20|08:57:38] Commit new mining work                   number=2 txs=0 uncles=0 elapsed=414.736µs
> web3.fromWei(eth.getBalance(eth.coinbase), "ether")
5
```

Success! We now have 5 Ether to play around with in our private chain.
