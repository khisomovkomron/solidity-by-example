// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract Counter{
    uint256 public count;

    function get() public view returns (uint256){
        return count;
    }

    function inc() public {
        count++;
    }

    function dec() public{
        count-=1;
    }
}