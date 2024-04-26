// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

// Unlike functions, state variables cannot be overridden by re-declaring it in the child contract.

contract A {
    string public name = "Contract A";

    function getName() public view returns (string memory){
        return name;
    }
}

contract C is A{
    constructor() {
        name = "Contract C";
    }
}