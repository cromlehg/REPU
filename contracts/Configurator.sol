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
    //owner = 0x8c782FAF936ce57Dca60791a47E680e7A34A6315;

    token = new REPUToken();


    closedRound = new ClosedRound();

    closedRound.setWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A03);
    closedRound.setStart(1518393600);
    closedRound.setEnd(1520640000);
    closedRound.setPrice(1600000000000000000000);
    closedRound.setHardcap(1000000000000000000000);
    closedRound.setMinInvestedLimit(10000000000000000);
    commonConfigure(closedRound, token);

    presale = new Presale();

    presale.addMilestone(2, 40);
    presale.addMilestone(7, 30);
    presale.addMilestone(7, 20);
    presale.addMilestone(7, 10);
    presale.addMilestone(7, 5);
    presale.addMilestone(7, 0);
    presale.setPrice(1000000000000000000000);
    presale.setWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A03);
    presale.setStart(1520640000);
    presale.setHardcap(20000000000000000000000);
    presale.setMinInvestedLimit(10000000000000000);
    commonConfigure(presale, token);


    mainsale = new Mainsale();

    mainsale.addMilestone(2, 40);
    mainsale.addMilestone(7, 30);
    mainsale.addMilestone(7, 20);
    mainsale.addMilestone(7, 10);
    mainsale.addMilestone(7, 5);
    mainsale.addMilestone(7, 0);
    mainsale.setPrice(1000000000000000000000);
    mainsale.setWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A03);
    mainsale.setFoundersTokensWallet(0x650F7fcBd397AB0C722D9EfBBd6Cd885d02e8f8F);
    mainsale.setMarketingTokensWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A05);
    mainsale.setBountyTokensWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A04);
    mainsale.setStart(1520640000);
    mainsale.setHardcap(20000000000000000000000);
    mainsale.setFoundersTokensPercent(15);
    mainsale.setMarketingTokensPercent(8);
    mainsale.setBountyTokensPercent(2);
    mainsale.setMinInvestedLimit(10000000000000000);
    commonConfigure(mainsale, token);

    closedRound.setNextSaleAgent(presale);
    presale.setNextSaleAgent(mainsale);

    token.setSaleAgent(closedRound);

    token.transferOwnership(owner);
    presale.transferOwnership(owner);
    mainsale.transferOwnership(owner);
  }

  function commonConfigure(address saleAddress, address _token) internal {
     REPUCommonSale sale = REPUCommonSale(saleAddress);
     sale.addValueBonus(100000000000000000000, 3);
     sale.addValueBonus(151000000000000000000, 5);
     sale.addValueBonus(201000000000000000000, 8);
     sale.addValueBonus(301000000000000000000, 10);
     sale.addValueBonus(1001000000000000000000, 15);
     sale.addValueBonus(1501000000000000000000, 20);
     sale.setToken(_token);
  }

}

