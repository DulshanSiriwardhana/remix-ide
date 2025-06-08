// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Wallet {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable { }

    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Not the owner");
        payable(owner).transfer(_amount);
    }

    function getBalance() public view returns (uint)
    {
        return address(this).balance;
    }
}