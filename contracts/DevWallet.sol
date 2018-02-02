pragma solidity 0.4.18;

contract DevWallet {

  uint public date = 1525255200;
  uint public limit = 4500000000000000000;
  address public wallet = 0xEA15Adb66DC92a4BbCcC8Bf32fd25E2e86a2A770;

  function withdraw() public {
    require(now >= date);
    wallet.transfer(this.balance);
  }

  function () public payable {}

}
