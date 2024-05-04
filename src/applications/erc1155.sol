// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

/** 
ERC1155 is a novel token standard that aims to take the best from previous standards to create a fungibility-agnostic and gas-efficient token contract.

ERC1155 draws ideas from all of ERC20, ERC721, and ERC777. 
 */

 interface IERC1155 {
    function safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes calldata data) external;
    function safeBatchTransferFrom(address from, address to, uint256[] calldata ids, uint256[] calldata values, bytes calldata data) external;
    function balanceOf(address owner, uint256 id) external view returns (uint256);
    function balanceofBatch(address[] calldata owners, uint256[] calldata ids) external view returns (uint256[] memory);
    function setApprovalForAll(address operator, bool approved) external;
    function isApprovedForAll(address owner, address operator) external view returns (bool);
 }

 contract ERC1155 is IERC1155{
    // Events

    mapping(address => mapping(uint256 => uint256)) public balanceOf;
    mapping(address => mapping(address => bool)) public isApprovedForAll;

    
 }