pragma solidity 0.4.18;

import './REPUCommonSale.sol';
import './StagedCrowdsale.sol';
import './Mainsale.sol';
import './NextSaleAgentFeature.sol';

contract Presale is NextSaleAgentFeature, StagedCrowdsale, REPUCommonSale {

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
    token.setSaleAgent(nextSaleAgent);
  }

  function endSaleDate() public view returns(uint) {
    return lastSaleDate(start);
  }

}
