pragma solidity 0.4.18;

import './REPUCommonSale.sol';
import './Presale.sol';
import './NextSaleAgentFeature.sol';

contract ClosedRound is NextSaleAgentFeature, REPUCommonSale {

  uint public maxLimit; 

  uint public end;

  function calculateTokens(uint _invested) internal returns(uint) {
    uint tokens = _invested.mul(price).div(1 ether);
    return tokens.add(getValueBonusTokens(tokens, _invested));
  }

  function setMaxLimit(uint newMaxLimit) public onlyOwner {
    maxLimit = newMaxLimit;
  }

  function setEnd(uint newEnd) public onlyOwner {
    end = newEnd;
  }

  function finish() public onlyOwner {
    token.setSaleAgent(nextSaleAgent);
  }

  function fallback() internal returns(uint) {
    require(msg.value <= maxLimit);
    return super.fallback();
  }

  function endSaleDate() public view returns(uint) {
    return end;
  }

}
