// SPDX-Licence-Identifier: MIT

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Calculator {
    uint256 res = 0;

    function add(uint256 num) public  {
        res += num;
    }

    function subs(uint256 num) public {
        res -= num;
    }

    function mul(uint256 num) public {
        res *= num;
    }

    function divide(uint256 num) public {
        if(num == 0) {
            res = res;
        }
        else {
            res /= num;
        }
    }

    function get() public view returns (uint256){
        return res;
    }
}