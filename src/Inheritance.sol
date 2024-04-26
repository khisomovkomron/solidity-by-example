// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

/**
* Contract can inherit other contract by using the is keyword
* Function that is going to be overriden by a child contract must be declared as virtual
* Function that is going to override a parent function must use the keyword override 
* Order of inheritance is important
 */

 /* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/


contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B  is A {
    function foo() public pure virtual override returns(string memory){
        return "B";
    }
}

contract C is A{
    function foo() public pure virtual override returns(string memory){
        return "C";
    }
}

contract D is B, C{
    function foo() public pure override(B, C) returns (string memory){
        return super.foo();
    }
}

contract E is C, B {
    function foo() public pure override(C, B) returns (string memory){
        return super.foo();
    }
}