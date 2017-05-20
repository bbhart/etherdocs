# Private ethereum chain
#ethereum

From https://souptacular.gitbooks.io/ethereum-tutorials-and-tips-by-hudson/content/private-chain.html, https://github.com/ethereum/go-ethereum/wiki/Private-network, the Ethereum docs, and other sources.

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

### 2 - Create a genesis block file
Change to the new directory and create the config for the first block, called the [genesis block](http://ethdocs.org/en/latest/network/test-networks.html#the-genesis-file)  in that directory. 

genesis.json: (example)
```
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
Mine some coin into your primary account .
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
INFO [05-20|08:25:37] Generating DAG in progress               epoch=0 percentage=3 elapsed=6.520s
INFO [05-20|08:25:39] Generating DAG in progress               epoch=0 percentage=4 elapsed=8.069s
INFO [05-20|08:25:40] Generating DAG in progress               epoch=0 percentage=5 elapsed=9.560s
INFO [05-20|08:25:42] Generating DAG in progress               epoch=0 percentage=6 elapsed=11.060s
INFO [05-20|08:25:43] Generating DAG in progress               epoch=0 percentage=7 elapsed=12.586s
INFO [05-20|08:25:45] Generating DAG in progress               epoch=0 percentage=8 elapsed=14.148s
INFO [05-20|08:25:46] Generating DAG in progress               epoch=0 percentage=9 elapsed=15.674s
INFO [05-20|08:25:48] Generating DAG in progress               epoch=0 percentage=10 elapsed=17.344s
INFO [05-20|08:25:50] Generating DAG in progress               epoch=0 percentage=11 elapsed=18.892s
INFO [05-20|08:25:51] Generating DAG in progress               epoch=0 percentage=12 elapsed=20.435s
INFO [05-20|08:25:53] Generating DAG in progress               epoch=0 percentage=13 elapsed=21.973s
INFO [05-20|08:25:54] Generating DAG in progress               epoch=0 percentage=14 elapsed=23.519s
INFO [05-20|08:25:56] Generating DAG in progress               epoch=0 percentage=15 elapsed=25.037s
INFO [05-20|08:25:57] Generating DAG in progress               epoch=0 percentage=16 elapsed=26.680s
INFO [05-20|08:25:59] Generating DAG in progress               epoch=0 percentage=17 elapsed=28.413s
INFO [05-20|08:26:01] Generating DAG in progress               epoch=0 percentage=18 elapsed=30.097s
INFO [05-20|08:26:02] Generating DAG in progress               epoch=0 percentage=19 elapsed=31.654s
INFO [05-20|08:26:04] Generating DAG in progress               epoch=0 percentage=20 elapsed=33.208s
INFO [05-20|08:26:06] Generating DAG in progress               epoch=0 percentage=21 elapsed=34.762s
INFO [05-20|08:26:07] Generating DAG in progress               epoch=0 percentage=22 elapsed=36.295s
INFO [05-20|08:26:09] Generating DAG in progress               epoch=0 percentage=23 elapsed=37.859s
INFO [05-20|08:26:10] Generating DAG in progress               epoch=0 percentage=24 elapsed=39.408s
INFO [05-20|08:26:12] Generating DAG in progress               epoch=0 percentage=25 elapsed=40.943s
INFO [05-20|08:26:13] Generating DAG in progress               epoch=0 percentage=26 elapsed=42.554s
INFO [05-20|08:26:15] Generating DAG in progress               epoch=0 percentage=27 elapsed=44.183s
INFO [05-20|08:26:17] Generating DAG in progress               epoch=0 percentage=28 elapsed=45.785s
INFO [05-20|08:26:18] Generating DAG in progress               epoch=0 percentage=29 elapsed=47.349s
INFO [05-20|08:26:20] Generating DAG in progress               epoch=0 percentage=30 elapsed=48.881s
INFO [05-20|08:26:21] Generating DAG in progress               epoch=0 percentage=31 elapsed=50.426s
INFO [05-20|08:26:23] Generating DAG in progress               epoch=0 percentage=32 elapsed=51.978s
INFO [05-20|08:26:24] Generating DAG in progress               epoch=0 percentage=33 elapsed=53.531s
INFO [05-20|08:26:26] Generating DAG in progress               epoch=0 percentage=34 elapsed=55.084s
INFO [05-20|08:26:27] Generating DAG in progress               epoch=0 percentage=35 elapsed=56.655s
INFO [05-20|08:26:29] Generating DAG in progress               epoch=0 percentage=36 elapsed=58.217s
INFO [05-20|08:26:31] Generating DAG in progress               epoch=0 percentage=37 elapsed=59.878s
INFO [05-20|08:26:32] Generating DAG in progress               epoch=0 percentage=38 elapsed=1m1.408s
INFO [05-20|08:26:34] Generating DAG in progress               epoch=0 percentage=39 elapsed=1m2.951s
INFO [05-20|08:26:35] Generating DAG in progress               epoch=0 percentage=40 elapsed=1m4.486s
INFO [05-20|08:26:37] Generating DAG in progress               epoch=0 percentage=41 elapsed=1m6.011s
INFO [05-20|08:26:38] Generating DAG in progress               epoch=0 percentage=42 elapsed=1m7.546s
INFO [05-20|08:26:40] Generating DAG in progress               epoch=0 percentage=43 elapsed=1m9.052s
INFO [05-20|08:26:41] Generating DAG in progress               epoch=0 percentage=44 elapsed=1m10.666s
INFO [05-20|08:26:43] Generating DAG in progress               epoch=0 percentage=45 elapsed=1m12.153s
INFO [05-20|08:26:44] Generating DAG in progress               epoch=0 percentage=46 elapsed=1m13.657s
INFO [05-20|08:26:46] Generating DAG in progress               epoch=0 percentage=47 elapsed=1m15.142s
INFO [05-20|08:26:47] Generating DAG in progress               epoch=0 percentage=48 elapsed=1m16.631s
INFO [05-20|08:26:49] Generating DAG in progress               epoch=0 percentage=49 elapsed=1m18.124s
INFO [05-20|08:26:50] Generating DAG in progress               epoch=0 percentage=50 elapsed=1m19.619s
INFO [05-20|08:26:52] Generating DAG in progress               epoch=0 percentage=51 elapsed=1m21.114s
INFO [05-20|08:26:53] Generating DAG in progress               epoch=0 percentage=52 elapsed=1m22.619s
INFO [05-20|08:26:55] Generating DAG in progress               epoch=0 percentage=53 elapsed=1m24.188s
INFO [05-20|08:26:57] Generating DAG in progress               epoch=0 percentage=54 elapsed=1m25.730s
INFO [05-20|08:26:58] Generating DAG in progress               epoch=0 percentage=55 elapsed=1m27.410s
INFO [05-20|08:27:00] Generating DAG in progress               epoch=0 percentage=56 elapsed=1m28.940s
INFO [05-20|08:27:01] Generating DAG in progress               epoch=0 percentage=57 elapsed=1m30.450s
INFO [05-20|08:27:03] Generating DAG in progress               epoch=0 percentage=58 elapsed=1m31.996s
INFO [05-20|08:27:04] Generating DAG in progress               epoch=0 percentage=59 elapsed=1m33.495s
INFO [05-20|08:27:06] Generating DAG in progress               epoch=0 percentage=60 elapsed=1m35.003s
INFO [05-20|08:27:07] Generating DAG in progress               epoch=0 percentage=61 elapsed=1m36.506s
INFO [05-20|08:27:09] Generating DAG in progress               epoch=0 percentage=62 elapsed=1m38.003s
INFO [05-20|08:27:10] Generating DAG in progress               epoch=0 percentage=63 elapsed=1m39.551s
INFO [05-20|08:27:12] Generating DAG in progress               epoch=0 percentage=64 elapsed=1m41.345s
INFO [05-20|08:27:14] Generating DAG in progress               epoch=0 percentage=65 elapsed=1m43.536s
INFO [05-20|08:27:16] Generating DAG in progress               epoch=0 percentage=66 elapsed=1m45.165s
INFO [05-20|08:27:18] Generating DAG in progress               epoch=0 percentage=67 elapsed=1m46.797s
INFO [05-20|08:27:19] Generating DAG in progress               epoch=0 percentage=68 elapsed=1m48.392s
INFO [05-20|08:27:21] Generating DAG in progress               epoch=0 percentage=69 elapsed=1m50.104s
INFO [05-20|08:27:23] Generating DAG in progress               epoch=0 percentage=70 elapsed=1m51.880s
INFO [05-20|08:27:25] Generating DAG in progress               epoch=0 percentage=71 elapsed=1m53.946s
INFO [05-20|08:27:28] Generating DAG in progress               epoch=0 percentage=72 elapsed=1m57.089s
INFO [05-20|08:27:31] Generating DAG in progress               epoch=0 percentage=73 elapsed=2m0.439s
INFO [05-20|08:27:33] Generating DAG in progress               epoch=0 percentage=74 elapsed=2m2.632s
INFO [05-20|08:27:35] Generating DAG in progress               epoch=0 percentage=75 elapsed=2m4.303s
INFO [05-20|08:27:37] Generating DAG in progress               epoch=0 percentage=76 elapsed=2m5.985s
INFO [05-20|08:27:38] Generating DAG in progress               epoch=0 percentage=77 elapsed=2m7.546s
INFO [05-20|08:27:40] Generating DAG in progress               epoch=0 percentage=78 elapsed=2m9.612s
INFO [05-20|08:27:42] Generating DAG in progress               epoch=0 percentage=79 elapsed=2m11.386s
INFO [05-20|08:27:44] Generating DAG in progress               epoch=0 percentage=80 elapsed=2m13.105s
INFO [05-20|08:27:46] Generating DAG in progress               epoch=0 percentage=81 elapsed=2m14.737s
INFO [05-20|08:27:48] Generating DAG in progress               epoch=0 percentage=82 elapsed=2m16.706s
INFO [05-20|08:27:49] Generating DAG in progress               epoch=0 percentage=83 elapsed=2m18.481s
INFO [05-20|08:27:51] Generating DAG in progress               epoch=0 percentage=84 elapsed=2m20.282s
INFO [05-20|08:27:53] Generating DAG in progress               epoch=0 percentage=85 elapsed=2m22.028s
INFO [05-20|08:27:55] Generating DAG in progress               epoch=0 percentage=86 elapsed=2m23.947s
INFO [05-20|08:27:57] Generating DAG in progress               epoch=0 percentage=87 elapsed=2m26.047s
INFO [05-20|08:27:59] Generating DAG in progress               epoch=0 percentage=88 elapsed=2m28.661s
INFO [05-20|08:28:01] Generating DAG in progress               epoch=0 percentage=89 elapsed=2m30.223s
INFO [05-20|08:28:03] Generating DAG in progress               epoch=0 percentage=90 elapsed=2m31.827s
INFO [05-20|08:28:04] Generating DAG in progress               epoch=0 percentage=91 elapsed=2m33.387s
INFO [05-20|08:28:06] Generating DAG in progress               epoch=0 percentage=92 elapsed=2m35.000s
INFO [05-20|08:28:07] Generating DAG in progress               epoch=0 percentage=93 elapsed=2m36.500s
INFO [05-20|08:28:09] Generating DAG in progress               epoch=0 percentage=94 elapsed=2m38.140s
INFO [05-20|08:28:10] Generating DAG in progress               epoch=0 percentage=95 elapsed=2m39.684s
INFO [05-20|08:28:12] Generating DAG in progress               epoch=0 percentage=96 elapsed=2m41.228s
INFO [05-20|08:28:14] Generating DAG in progress               epoch=0 percentage=97 elapsed=2m42.725s
INFO [05-20|08:28:15] Generating DAG in progress               epoch=0 percentage=98 elapsed=2m44.238s
INFO [05-20|08:28:17] Generating DAG in progress               epoch=0 percentage=99 elapsed=2m46.057s
INFO [05-20|08:28:17] Generated ethash verification cache      epoch=0 elapsed=2m46.060s
INFO [05-20|08:28:25] Generating DAG in progress               epoch=1 percentage=0  elapsed=3.422s
INFO [05-20|08:28:28] Generating DAG in progress               epoch=1 percentage=1  elapsed=6.589s
INFO [05-20|08:28:31] Generating DAG in progress               epoch=1 percentage=2  elapsed=9.974s
INFO [05-20|08:28:34] Generating DAG in progress               epoch=1 percentage=3  elapsed=13.366s
INFO [05-20|08:28:38] Generating DAG in progress               epoch=1 percentage=4  elapsed=16.695s
INFO [05-20|08:28:42] Generating DAG in progress               epoch=1 percentage=5  elapsed=20.498s
INFO [05-20|08:28:45] Generating DAG in progress               epoch=1 percentage=6  elapsed=23.724s
INFO [05-20|08:28:48] Generating DAG in progress               epoch=1 percentage=7  elapsed=27.044s
INFO [05-20|08:28:51] Generating DAG in progress               epoch=1 percentage=8  elapsed=30.296s
INFO [05-20|08:28:55] Generating DAG in progress               epoch=1 percentage=9  elapsed=33.612s
INFO [05-20|08:28:58] Generating DAG in progress               epoch=1 percentage=10 elapsed=37.325s
INFO [05-20|08:29:02] Generating DAG in progress               epoch=1 percentage=11 elapsed=40.487s
INFO [05-20|08:29:05] Generating DAG in progress               epoch=1 percentage=12 elapsed=43.908s
INFO [05-20|08:29:09] Generating DAG in progress               epoch=1 percentage=13 elapsed=47.566s
INFO [05-20|08:29:13] Generating DAG in progress               epoch=1 percentage=14 elapsed=51.957s
INFO [05-20|08:29:17] Generating DAG in progress               epoch=1 percentage=15 elapsed=55.749s
INFO [05-20|08:29:20] Generating DAG in progress               epoch=1 percentage=16 elapsed=59.359s
INFO [05-20|08:29:24] Generating DAG in progress               epoch=1 percentage=17 elapsed=1m3.092s
INFO [05-20|08:29:28] Generating DAG in progress               epoch=1 percentage=18 elapsed=1m6.528s
INFO [05-20|08:29:31] Generating DAG in progress               epoch=1 percentage=19 elapsed=1m9.885s
INFO [05-20|08:29:34] Generating DAG in progress               epoch=1 percentage=20 elapsed=1m13.161s
INFO [05-20|08:29:38] Generating DAG in progress               epoch=1 percentage=21 elapsed=1m16.418s
INFO [05-20|08:29:42] Generating DAG in progress               epoch=1 percentage=22 elapsed=1m20.466s
INFO [05-20|08:29:46] Generating DAG in progress               epoch=1 percentage=23 elapsed=1m24.493s
INFO [05-20|08:29:49] Generating DAG in progress               epoch=1 percentage=24 elapsed=1m28.091s
INFO [05-20|08:29:53] Generating DAG in progress               epoch=1 percentage=25 elapsed=1m31.666s
INFO [05-20|08:29:56] Generating DAG in progress               epoch=1 percentage=26 elapsed=1m34.951s
INFO [05-20|08:30:00] Generating DAG in progress               epoch=1 percentage=27 elapsed=1m38.954s
INFO [05-20|08:30:05] Generating DAG in progress               epoch=1 percentage=28 elapsed=1m43.556s
INFO [05-20|08:30:09] Generating DAG in progress               epoch=1 percentage=29 elapsed=1m47.598s
INFO [05-20|08:30:12] Generating DAG in progress               epoch=1 percentage=30 elapsed=1m51.132s
INFO [05-20|08:30:16] Generating DAG in progress               epoch=1 percentage=31 elapsed=1m54.426s
INFO [05-20|08:30:19] Generating DAG in progress               epoch=1 percentage=32 elapsed=1m57.688s
INFO [05-20|08:30:22] Generating DAG in progress               epoch=1 percentage=33 elapsed=2m1.209s
INFO [05-20|08:30:26] Generating DAG in progress               epoch=1 percentage=34 elapsed=2m4.635s
INFO [05-20|08:30:29] Generating DAG in progress               epoch=1 percentage=35 elapsed=2m8.110s
INFO [05-20|08:30:33] Generating DAG in progress               epoch=1 percentage=36 elapsed=2m11.500s
INFO [05-20|08:30:36] Generating DAG in progress               epoch=1 percentage=37 elapsed=2m14.952s
INFO [05-20|08:30:40] Generating DAG in progress               epoch=1 percentage=38 elapsed=2m18.414s
INFO [05-20|08:30:43] Generating DAG in progress               epoch=1 percentage=39 elapsed=2m22.103s
INFO [05-20|08:30:46] Generating DAG in progress               epoch=1 percentage=40 elapsed=2m25.353s
INFO [05-20|08:30:50] Generating DAG in progress               epoch=1 percentage=41 elapsed=2m29.289s
INFO [05-20|08:30:54] Generating DAG in progress               epoch=1 percentage=42 elapsed=2m32.627s
INFO [05-20|08:30:57] Generating DAG in progress               epoch=1 percentage=43 elapsed=2m36.060s
INFO [05-20|08:31:01] Generating DAG in progress               epoch=1 percentage=44 elapsed=2m39.551s
INFO [05-20|08:31:04] Generating DAG in progress               epoch=1 percentage=45 elapsed=2m43.051s
INFO [05-20|08:31:08] Generating DAG in progress               epoch=1 percentage=46 elapsed=2m46.475s
INFO [05-20|08:31:11] Generating DAG in progress               epoch=1 percentage=47 elapsed=2m49.786s
INFO [05-20|08:31:14] Generating DAG in progress               epoch=1 percentage=48 elapsed=2m53.103s
INFO [05-20|08:31:18] Generating DAG in progress               epoch=1 percentage=49 elapsed=2m56.652s
INFO [05-20|08:31:21] Generating DAG in progress               epoch=1 percentage=50 elapsed=3m0.134s
INFO [05-20|08:31:25] Generating DAG in progress               epoch=1 percentage=51 elapsed=3m3.396s
INFO [05-20|08:31:29] Generating DAG in progress               epoch=1 percentage=52 elapsed=3m7.432s
INFO [05-20|08:31:35] Generating DAG in progress               epoch=1 percentage=53 elapsed=3m13.872s
INFO [05-20|08:31:40] Generating DAG in progress               epoch=1 percentage=54 elapsed=3m18.534s
INFO [05-20|08:31:44] Generating DAG in progress               epoch=1 percentage=55 elapsed=3m22.916s
INFO [05-20|08:31:49] Generating DAG in progress               epoch=1 percentage=56 elapsed=3m28.080s
INFO [05-20|08:31:53] Generating DAG in progress               epoch=1 percentage=57 elapsed=3m31.977s
INFO [05-20|08:31:57] Generating DAG in progress               epoch=1 percentage=58 elapsed=3m36.231s
INFO [05-20|08:32:01] Generating DAG in progress               epoch=1 percentage=59 elapsed=3m39.722s
INFO [05-20|08:32:05] Generating DAG in progress               epoch=1 percentage=60 elapsed=3m43.791s
INFO [05-20|08:32:09] Generating DAG in progress               epoch=1 percentage=61 elapsed=3m48.323s
INFO [05-20|08:32:13] Generating DAG in progress               epoch=1 percentage=62 elapsed=3m51.573s
INFO [05-20|08:32:17] Generating DAG in progress               epoch=1 percentage=63 elapsed=3m55.867s
INFO [05-20|08:32:22] Generating DAG in progress               epoch=1 percentage=64 elapsed=4m1.330s
INFO [05-20|08:32:27] Generating DAG in progress               epoch=1 percentage=65 elapsed=4m6.303s
INFO [05-20|08:32:34] Generating DAG in progress               epoch=1 percentage=66 elapsed=4m12.726s
INFO [05-20|08:32:39] Generating DAG in progress               epoch=1 percentage=67 elapsed=4m17.710s
INFO [05-20|08:32:44] Generating DAG in progress               epoch=1 percentage=68 elapsed=4m22.901s
INFO [05-20|08:32:49] Generating DAG in progress               epoch=1 percentage=69 elapsed=4m28.245s
INFO [05-20|08:32:54] Generating DAG in progress               epoch=1 percentage=70 elapsed=4m33.079s
INFO [05-20|08:32:57] Generating DAG in progress               epoch=1 percentage=71 elapsed=4m36.276s
INFO [05-20|08:33:01] Generating DAG in progress               epoch=1 percentage=72 elapsed=4m39.656s
INFO [05-20|08:33:04] Generating DAG in progress               epoch=1 percentage=73 elapsed=4m42.835s
INFO [05-20|08:33:07] Generating DAG in progress               epoch=1 percentage=74 elapsed=4m45.997s
INFO [05-20|08:33:11] Generating DAG in progress               epoch=1 percentage=75 elapsed=4m49.424s
INFO [05-20|08:33:14] Generating DAG in progress               epoch=1 percentage=76 elapsed=4m52.588s
INFO [05-20|08:33:17] Generating DAG in progress               epoch=1 percentage=77 elapsed=4m55.883s
INFO [05-20|08:33:20] Generating DAG in progress               epoch=1 percentage=78 elapsed=4m59.183s
INFO [05-20|08:33:23] Generating DAG in progress               epoch=1 percentage=79 elapsed=5m2.351s
INFO [05-20|08:33:27] Generating DAG in progress               epoch=1 percentage=80 elapsed=5m5.589s
INFO [05-20|08:33:30] Generating DAG in progress               epoch=1 percentage=81 elapsed=5m8.669s
INFO [05-20|08:33:33] Generating DAG in progress               epoch=1 percentage=82 elapsed=5m11.833s
INFO [05-20|08:33:36] Generating DAG in progress               epoch=1 percentage=83 elapsed=5m15.178s
INFO [05-20|08:33:40] Generating DAG in progress               epoch=1 percentage=84 elapsed=5m18.450s
INFO [05-20|08:33:43] Generating DAG in progress               epoch=1 percentage=85 elapsed=5m21.656s
INFO [05-20|08:33:46] Generating DAG in progress               epoch=1 percentage=86 elapsed=5m24.711s
INFO [05-20|08:33:49] Generating DAG in progress               epoch=1 percentage=87 elapsed=5m27.875s
INFO [05-20|08:33:52] Generating DAG in progress               epoch=1 percentage=88 elapsed=5m31.136s
INFO [05-20|08:33:56] Generating DAG in progress               epoch=1 percentage=89 elapsed=5m34.393s
INFO [05-20|08:33:59] Generating DAG in progress               epoch=1 percentage=90 elapsed=5m37.793s
INFO [05-20|08:34:02] Generating DAG in progress               epoch=1 percentage=91 elapsed=5m41.107s
INFO [05-20|08:34:05] Generating DAG in progress               epoch=1 percentage=92 elapsed=5m44.212s
INFO [05-20|08:34:09] Generating DAG in progress               epoch=1 percentage=93 elapsed=5m47.457s
INFO [05-20|08:34:12] Generating DAG in progress               epoch=1 percentage=94 elapsed=5m50.681s
INFO [05-20|08:34:15] Generating DAG in progress               epoch=1 percentage=95 elapsed=5m53.852s
INFO [05-20|08:34:18] Generating DAG in progress               epoch=1 percentage=96 elapsed=5m56.988s
INFO [05-20|08:34:21] Generating DAG in progress               epoch=1 percentage=97 elapsed=6m0.225s
INFO [05-20|08:34:25] Generating DAG in progress               epoch=1 percentage=98 elapsed=6m3.405s
INFO [05-20|08:34:28] Generating DAG in progress               epoch=1 percentage=99 elapsed=6m7.053s
INFO [05-20|08:34:28] Generated ethash verification cache      epoch=1 elapsed=6m7.056s

INFO [05-20|08:57:38] Successfully sealed new block            number=1 hash=7834b7…c36d74
INFO [05-20|08:57:38] 🔨 mined potential block                  number=1 hash=7834b7…c36d74
INFO [05-20|08:57:38] Commit new mining work                   number=2 txs=0 uncles=0 elapsed=414.736µs
> web3.fromWei(eth.getBalance(eth.coinbase), "ether")
5
```

