// SPDX-License-Identifier: SEE LICENSE IN LICENSE 
pragma solidity ^0.8.19;

interface IERC20 {
    function transfer(address, uint256) external returns(bool);
    function transferFrom(address, address, uint256) external returns (bool);
}

contract CrowdFund {
    // EVENTS


    // STATE VARIABLES

    constructor(){}

    function launch() external {}

    function cancel() external {}

    function pledge() external {}

    function unpledge() external {}

    function claim() external {}

    function refund() external {}
}