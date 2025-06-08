// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract EventLogger {
    event Log(address,string);
    
    function logCaller() external {
        emit Log(msg.sender,"Hello World");
    }
}