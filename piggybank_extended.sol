pragma solidity ^0.7.2;
pragma experimental ABIEncoderV2;
contract piggyb_extended_v4
{
	address payable whose;
	uint unl = type(uint).max;
	bool rush = false;

	constructor() public
	{
		whose = msg.sender;
	}
	fallback() external payable
	{
		if (rush == false)
		{
			unl = block.timestamp + 4 days;
			rush = !false;
		}
	}
	function bankbreak() public
	{
		require(block.timestamp > unl);
		whose.transfer(address(this).balance);
		rush = false;
		unl = type(uint).max;
	}
}
