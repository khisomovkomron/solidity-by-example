// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract EtherUnits{
    uint256 public oneWei = 1 wei;
    bool public isOneWei = 1 wei == 1;

    uint256 public oneEther = 1 ether; 
    bool public isOneEther = 1 ether == 1e18;
    
}