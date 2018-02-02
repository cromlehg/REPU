pragma solidity 0.4.18;

import './ownership/Ownable.sol';
import './REPUToken.sol';
import './ClosedRound.sol';
import './Presale.sol';
import './Mainsale.sol';

contract Configurator is Ownable {

  REPUToken public token;

  ClosedRound public closedRound;

  Presale public presale;

  Mainsale public mainsale;

  function deploy() public onlyOwner {

    token = new REPUToken();
    closedRound = new ClosedRound();
    presale = new Presale();
    mainsale = new Mainsale();

    token.setSaleAgent(closedRound);

    closedRound.setWallet(0x425dE1C67928834AE72FB7E6Fc17d88d1Db4484b);
    // closedRound.setStart();
    // closedRound.setEnd();
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

    presale.setWallet(0x425dE1C67928834AE72FB7E6Fc17d88d1Db4484b);
    // presale.setStart();
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

    mainsale.setWallet(0x29b637Ca54Fc1A9d8d92475f8a64C199c91B82E4);
    // mainsale.setStart();
    mainsale.setPrice(3937007874015748300000);            // 1 REPU = 0.0002540 ETH
    presale.setPercentRate(10000000);
    mainsale.addMilestone(7, 482000);                     // 5834.6456 REPU / ETH
    mainsale.addMilestone(7, 299900);                     // 5117.7165 REPU / ETH
    mainsale.addMilestone(7, 140100);                     // 4488.5826 REPU / ETH
    mainsale.addMilestone(7, 0);                          // 3937.0078 REPU / ETH
    mainsale.setHardcap(30000000000000000000000);         // 30 000 ETH
    mainsale.setMinInvestedLimit(30000000000000000);      // 0.03 ETH
    mainsale.addValueBonus(2000000000000000000, 2);       // > 2 ETH => 2%
    mainsale.addValueBonus(11000000000000000000, 3);      // > 11 ETH => 3%
    mainsale.addValueBonus(51000000000000000000, 5);      // > 51 ETH => 5%
    mainsale.addValueBonus(101000000000000000000, 7);     // > 101 ETH => 7%
    mainsale.addValueBonus(301000000000000000000, 10);    // > 301 ETH => 10%
    mainsale.addValueBonus(501000000000000000000, 15);    // > 501 ETH => 15%
    mainsale.addValueBonus(1000000000000000000000, 20);   // > 1000 ETH => 20%
    mainsale.setFoundersTokensWallet(0x650F7fcBd397AB0C722D9EfBBd6Cd885d02e8f8F);
    mainsale.setFoundersTokensPercent(1250000);
    mainsale.setAdvisorsTokensWallet(0x650F7fcBd397AB0C722D9EfBBd6Cd885d02e8f8F);
    mainsale.setAdvisorsTokensPercent(333000);
    mainsale.setBountyTokensWallet(0x650F7fcBd397AB0C722D9EfBBd6Cd885d02e8f8F);
    mainsale.setBountyTokensPercent(625000);
    mainsale.setLotteryTokensWallet(0x650F7fcBd397AB0C722D9EfBBd6Cd885d02e8f8F);
    mainsale.setLotteryTokensPercent(625);

    address manager = 0x8c782FAF936ce57Dca60791a47E680e7A34A6315;

    token.transferOwnership(manager);
    presale.transferOwnership(manager);
    mainsale.transferOwnership(manager);
  }

}
