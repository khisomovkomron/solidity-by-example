// SPDX-Licence-Identifier: SEE LICENSE IN LICENSE 
pragma solidity ^0.8.19;

/**
We’ve discussed how you can make a fungible token using ERC20, 
but what if not all tokens are alike? This comes up in situations 
like real estate, voting rights, or collectibles, where some items 
are valued more than others, due to their usefulness, rarity, etc. 
ERC721 is a standard for representing ownership of non-fungible tokens, 
that is, where each token is unique. 

*/

interface IERC165 {
    function supportsInterface(bytes4 interfaceID) external view returns (bool);

}

interface IERC721 is IERC165 {
    function balanceOf() external view returns (uint256 balance);
    function ownerOf() external view returns (address owner);
    function safeTransferFrom() external;
    function safeTransferFrom() external;
    function transferFrom() external;
    function approve() external;
    function getApproved() external view returns (address operator);
    function setApprovalForAll() external;
    function isApprovedForAll() external view returns (bool);

}