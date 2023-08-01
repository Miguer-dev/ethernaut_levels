// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {Test, console} from "forge-std/Test.sol";
import {CoinFlip} from "../../src/CoinFlip.sol";

contract CoinFlipTest is Test {
    CoinFlip coinFlip;

    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function setUp() external {
        coinFlip = new CoinFlip();
    }

    function testGuessFlip() public {
        coinFlip.flip(getCoinFlip());
        assert(coinFlip.consecutiveWins() > 0);
    }

    function getCoinFlip() internal view returns (bool) {
        uint256 blockValue = (uint256(blockhash(block.number - 1))) / FACTOR;
        console.log(uint256(blockhash(block.number - 1)));
        console.log((uint256(blockhash(block.number - 1))) / FACTOR);
        bool side = blockValue == 1 ? true : false;
        console.log(side);
        return side;
    }
}
