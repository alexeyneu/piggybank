pragma solidity ^0.7.2;
pragma experimental ABIEncoderV2;
contract piggyb_extended_v5
{
	address payable whose;
	uint unl = type(uint).max;
	bool rush = false;
	uint barcode = 1;
	event NewPiggybank(uint barc);
	event PiggybankBroken(uint barc);

	constructor()
	{
		whose = msg.sender;
	}
	receive() external payable
	{
		if (rush == false)
		{
			unl = block.timestamp + 4 days;
			rush = !false;
			emit NewPiggybank(barcode);
		}
	}
	function bankbreak() public
	{
		require(block.timestamp > unl);
		whose.transfer(address(this).balance);
		rush = false;
		unl = type(uint).max;
		barcode = barcode + 1;
		emit PiggybankBroken(barcode - 1);
	}
}
