// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

/**
* Merkle trees, also known as Binary hash trees, are a prevalent sort of data structure in computer science.
* In bitcoin and other cryptocurrencies, they're used to encrypt blockchain data more efficiently and securely.
* It's a mathematical data structure made up of hashes of various data blocks that summarize all the transactions in a block.
* It also enables quick and secure content verification across big datasets and verifies the consistency and content of the data.
 */

contract MerkleProof{
    function verify(
        bytes32[] memory proof,
        bytes32 root, 
        bytes32 leaf,
        uint256 index
    ) public pure returns (bool) {
        bytes32 hash = leaf;

        for (uint256 i=0; i < proof.length; i++){
            bytes32 proofElement = proof[i];
            if (index % 2 == 0) {
                hash = keccak256(abi.encodePacked(hash, proofElement));
            } else {
                hash = keccak256(abi.encodePacked(proofElement, hash));
            }

            index = index / 2;
        }

        return hash == root;
    }
}

contract TestMerkleProof is MerkleProof {
    bytes32[] public hashes;

    constructor() {
        string[4] memory transactions = ["alice -> bob", "bob -> dave", "carol -> alice", "dave -> bob"];

        for (uint256 i = 0; i < transactions.length; i++){
            hashes.push(keccak256(abi.encodePacked(transactions[i])));
        } 

        uint256 n = transactions.length;
        uint256 offset = 0;

        while (n > 0) {
            for (uint256 i =0; i < n-1; i +=2 ){
                hashes.push(keccak256(abi.encodePacked(hashes[offset+i], hashes[offset + i + 1])));
            }

            offset += n;
            n = n /2;
        }
    }

    function getRoot() public view returns (bytes32) {
        return hashes[hashes.length - 1];
    }
}

