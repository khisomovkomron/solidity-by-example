// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

/**
* Events allow logging to the etherium blockchain. 
* Listening to events and updating user interface
* a cheap form of storage
 */

 contract Event {
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public{
        emit Log(msg.sender, "Hello worls:);
        emit Log(msg.sender, "Hello EVM");
        emit AnotherLog();
    }

 }