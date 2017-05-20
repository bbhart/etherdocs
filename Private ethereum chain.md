# Private ethereum chain
#ethereum

From https://souptacular.gitbooks.io/ethereum-tutorials-and-tips-by-hudson/content/private-chain.html and https://github.com/ethereum/go-ethereum/wiki/Private-network. 

The things that dictate a private Ethereum chain are:

* Custom Genesis File
* Custom Data Directory
* Custom NetworkID
* (Recommended) Disable Node Discovery


# Creating a private chain
### Create a genesis block file

genesis.json: (example)
```
{
    "config": {
        "chainId": 15,
        "homesteadBlock": 0,
        "eip155Block": 0,
        "eip158Block": 0
    },
    "difficulty": "200000000",
    "gasLimit": "2100000",
    "alloc": { }
}
```


### Init the genesis block
`geth --datadir path/to/custom/data/folder init genesis.json`

```
bhmbp:~ bhart$ pwd
/Users/bhart
bhmbp:~ bhart$ mkdir -p chains/private37
bhmbp:~ bhart$ cd chains/private37/
bhmbp:private37 bhart$ vi genesis.json
bhmbp:private37 bhart$ cat genesis.json
{
    "config": {
        "chainId": 15,
        "homesteadBlock": 0,
        "eip155Block": 0,
        "eip158Block": 0
    },
    "difficulty": "200000000",
    "gasLimit": "2100000",
    "alloc": { }
}
bhmbp:private37 bhart$ geth --datadir ~/chains/private37/ init genesis.json
WARN [05-20|07:36:15] No etherbase set and no accounts found as default
INFO [05-20|07:36:15] Allocated cache and file handles         database=/Users/bhart/chains/private37/geth/chaindata cache=16 handles=16
INFO [05-20|07:36:15] Writing custom genesis block
INFO [05-20|07:36:15] Successfully wrote genesis state         database=chaindata                                    hash=fcf2d3…874b60
INFO [05-20|07:36:15] Allocated cache and file handles         database=/Users/bhart/chains/private37/geth/lightchaindata cache=16 handles=16
INFO [05-20|07:36:15] Writing custom genesis block
INFO [05-20|07:36:15] Successfully wrote genesis state         database=lightchaindata                                    hash=fcf2d3…874b60
```

### Using the new chain
`geth --datadir path/to/custom/data/folder --networkid 15`
— Where ’15’ is a unique integer


# Running a private chain

From https://github.com/ethereum/go-ethereum/wiki/Setting-up-private-network-or-local-cluster:
In order to run multiple ethereum nodes locally, you have to make sure:

* each instance has a separate data directory (--datadir)
* each instance runs on a different port (both eth and rpc) (--port and --rpcport)
* in case of a cluster the instances must know about each other
* the ipc endpoint is unique or the ipc interface is disabled (--ipcpath or --ipcdisable)

Apparently you can start a slimmed down “bootstrap node” whose job it is to serve up enode info so other nodes can figure out where to connect. Or you can run a full Geth node as a bootstrap node.



### Start the first node:
```
geth --datadir="/tmp/eth/60/01" -verbosity 6 --ipcdisable --port 30301 --rpcport 8101 console 2>> /tmp/eth/60/01.log
```

May want to add `--nodiscover` to prevent accidental connections, and `--identity Something` for a friendly name for the node.

### Grab the enode info:
`admin.nodeInfo.enode`
eg. 
```
> admin.nodeInfo.enode
enode://8c544b4a07da02a9ee024def6f3ba24b2747272b64e16ec5dd6b17b55992f8980b77938155169d9d33807e501729ecb42f5c0a61018898c32799ced152e9f0d7@9[::]:30301
```

### Launch a second node:
```
geth --datadir="/tmp/eth/60/02" --verbosity 6 --ipcdisable --port 30302 --rpcport 8102 console 2>> /tmp/eth/60/02.log 
```

### Add first node as a peer to second
`admin.addPeer(enodeUrlOfFirstInstance)`

### Test the connection
```
>net.listening
true
>net.peerCount 
1
>admin.peers
> ```  
