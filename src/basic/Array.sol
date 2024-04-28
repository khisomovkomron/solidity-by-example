// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract Array {
    uint256[] public arr;
    uint256[] public arr2 = [1,2,3];
    uint256[10] public myFixedSizedArr;

    function get(uint256 i) public view returns(uint256){
        return arr[i];
    }

    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 i) public {
        arr.push(i);
    }

    function pop() public {
        arr.pop();
    }

    function getLength() public view returns (uint256){
        return arr.length;
    }

    function remove(uint256 index) public{
        delete arr[index];
    }

    function examples() external {
        uint256[] memory a = new uint256[](5);
    }

}

contract ArrayRemovingByShifting{

    uint256[] public arr; 

    function remove(uint256 _index) public{
        require(_index <arr.length, "index out of bound");

        for (uint256 i = _index; i < arr.length - 1; i++){
            arr[i] = arr[i+1];
        } 
        arr.pop();
    }
}