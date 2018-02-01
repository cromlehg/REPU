pragma solidity 0.4.18;

import './REPUCommonSale.sol';
import './StagedCrowdsale.sol';

contract Mainsale is StagedCrowdsale, REPUCommonSale {

  address public foundersTokensWallet;

  address public advisorsTokensWallet;

  address public bountyTokensWallet;

  address public lotteryTokensWallet;

  uint public foundersTokensPercent;

  uint public advisorsTokensPercent;

  uint public bountyTokensPercent;

  uint public lotteryTokensPercent;

  function setFoundersTokensPercent(uint newFoundersTokensPercent) public onlyOwner {
    foundersTokensPercent = newFoundersTokensPercent;
  }

  function setAdvisorsTokensPercent(uint newAdvisorsTokensPercent) public onlyOwner {
    advisorsTokensPercent = newAdvisorsTokensPercent;
  }

  function setBountyTokensPercent(uint newBountyTokensPercent) public onlyOwner {
    bountyTokensPercent = newBountyTokensPercent;
  }

  function setLotteryTokensPercent(uint newLotteryTokensPercent) public onlyOwner {
    lotteryTokensPercent = newLotteryTokensPercent;
  }

  function setFoundersTokensWallet(address newFoundersTokensWallet) public onlyOwner {
    foundersTokensWallet = newFoundersTokensWallet;
  }

  function setAdvisorsTokensWallet(address newAdvisorsTokensWallet) public onlyOwner {
    advisorsTokensWallet = newAdvisorsTokensWallet;
  }

  function setBountyTokensWallet(address newBountyTokensWallet) public onlyOwner {
    bountyTokensWallet = newBountyTokensWallet;
  }

  function setLotteryTokensWallet(address newLotteryTokensWallet) public onlyOwner {
    lotteryTokensWallet = newLotteryTokensWallet;
  }

  function calculateTokens(uint _invested) internal returns(uint) {
    uint milestoneIndex = currentMilestone(start);
    Milestone storage milestone = milestones[milestoneIndex];
    uint tokens = _invested.mul(price).div(1 ether);
    uint valueBonusTokens = getValueBonusTokens(tokens, _invested);
    if (milestone.bonus > 0) {
      tokens = tokens.add(tokens.mul(milestone.bonus).div(percentRate));
    }
    return tokens.add(valueBonusTokens);
  }

  function finish() public onlyOwner {
    uint summaryTokensPercent = bountyTokensPercent.add(foundersTokensPercent).add(advisorsTokensPercent).add(lotteryTokensPercent);
    uint mintedTokens = token.totalSupply();
    uint allTokens = mintedTokens.mul(percentRate).div(percentRate.sub(summaryTokensPercent));
    uint foundersTokens = allTokens.mul(foundersTokensPercent).div(percentRate);
    uint advisorsTokens = allTokens.mul(advisorsTokensPercent).div(percentRate);
    uint bountyTokens = allTokens.mul(bountyTokensPercent).div(percentRate);
    uint lotteryTokens = allTokens.mul(lotteryTokensPercent).div(percentRate);
    mintTokens(foundersTokensWallet, foundersTokens);
    mintTokens(advisorsTokensWallet, advisorsTokens);
    mintTokens(bountyTokensWallet, bountyTokens);
    mintTokens(lotteryTokensWallet, lotteryTokens);
    token.finishMinting();
  }

  function endSaleDate() public view returns(uint) {
    return lastSaleDate(start);
  }

}
