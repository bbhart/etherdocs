# etherdocs
My Ethereum docs, notes, etc. as I learn.

These will be pretty rough, sometimes unvalidated, so take it with a grain of salt. Will try to cite sources where I can.

## List of lists
_(Rolls up a bunch of reading into one doc/article)_
* https://github.com/Scanate/EthList#getting-started (h/t [@matthewjgroff](https://twitter.com/matthewjgroff))

## Initial Coin Offering (ICO) (general)
* [ICOLIST](http://icolist.com/)
* ICO stats - [site](https://icostats.com/) || [ICOs vs eth](https://icostats.com/vs-eth)
* [Lawnmower.io](https://lawnmower.io/) - research and tools
* ICO funding https://blog.coinbase.com/app-coins-and-the-dawn-of-the-decentralized-business-model-8b8c951e734f
* Create a token contract: https://tokenfactory.surge.sh/#/factory

## Cryptocurrency exchanges
* [Coinbase](https://coinbase.com) - convert "real money" into bitcoin, ethereum, or litecoin. ACH bank transfers can take a week (!!) for some reason.
* [GDAX](https://gdax.com) - Coinbase's trading platform for bitcoin, ethereum, or litecoin.
* [Kraken](https://www.kraken.com/) - fiat and coin-to-coin exchange.
* [Poloniex](https://poloniex.com) - coin-to-coin exchange; also has lending market and margin trading. (Fun fact: as of June 13
  [this exchange holds about 4.7% of all eth](https://etherscan.io/accounts), or nearly $1.7 billion in US dollars).
* [shapeshift.io](https://shapeshift.io) - coin-to-coin exchange

## Specific tokens
* (REP) Augur - [site](https://augur.net/) || [docs](http://docs.augur.net/#overview) - prediction market, uses REP coins.
* (BAT) Basic Attention Token - [site](https://basicattentiontoken.org/token/) || [whitepaper](https://basicattentiontoken.org/wp-content/uploads/2017/05/BasicAttentionTokenWhitePaper-4.pdf)
* Gnosis - [site](https://gnosis.pm/) || [whitepaper](https://gnosis.pm/resources/default/pdf/gnosis_whitepaper.pdf) - prediction market
* Filecoin - [site](http://filecoin.io/) || [whitepaper (old)](http://filecoin.io/filecoin.pdf) - distributed file serving, get coin for providing storage. See also [ipfs whitepaper](https://github.com/ipfs/papers/raw/master/ipfs-cap2pfs/ipfs-p2p-file-system.pdf)
* (SC) Siacoin - [site](http://sia.tech/) || [wiki](https://siawiki.tech/) - similar to Filecoin in that you're compensated for storing data, but I can't seem to find a whitepaper or similar
* (STRAT) Stratis - [site](http://stratisplatform.com) ||  [whitepaper](https://stratisplatform.com/files/Stratis_Whitepaper.pdf) || [use cases](https://stratisplatform.com/use-cases/)


## Writing Contracts
* General
  * [Solidity](https://solidity.readthedocs.io/en/develop/) - the official docs, but not a great starting place
* Examples
  * [Full Stack Hello World Voting Ethereum Dapp Tutorial — Part 1](https://medium.com/@mvmurthy/full-stack-hello-world-voting-ethereum-dapp-tutorial-part-1-40d2d0d807c2) - writing and deploying simple voting app through geth (by [Mahesh Murthy](https://medium.com/@mvmurthy))
  * [video] [Beginner's Guide: Smart Contracts Programming Tutorial in Solidity 1](https://www.youtube.com/watch?v=R_CiemcFKis) - several parts to this; a good starting point for reading and storing data on the blockchain
* Tools / Frameworks / IDEs
  * [remix](http://ethereum.github.io/remix/) - ethereum ide and tools for the web (BH: awesome, use this)
  * [Truffle](http://truffleframework.com/docs/) "is a world class development environment, testing framework and asset pipeline for Ethereum"
  * [Fast Ethereum RPC client for testing and development](https://github.com/ethereumjs/testrpc)
  * [GDAX-Python](https://github.com/danpaquin/GDAX-Python) - unofficial python library for [GDAX](http://gdax.com) (Coinbase's trading platform) API

## Whitepapers
* Essentials
  * Bitcoin - [whitepaper](https://bitcoin.org/bitcoin.pdf)
  * Ethereum - [whitepaper](https://github.com/ethereum/wiki/wiki/White-Paper) || [yellow paper](http://paper.gavwood.com/)
* Coins
  * BAT (Basic Attention Token)  [whitepaper](https://basicattentiontoken.org/wp-content/uploads/2017/05/BasicAttentionTokenWhitePaper-4.pdf)
  * STRAT (Stratis) [whitepaper](https://stratisplatform.com/files/Stratis_Whitepaper.pdf)
* Blockchain
  * [Applications of Blockchain Technology to Banking And Financial Sector in India](http://idrbt.ac.in/assets/publications/Best%20Practices/BCT.pdf) by Institute for Development and Research in Banking Technology


  ## Oracles
  * oraclize.it - [site](http://www.oraclize.it/) || [docs](http://docs.oraclize.it/) - (oracles help smart contracts fetch external data)

## Things from Pocket to catch up on
* Consensus 2017 NYC Day 2 - 3 hour playback: https://s3.amazonaws.com/media.coindesk.com/live-stream/Day2_Manhattan.html
* Talk: Decentralized Web, IPFS, and Filecoin - Jaun Benet - https://www.youtube.com/watch?v=cU-n_m-snxQ
* Oraclize docs -
* Ethereal Summit 2017 - Introducing: Token (Brian Armstrong - CEO of Coinbase) - https://www.youtube.com/watch?v=3IJ6uWQzzwk
* Ethereum Homstead docs - http://www.ethdocs.org/en/latest/ - maybe fork and edit, kind of rough in places


## Further reading to-do
* DAO's - how structured, read contracts, understand The DAO issue
* Sybil attack
* ERC20 - standard for smart contracts that implement tokens
* Fees
* Gas explained
* Check out: http://cryptofees.net
