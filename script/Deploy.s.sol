// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {HelloWorld} from "../src/hello_world.sol";
import {Counter} from "../src/First_app.sol";
import {Script} from "forge-std/Script.sol";

contract Deploy is Script{

    function run() external returns(Counter){

        vm.startBroadcast();
        // HelloWorld helloWorld = new HelloWorld();
        Counter counter = new Counter();
        vm.stopBroadcast();

        // return helloWorld;
        return counter;
    }
}