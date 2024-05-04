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
    function balanceOf(address owner) external view returns (uint256 balance);
    function ownerOf(uint256 tokenId) external view returns (address owner);
    function safeTransferFrom(address from, address to, uint256 tokenId) external;
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;
    function transferFrom(address from, address to, uint256 tokenId) external;
    function approve(address to, uint256 tokenId) external;
    function getApproved(uint256 tokenId) external view returns (address operator);
    function setApprovalForAll(address operator, bool _approved) external;
    function isApprovedForAll(address owner, address operator) external view returns (bool);

}

interface IERC721Receiver {
    function onERC721Received(address operator, address from, uint256 tokenId, bytes calldata data) external returns (bytes4);
}

contract ERC721 is IERC721{
    event Approval(address indexed owner, address indexed spender, uint256 indexed id);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    mapping(uint256 => address) internal _ownerOf;
    mapping(address => uint256) internal _balanceOf;
    mapping(uint256 => address) internal _approvals;

    mapping(address => mapping(address => bool)) public isApprovedForAll;

    function supportsInterface(bytes4 interfaceId) external pure returns (bool){
        return interfaceId == type(IERC721).interfaceId || interfaceId == type(IERC165).interfaceId;
    }

    function ownerOf(uint256 id) external view returns (address owner){
        owner = _ownerOf[id];
        require(owner != address(0), "token does not exist");
    }

    function balanceOf(address owner) external view returns(uint256){
        require(owner != address(0), "owner = zero address");
        return _balanceOf[owner];
    }

    function setApprovalForAll(address operator, bool approved) external {
        isApprovedForAll[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
    }

    function approve(address spender, uint256 id) external {
        address owner = _ownerOf[id];
        require(msg.sender == owner || isApprovedForAll[owner][msg.sender], "not authorized");

        _approvals[id] = spender;

        emit Approval(owner, spender, id);
    }

    function getApproved(uint256 id) external view returns (address){
        require(_ownerOf[id] != address(0), "token does not exist");
        return _approvals[id];
    }

    function _isApprovedOrOwner(address owner, address spender, uint256 id)internal view returns (bool){
        return (spender == owner || isApprovedForAll[owner][spender] || spender == _approvals[id]);
    }



}