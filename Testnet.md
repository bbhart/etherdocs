
## Getting on a testnet

### 1 - Create a data directory
```
mkdir -p ~/chains/testnet
cd ~/chains/testnet
```

### 2 - Start geth to download blockchain
```
geth --datadir ~/chains/testnet --testnet --fast console
```
That will take awhile.

### 3 - Create new account on testnet

Run `geth --datadir ~/chains/testnet --testnet account new` to create a new account. Set a password you won't forget.


### 4 - Using the test chain
!! TODO: security stuff like CORS
`geth --datadir ~/chains/testnet --rpc console`


### 5 - Start mining
Mine some coin into your primary account.
From geth's console:

`> miner.start(4)`

It will create the [DAG](https://github.com/ethereum/wiki/wiki/Ethash-DAG) (a dataset needed for Ethereum's style of proof-of-work mining), then begin mining.

Let it mine for a few minutes after DAG creation (until you see messages on the cnsole about 'mined potential block'), then check your balance.


### 6 - Check your balance

Check your balance:

`> web3.fromWei(eth.getBalance(eth.coinbase), "ether")`



## Example
```
bhmbp:~ bhart$ cd chains/
bhmbp:chains bhart$ mkdir testnet
bhmbp:chains bhart$ cd testnet/
bhmbp:testnet bhart$ geth --datadir ~/chains/testnet --testnet --fast
WARN [05-23|21:59:32] No etherbase set and no accounts found as default
INFO [05-23|21:59:32] Starting peer-to-peer node               instance=Geth/v1.6.1-stable-021c3c28/darwin-amd64/go1.8.1
INFO [05-23|21:59:32] Allocated cache and file handles         database=/Users/bhart/chains/testnet/geth/chaindata cache=128 handles=1024
INFO [05-23|21:59:32] Writing custom genesis block
INFO [05-23|21:59:32] Initialised chain configuration          config="{ChainID: 3 Homestead: 0 DAO: <nil> DAOSupport: true EIP150: 0 EIP155: 10 EIP158: 10 Engine: ethash}"
INFO [05-23|21:59:32] Disk storage enabled for ethash caches   dir=/Users/bhart/chains/testnet/geth/ethash count=3
INFO [05-23|21:59:32] Disk storage enabled for ethash DAGs     dir=/Users/bhart/.ethash                    count=2
WARN [05-23|21:59:32] Upgrading db log bloom bins
INFO [05-23|21:59:32] Bloom-bin upgrade completed              elapsed=72.266µs
INFO [05-23|21:59:32] Initialising Ethereum protocol           versions="[63 62]" network=3
INFO [05-23|21:59:32] Loaded most recent local header          number=0 hash=419410…ca4a2d td=1048576
INFO [05-23|21:59:32] Loaded most recent local full block      number=0 hash=419410…ca4a2d td=1048576
INFO [05-23|21:59:32] Loaded most recent local fast block      number=0 hash=419410…ca4a2d td=1048576
INFO [05-23|21:59:32] Starting P2P networking
INFO [05-23|21:59:34] RLPx listener up                         self=enode://e15894ccdd6d46761c8c20763d80e1b2b7577a7856a15956726aa0dd73612ae24131eef4716a76be7c86ee163312429f4c18c0d2895bff856593b9fb5632756f@50.184.220.35:30303
INFO [05-23|21:59:34] IPC endpoint opened: /Users/bhart/chains/testnet/geth.ipc
INFO [05-23|21:59:34] Mapped network port                      proto=udp extport=30303 intport=30303 interface="UPNP IGDv1-IP1"
INFO [05-23|21:59:34] Mapped network port                      proto=tcp extport=30303 intport=30303 interface="UPNP IGDv1-IP1"
INFO [05-23|21:59:44] Block synchronisation started
INFO [05-23|21:59:48] Imported new state entries               count=1 elapsed=1.123ms  processed=1 pending=17
INFO [05-23|21:59:48] Imported new state entries               count=2 elapsed=424.941µs processed=3 pending=49
INFO [05-23|21:59:49] Imported new state entries               count=25 elapsed=2.617ms   processed=28 pending=449
```
_(the test chain will continue to sync)_
When it's looks done, type `exit`
```
bhmbp:testnet bhart$ geth --datadir ~/chains/testnet --testnet account new
WARN [05-25|07:45:09] No etherbase set and no accounts found as default
Your new account is locked with a password. Please give a password. Do not forget this password.
Passphrase:
Repeat passphrase:
Address: {781d7c362b69500199bff7ef15bc6d27f8057570}
bhmbp:testnet bhart$ geth --datadir ~/chains/testnet --rpc console
INFO [05-25|07:48:27] Starting peer-to-peer node               instance=Geth/v1.6.1-stable-021c3c28/darwin-amd64/go1.8.1
INFO [05-25|07:48:27] Allocated cache and file handles         database=/Users/bhart/chains/testnet/geth/chaindata cache=128 handles=1024
INFO [05-25|07:48:27] Initialised chain configuration          config="{ChainID: 3 Homestead: 0 DAO: <nil> DAOSupport: true EIP150: 0 EIP155: 10 EIP158: 10 Engine: ethash}"
INFO [05-25|07:48:27] Disk storage enabled for ethash caches   dir=/Users/bhart/chains/testnet/geth/ethash count=3
INFO [05-25|07:48:27] Disk storage enabled for ethash DAGs     dir=/Users/bhart/.ethash                    count=2
INFO [05-25|07:48:27] Initialising Ethereum protocol           versions="[63 62]" network=1
INFO [05-25|07:48:27] Loaded most recent local header          number=995054 hash=180bcf…ef87fe td=702876131938450
INFO [05-25|07:48:27] Loaded most recent local full block      number=995054 hash=180bcf…ef87fe td=702876131938450
INFO [05-25|07:48:27] Loaded most recent local fast block      number=995054 hash=180bcf…ef87fe td=702876131938450
WARN [05-25|07:48:27] Blockchain not empty, fast sync disabled
INFO [05-25|07:48:27] Starting P2P networking
INFO [05-25|07:48:29] RLPx listener up                         self=enode://e15894ccdd6d46761c8c20763d80e1b2b7577a7856a15956726aa0dd73612ae24131eef4716a76be7c86ee163312429f4c18c0d2895bff856593b9fb5632756f@50.184.220.35:30303
INFO [05-25|07:48:29] IPC endpoint opened: /Users/bhart/chains/testnet/geth.ipc
INFO [05-25|07:48:29] HTTP endpoint opened: http://127.0.0.1:8545
INFO [05-25|07:48:29] Mapped network port                      proto=udp extport=30303 intport=30303 interface="UPNP IGDv1-IP1"
INFO [05-25|07:48:29] Mapped network port                      proto=tcp extport=30303 intport=30303 interface="UPNP IGDv1-IP1"
Welcome to the Geth JavaScript console!

instance: Geth/v1.6.1-stable-021c3c28/darwin-amd64/go1.8.1
coinbase: 0x781d7c362b69500199bff7ef15bc6d27f8057570
at block: 995054 (Thu, 25 May 2017 07:44:42 PDT)
 datadir: /Users/bhart/chains/testnet
 modules: admin:1.0 debug:1.0 eth:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

 > miner.start(4)
 INFO [05-25|07:50:35] Updated mining threads                   threads=4
 INFO [05-25|07:50:35] Starting mining operation
 null
 > INFO [05-25|07:50:35] Commit new mining work                   number=995055 txs=0 uncles=0 elapsed=468.539µs
 INFO [05-25|07:50:39] Generating DAG in progress               epoch=33 percentage=0 elapsed=2.748s
 INFO [05-25|07:50:42] Generating DAG in progress               epoch=33 percentage=1 elapsed=5.955s
 INFO [05-25|07:50:45] Generating DAG in progress               epoch=33 percentage=2 elapsed=8.787s
.
<SNIP>
.
INFO [05-25|07:57:58] Generating DAG in progress               epoch=34 percentage=30 elapsed=2m54.861s
INFO [05-25|07:58:02] Successfully sealed new block            number=995055 hash=ca336d…067791
INFO [05-25|07:58:02] 🔨 mined potential block                  number=995055 hash=ca336d…067791
INFO [05-25|07:58:02] Commit new mining work                   number=995056 txs=0 uncles=0 elapsed=426.209µs
INFO [05-25|07:58:02] Generating DAG in progress               epoch=34 percentage=31 elapsed=2m59.199s
INFO [05-25|07:58:07] Generating DAG in progress               epoch=34 percentage=32 elapsed=3m3.660s
> web3.fromWei(eth.getBalance(eth.coinbase), "ether")
5
```
