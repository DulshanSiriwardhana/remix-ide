// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Base {
    string public baseMsg = "Hello from Base";

    function setBaseMsg(string memory _msg) public {
        baseMsg = _msg;
    }
}

contract Derived is Base {
    string public derivedMsg = "Hello from Derived";

    function setDerivedMsg(string memory _msg) public {
        derivedMsg = _msg;
    }
}