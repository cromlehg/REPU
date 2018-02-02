pragma solidity 0.4.18;

import './math/SafeMath.sol';
import './PercentRateProvider.sol';
import './REPUToken.sol';
import './DevWallet.sol';

contract CommonSale is PercentRateProvider {

  using SafeMath for uint;

  address public wallet;

  address public directMintAgent;

  uint public price;

  uint public start;

  uint public minInvestedLimit;

  REPUToken public token;

  DevWallet public devWallet;

  bool public devWalletLocked;

  uint public hardcap;

  uint public invested;

  modifier isUnderHardcap() {
    require(invested < hardcap);
    _;
  }

  function setHardcap(uint newHardcap) public onlyOwner {
    hardcap = newHardcap;
  }

  modifier onlyDirectMintAgentOrOwner() {
    require(directMintAgent == msg.sender || owner == msg.sender);
    _;
  }

  modifier minInvestLimited(uint value) {
    require(value >= minInvestedLimit);
    _;
  }

  function setStart(uint newStart) public onlyOwner {
    start = newStart;
  }

  function setMinInvestedLimit(uint newMinInvestedLimit) public onlyOwner {
    minInvestedLimit = newMinInvestedLimit;
  }

  function setDirectMintAgent(address newDirectMintAgent) public onlyOwner {
    directMintAgent = newDirectMintAgent;
  }

  function setWallet(address newWallet) public onlyOwner {
    wallet = newWallet;
  }

  function setPrice(uint newPrice) public onlyOwner {
    price = newPrice;
  }

  function setToken(address newToken) public onlyOwner {
    token = REPUToken(newToken);
  }

  function setDevWallet(address newDevWallet) public onlyOwner {
    require(!devWalletLocked);
    devWallet = DevWallet(newDevWallet);
    devWalletLocked = true;
  }

  function calculateTokens(uint _invested) internal returns(uint);

  function mintTokensExternal(address to, uint tokens) public onlyDirectMintAgentOrOwner {
    mintTokens(to, tokens);
  }

  function mintTokens(address to, uint tokens) internal {
    token.mint(this, tokens);
    token.transfer(to, tokens);
  }

  function endSaleDate() public view returns(uint);

  function mintTokensByETHExternal(address to, uint _invested) public onlyDirectMintAgentOrOwner returns(uint) {
    return mintTokensByETH(to, _invested);
  }

  function mintTokensByETH(address to, uint _invested) internal isUnderHardcap returns(uint) {
    invested = invested.add(_invested);
    uint tokens = calculateTokens(_invested);
    mintTokens(to, tokens);
    return tokens;
  }

  function devWithdraw() internal {
    uint received = devWallet.balance;
    uint limit = devWallet.limit();
    if (received < limit) {
      uint shouldSend = limit.sub(received);
      uint value;
      if (msg.value < shouldSend) {
        value = msg.value;
      } else {
        value = shouldSend;
      }
      devWallet.transfer(value);
    }
  }

  function fallback() internal minInvestLimited(msg.value) returns(uint) {
    require(now >= start && now < endSaleDate());
    if (devWallet != address(0)) {
      devWithdraw();
    }
    wallet.transfer(this.balance);
    return mintTokensByETH(msg.sender, msg.value);
  }

  function () public payable {
    fallback();
  }

}

