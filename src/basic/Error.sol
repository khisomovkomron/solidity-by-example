// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;


/**
* an error will undo all changes made to the state during a transaction
* require - is used to validate inputs and conditions before execution
* revert - is similar to require
* assert - is used to check for code that should never be false. Failing assertion probably means that there is a bug
 */

 contract Error {
    function testRequire(uint256 _i) public pure{
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint256 _i) public pure{
        if (_i <=10) {
            revert("Input must be greater than 10");
        }
    }

    uint256 public num;

    function testAssert() public view{
        assert(num == 10);
    }

    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function testCustomError(uint256 _withdrawAmount) public view{
        uint256 bal = address(this).balance;

        if (bal < _withdrawAmount){
            revert InsufficientBalance({
                balance: bal,
                withdrawAmount: _withdrawAmount
            });
        }
    }
 }