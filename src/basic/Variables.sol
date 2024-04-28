// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;


contract Variables{
    // state variables are stored on the blockchain
    string public text = "Hello";
    uint256 public num = 123;

    function doSomething() public {
        // local variables are not saved to the blockchain
        uint256 i = 456;

        uint256  timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; // address of the caller 
    }
}