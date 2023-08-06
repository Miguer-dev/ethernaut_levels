// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {Test, console} from "forge-std/Test.sol";
import {Fallout} from "../../src/Fallout.sol";
import {DeployFallout} from "../../script/deploy/DeployFallout.s.sol";

contract FalloutTest is Test {
    DeployFallout deployFallout;
    Fallout fallout;
    
    address TEST_USER_ATTACKER = makeAddr("userAttacker");
    uint256 constant STARTTING_BALANCE = 100 ether;

    function setUp() external {        
        vm.deal(TEST_USER_ATTACKER, STARTTING_BALANCE);

        deployFallout = new DeployFallout();
        fallout = deployFallout.run();
    }

    function testOwner() public {
        assertEq(fallout.owner(), address(0));
    }

    function testAttackerChangeOwner() public {
        vm.prank(TEST_USER_ATTACKER);
        fallout.Fal1out();

        assertEq(fallout.owner(), TEST_USER_ATTACKER);
    }
}
