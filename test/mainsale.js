import capped from './mainsale/capped';
import common from './mainsale/common';
import milestonebonus from './mainsale/milestonebonus';
import valuebonus from './mainsale/valuebonus';

const token = artifacts.require('REPUToken.sol');
const crowdsale = artifacts.require('Mainsale.sol');

contract('Mainsale - common test', function (accounts) {
  common(token, crowdsale, accounts);
});

contract('Mainsale - capped crowdsale test', function (accounts) {
  capped(token, crowdsale, accounts);
});

contract('Mainsale - value bonus test', function (accounts) {
  valuebonus(token, crowdsale, accounts);
});

contract('Mainsale - milestone bonus test', function (accounts) {
  milestonebonus(token, crowdsale, accounts);
});
