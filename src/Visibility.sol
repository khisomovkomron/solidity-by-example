// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

/**
* public - any contract and account can call
* private - only inside the contract defines the function
* internal - ony inside the contract that inherits an internal function
* external - only other contracts and accounts can call
*
* State variables can be declared as public, private, or internal but not external
 */

 contract Base {
    // can be called only inside this contract
    function privateFunc() private pure returns (string memory){
        return "private fucntion called";
    }

    function testPrivateFunc() public pure returns (string memory){
        return privateFunc();
    }

    // can be called inside this contract and inherited contract
    function internalFunc() internal pure returns (string memory){
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory){
        return internalFunc();
    }

    // can be called everywhere
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    // can only be called outside of this contract
    function externalFunc() external pure returns (string memory){
        return "external function called";
    }

    string private privateVar = "my private variable";
    string internal internalVar = "my private variable";
    string public publicVar = "my public variable";
}

contract Child is Base{

    function testInternalFunc() public pure override returns (string memory){
        return internalFunc();
    }
}