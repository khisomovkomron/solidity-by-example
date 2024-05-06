//SPDX-License-Indetifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

interface IERC20Permit {

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns(bool);
    function allowance(address owner, address spender) external view returns(uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s) external; 
}

contract GaslessTokenTransfer{
    function send(
        address token,
        address sender,
        address receiver, 
        uint256 amount,
        uint256 fee,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        IERC20Permit(token).permit(sender, address(this), amount+fee, deadline, v, r, s);
        IERC20Permit(token).transferFrom(sender, receiver, amount);
        IERC20Permit(token).transferFrom(sender, msg.sender, fee);
    }
}