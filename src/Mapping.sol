// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract Mapping{
    mapping(address => uint256) public myMap;

    function get(address _addr) public view returns (uint256){
        return myMap[_addr];
    }

    function set(address _addr, uint256 _i) public {
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        delete myMap[_addr];
    }
}

contract NestedMapping{
    mapping(address=> mapping(uint256 => bool)) public nested;

    function get(address _addr, uint256 _i, bool _boo) public {
        nested[_addr][_i] = _boo;

    }

    function remove(address _addr1, uint256 _i) public{
        delete nested[_addr1][_i];
    }
}