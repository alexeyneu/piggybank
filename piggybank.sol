pragma solidity ^0.5.3
contract piggyb
{
	address payable cr;
	uint unl;
	uint balance = 0;
	
	constructor() public
	{
		cr = msg.sender;
		unl = now + 11 minutes;
	}
	function() external payable
	{
		dep();
	}
	function dep() public payable
	{
		balance = balance + msg.value;
	}
	function bankbreak() public
	{
		require(now > unl);
		cr.transfer(balance);
		selfdestruct(cr);
	}
}
