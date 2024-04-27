// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

/**
* transfer - 2300 gas, throws error
* send - 2300 gas, returns bool
* call - forward all gas or set gas, returns bool
*
* receive() external payable
* fallback() external payable
* receive() is called if msg.data is empty, otherwise fallback() is called

* call in combination of re-entrancy guard is the recommendation method to use since 2019
 */

 contract ReceiveEther{
        /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
    receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

    receive() external payable{}
    fallback() external payable{}

    function getBalance() public view returns (uint256){
        return address(this).balance;
    }
 }

 contract SendEther{
    function sendViaTransfer(address payable _to) public payable{
        _to.transfer(msg.sender);
    }

    function sendViaSend(address payable _to) public payable{
        bool sent = _to.send(msg.sender);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable{
        (bool sent, bytes memory data) = _to.call{value: msg.sender}{""};
        require(sent,"Failed to send Ether");
    }
 }