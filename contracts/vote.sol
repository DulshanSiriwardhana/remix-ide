// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Vote {
    mapping(string => uint) public voteReceived;
    string[] public canditates;

    constructor(string[] memory canditateNames) {
        canditates = canditateNames;
    }

    function voteForCandidates(string memory canditate) public {
        voteReceived[canditate] +=1;
    }

    function totalVotesForCandidate(string memory canditate) public view returns (uint) {
        return voteReceived[canditate];
    }
}