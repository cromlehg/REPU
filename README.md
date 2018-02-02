![REPU](logo.jpg "REPU")

# REPU smart contract

* _Standart_        : ERC20
* _Name_            : REPU
* _Ticket_          : REPU
* _Decimals_        : 18
* _Emission_        : Mintable
* _Crowdsales_      : 3
* _Fiat dependency_ : No
* _Tokens locked_   : No

## Smart-contracts description

Contract mint bounty and founders tokens after main sale stage finish.
Crowdsale contracts have special function to retrieve tokens transferred by mistake.

### Contracts contains
1. _REPUToken_ - Token contract
2. _ClosedRound_ - Closed round contract
2. _Presale_ - Presale contract
3. _Mainsale_ - ICO contract
4. _Configurator_ - contract with main configuration for production

### How to manage contract
To start working with contract you should follow next steps:
1. Compile it in Remix with enamble optimization flag and compiler 0.4.18
2. Deploy bytecode with MyEtherWallet. Gas 5100000 (actually 5073514).
3. Call 'deploy' function on addres from (3). Gas 4000000 (actually 3979551). 

Contract manager must call finishMinting after each crowdsale milestone!
To support external mint service manager should specify address by calling _setDirectMintAgent_. After that specified address can direct mint VST tokens by calling _directMint_.

### How to invest
To purchase tokens investor should send ETH (above minimum limit) to corresponding crowdsale contract.
Recommended GAS: 250000, GAS PRICE - 21 Gwei.

### Wallets with ERC20 support
1. MyEtherWallet - https://www.myetherwallet.com/
2. Parity 
3. Mist/Ethereum wallet

EXODUS not support ERC20, but have way to export key into MyEtherWallet - http://support.exodus.io/article/128-how-do-i-receive-unsupported-erc20-tokens

Investor must not use other wallets, coinmarkets or stocks. Can lose money.

## Main network configuration

* _Bounty tokens percent_       : 6.25% 
* _Founders tokens percent_     : 12.5% 
* _Advisors tokens percent_     : 3.33% 
* _Lottery tokens percent_      : 0.625% 
* _Bounty tokens wallet_        : 0xaAF9430b8B68146665acB4F05396d63a71d54C4d
* _Founders tokens wallet_      : 0x650F7fcBd397AB0C722D9EfBBd6Cd885d02e8f8F
* _Advisors tokens wallet_      : 0x93b103Ecc79f6ef79038E041704a1083E9C4e1A6
* _Lottery tokens wallet_       : 0xDA7b920F54e14F0Cc5658f0635B45a0839Dbf18C
* _Manager_                     : 0x8c782FAF936ce57Dca60791a47E680e7A34A6315

### Links
1. _Token_ -
2. _Closed sale_
2. _Presale_ -
3. _Mainsale_ -

### Crowdsale stages

#### Closed sale
* _Price_                       : 1 ETH = 12500 REPU
* _Start_                       : Sat Feb 3 2018 10:00:00 GMT
* _End_                         : Thu Feb 22 2018 10:00:00 GMT
* _Minimum insvestment limit_   : 1 ETH
* _Maximum insvestment limit_   : 250 ETH
* _Hardcap_                     : 1000 ETH

##### Value bonus system
* from 2 ETH bonus +2%
* from 11 ETH bonus +5%
* from 51 ETH bonus +7%
* from 101 ETH bonus +10%

#### Presale
* _Base price_                 : 1 ETH = 6854,00959 REPU
* _Hardcap_                    : 1800 ETH
* _Duration_                   : 7 days 
* _Start_                      : Fri Feb 23 2018 10:00:00 GMT
* _Wallet_                     : 0x425dE1C67928834AE72FB7E6Fc17d88d1Db4484b

##### Value bonus system
* from 2 ETH bonus +2%
* from 11 ETH bonus +5%
* from 51 ETH bonus +7%
* from 101 ETH bonus +10%

##### Milestones
1. 1 day                       : bonus +21,59% 
2. 1 day                       : bonus +15,8% 
3. 1 day                       : bonus +10,28% 
4. 1 day                       : bonus +5,04%
5. 3 days                      : without bonus

#### ICO
* _Base price_                 : 1 ETH = 3937.00788 REPU
* _Hardcap_                    : 30 000 ETH
* _Duration_                   : 30 days 
* _Start_                      : Fri Feb 23 2018 10:00:00 GMT
* _Wallet_                     : 0x425dE1C67928834AE72FB7E6Fc17d88d1Db4484b

##### Value bonus system
* from 2 ETH bonus +2%
* from 11 ETH bonus +3%
* from 51 ETH bonus +5%
* from 101 ETH bonus +7%
* from 301 ETH bonus +10%
* from 501 ETH bonus +15%
* from 1000 ETH bonus +20%

##### Milestones
1. 1 week                      : bonus +48,2% 
2. 1 week                      : bonus +29,99% 
3. 1 week                      : bonus +14,01% 
4. 9 days                      : without bonus
