// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;


/**
* Modifiers are code that can be run before and / or after a function call
* Restict access
* Validate inputs
* Guard against reentrancy hack
 */


 contract FunctionModifier {
    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    modifier validateAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validateAddress(_newOwner){
        owner = _newOwner;
    }

    modifier noReentrancy(){
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 i) public noReentrancy{
        x -= 1;

        if (x > 1) {
            decrement(i-1);
        }
    }

 }