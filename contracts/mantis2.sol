// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

contract MantisToken {
    string public name = "Mantis-Pro";
    string public symbol = "MNTP";
    uint8 public decimals = 12;
    uint256 public totalSupply = 1_000_000 * 10 ** decimals;
    bool public paused = false;
    address public owner;
    mapping(address => uint256) public balanceOf;
    mapping(address =>mapping(address => uint256)) public allowance;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier notPaused() {
        require(!paused, "Contract is paused");
        _;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Paused();
    event Unpaused();
    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 amount);

    /*
    constructor(uint256 initialSupply) {
        owner = msg.sender;
        _mint(owner, initialSupply);
    }
    */
    constructor(/*uint256 initialSupply*/) {
        owner = msg.sender;
        //_mint(owner, initialSupply);
    }

    function transfer(address to, uint256 amount) public notPaused returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Insufficient Balance");

        balanceOf[msg.sender] -=amount;
        balanceOf[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }
    function approve(address spender, uint256 amount) public notPaused returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }
    function transferFrom(address from, address to, uint256 amount) public notPaused returns (bool) {
        require(balanceOf[from] >= amount , "Insufficient Balance");
        require(allowance[from][msg.sender] >= amount, "Allowance Exceeded");
        allowance[from][msg.sender] -= amount;
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        emit Transfer(from, to, amount);
        return true;
    }
    function pause() external onlyOwner {
        paused = true;
        emit Paused();
    }
    function unpause() external onlyOwner {
        paused = false;
        emit Unpaused();
    }
    function mint(address to, uint256 amount) external  onlyOwner {
        _mint(to, amount);
    }
    
    function burn(uint256 amount) external {
        require(balanceOf[msg.sender] >= amount, "Not enough balance to burn");
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Burn(msg.sender, amount);
        emit Transfer(msg.sender, address(0), amount);
    }
    function _mint(address to, uint256 amount) internal {
        require(to != address(0), "Mint to zero address");
        balanceOf[to] += amount;
        totalSupply += amount;
        emit Mint(to, amount);
        emit Transfer(address(0), to, amount);
    }
    function myBalance() public view  returns (uint256) {
        return balanceOf[msg.sender];
    }
}