// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {Test, console} from "forge-std/Test.sol";
import {CoinFlip} from "../../src/CoinFlip.sol";

contract CoinFlipTest is Test {
    CoinFlip coinFlip;

    address TEST_USER = makeAddr("user");
    uint256 constant STARTTING_BALANCE = 100 ether;
    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function setUp() external {
        vm.deal(TEST_USER, STARTTING_BALANCE);
        vm.prank(TEST_USER);
        coinFlip = new CoinFlip();
    }

    function testGuessFlip() public {
        uint256 flipValue = getCoinFlip();
        console.log(flipValue);
        bool side = flipValue == 1 ? true : false;
        coinFlip.flip(side);

        assert(coinFlip.consecutiveWins() > 0);
    }

    function getCoinFlip() internal view returns (uint256) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        return blockValue / FACTOR;
    }
}
