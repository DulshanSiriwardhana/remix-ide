// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

contract Twitter {
    uint256 constant MAX_TWEET_LENGTH = 280;
    struct Tweet {
        address auther;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    mapping(address => Tweet[]) private tweets;

    function createTweet(string memory _tweet) public  {

        require(bytes(_tweet).length <=MAX_TWEET_LENGTH, "Tweet is too long");

        Tweet memory newTweet = Tweet({
            auther: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });
        tweets[msg.sender].push(newTweet);
    }

    function getTweet(address _owner) public view  returns (Tweet[] memory) {
        return tweets[_owner];
    }
    function getMyTweet() public  view returns (Tweet[] memory) {
        return  tweets[msg.sender];
    }
}