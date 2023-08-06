// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {Test, console} from "forge-std/Test.sol";
import {King, BlockContract} from "../../src/King.sol";

contract KingTest is Test {
    BlockContract blockContract;
    King king;

    address TEST_USER_OWNER = makeAddr("userOwner");
    address TEST_USER_ATTACKER = makeAddr("userAttacker");
    uint256 constant STARTTING_BALANCE = 100 ether;
    uint256 constant SEND_BALANCE = 1 ether;

    function setUp() external {
        vm.deal(TEST_USER_ATTACKER, STARTTING_BALANCE);
        vm.deal(TEST_USER_OWNER, STARTTING_BALANCE);

        vm.prank(TEST_USER_OWNER);
        king = new King{value: SEND_BALANCE}();

        vm.prank(TEST_USER_ATTACKER);
        blockContract = new BlockContract();
    }

    function testAttackerBlockKingContract() public {
        assert(king._king() == TEST_USER_OWNER);

        uint256 prize = king.prize();
        vm.prank(TEST_USER_ATTACKER);
        blockContract.beKing{value: prize}(king);
        assert(king._king() == address(blockContract));

        vm.prank(TEST_USER_OWNER);
        vm.expectRevert();
        (bool success,) = address(king).call{value: SEND_BALANCE}("");
        require(success);
    }
}
