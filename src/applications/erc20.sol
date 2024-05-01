// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

/**
* ERC20 tokens provide functionalities to:
* - transfer tokens
* - allow others to transfer tokens on behalf of the token holder
*
* ERC20 Interface has 6 functions:
* - totalSupply
* - balanceOf
* - transfer
* - allowance
* - approve
* - transferFrom
 */

 interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns(bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns(bool);  
 }

 // Example of ERCO20 token contract

contract ERC20 is IERC20{
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    string public name;
    string public symbol;
    uint8 public decimals;

    constructor(string memory _name, string memory _symbol, uint8 _decimals){
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
    }

    function transfer(address recipient, uint256 amount) external returns(bool){}

    function approve(address sender, address recipient, uint256 amount) external returns (bool){}

    function transferFrom(address sender, address recipient, uint256 amount) external returns(bool){}

    function _mint(address to, uint256 amount) internal {}

    function _burn(address from, uint256 amount) internal {}

    function mint(address to, uint256 amount) external {}

    function burn(address from, uint256 amount) external {}


}