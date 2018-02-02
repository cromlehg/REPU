pragma solidity 0.4.18;

import './ownership/Ownable.sol';
import './REPUToken.sol';
import './ClosedRound.sol';
import './Presale.sol';
import './Mainsale.sol';
import './DevWallet.sol';

contract Configurator is Ownable {

  REPUToken public token;

  ClosedRound public closedRound;

  Presale public presale;

  Mainsale public mainsale;

  DevWallet public devWallet;

  function deploy() public onlyOwner {

    token = new REPUToken();
    closedRound = new ClosedRound();
    presale = new Presale();
    mainsale = new Mainsale();
    devWallet = new DevWallet();

    token.setSaleAgent(closedRound);

    closedRound.setWallet(0x425dE1C67928834AE72FB7E6Fc17d88d1Db4484b);
    closedRound.setStart(1517652000);
    closedRound.setEnd(1519293600);
    closedRound.setPrice(1600000000000000000000);         // 1 REPU = 0.00008 ETH
    closedRound.setHardcap(1000000000000000000000);       // 1000 ETH
    closedRound.setMinInvestedLimit(1000000000000000000); // 1 ETH
    closedRound.setMaxLimit(250000000000000000000);       // 250 ETH
    closedRound.addValueBonus(2000000000000000000, 2);    // > 2 ETH => 2%
    closedRound.addValueBonus(11000000000000000000, 5);   // > 11 ETH => 5%
    closedRound.addValueBonus(51000000000000000000, 7);   // > 51 ETH => 7%
    closedRound.addValueBonus(101000000000000000000, 10); // > 101 ETH => 10%
    closedRound.setToken(token);
    closedRound.setNextSaleAgent(presale);
    closedRound.setDevWallet(devWallet);

    presale.setWallet(0x425dE1C67928834AE72FB7E6Fc17d88d1Db4484b);
    presale.setStart(1519380000);
    presale.setPrice(6854009595613434000000);             // 1 REPU = 0.0001459 ETH
    presale.setPercentRate(10000);
    presale.addMilestone(1, 2159);                        // 8333.7902 REPU / ETH
    presale.addMilestone(1, 1580);                        // 7936.9431 REPU / ETH
    presale.addMilestone(1, 1028);                        // 7558.6017 REPU / ETH
    presale.addMilestone(1, 504);                         // 7199.4516 REPU / ETH
    presale.addMilestone(3, 0);                           // 6854.0095 REPU / ETH
    presale.setHardcap(1800000000000000000000);           // 1800 ETH
    presale.setMinInvestedLimit(100000000000000000);      // 0.1 ETH
    presale.addValueBonus(2000000000000000000, 200);      // > 2 ETH => 2%
    presale.addValueBonus(11000000000000000000, 500);     // > 11 ETH => 5%
    presale.addValueBonus(51000000000000000000, 700);     // > 51 ETH => 7%
    presale.addValueBonus(101000000000000000000, 1000);   // > 101 ETH => 10%
    presale.addValueBonus(301000000000000000000, 1500);   // > 301 ETH => 15%
    presale.setToken(token);
    presale.setNextSaleAgent(mainsale);
    presale.setDevWallet(devWallet);

    mainsale.setWallet(0x29b637Ca54Fc1A9d8d92475f8a64C199c91B82E4);
    mainsale.setStart(1522663200);
    mainsale.setPrice(3937007874015748300000);                // 1 REPU = 0.0002540 ETH
    presale.setPercentRate(100000);
    mainsale.addMilestone(7, 48200);                          // 5834.6456 REPU / ETH
    mainsale.addMilestone(7, 29990);                          // 5117.7165 REPU / ETH
    mainsale.addMilestone(7, 14010);                          // 4488.5826 REPU / ETH
    mainsale.addMilestone(9, 0);                              // 3937.0078 REPU / ETH
    mainsale.setHardcap(30000000000000000000000);             // 30 000 ETH
    mainsale.setMinInvestedLimit(30000000000000000);          // 0.03 ETH
    mainsale.addValueBonus(2000000000000000000, 2000);        // > 2 ETH => 2%
    mainsale.addValueBonus(11000000000000000000, 3000);       // > 11 ETH => 3%
    mainsale.addValueBonus(51000000000000000000, 5000);       // > 51 ETH => 5%
    mainsale.addValueBonus(101000000000000000000, 7000);      // > 101 ETH => 7%
    mainsale.addValueBonus(301000000000000000000, 10000);     // > 301 ETH => 10%
    mainsale.addValueBonus(501000000000000000000, 15000);     // > 501 ETH => 15%
    mainsale.addValueBonus(1000000000000000000000, 20000);    // > 1000 ETH => 20%
    mainsale.setFoundersTokensWallet(0x650F7fcBd397AB0C722D9EfBBd6Cd885d02e8f8F);
    mainsale.setFoundersTokensPercent(12500);
    mainsale.setAdvisorsTokensWallet(0x93b103Ecc79f6ef79038E041704a1083E9C4e1A6);
    mainsale.setAdvisorsTokensPercent(3330);
    mainsale.setBountyTokensWallet(0xaAF9430b8B68146665acB4F05396d63a71d54C4d);
    mainsale.setBountyTokensPercent(6250);
    mainsale.setLotteryTokensWallet(0xDA7b920F54e14F0Cc5658f0635B45a0839Dbf18C);
    mainsale.setLotteryTokensPercent(625);
    mainsale.setDevWallet(devWallet);

    address manager = 0x8c782FAF936ce57Dca60791a47E680e7A34A6315;

    token.transferOwnership(manager);
    presale.transferOwnership(manager);
    mainsale.transferOwnership(manager);
  }

}
