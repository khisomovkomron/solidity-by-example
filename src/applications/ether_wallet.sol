// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable{}

    function withdraw(uint256 _amount) external {
        require(msg.sender == owner, "Caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns(uint256) {
        return address(this).balance;
    }
}