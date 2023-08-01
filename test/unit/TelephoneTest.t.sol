// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {Test, console} from "forge-std/Test.sol";
import {Telephone} from "../../src/Telephone.sol";

contract TelephoneTest is Test {
    Telephone telephone;

    address TEST_USER_OWNER = makeAddr("userOwner");
    address TEST_USER_ATTACKER = makeAddr("userAttacker");
    uint256 constant STARTTING_BALANCE = 100 ether;

    function setUp() external {
        vm.deal(TEST_USER_OWNER, STARTTING_BALANCE);
        vm.deal(TEST_USER_ATTACKER, STARTTING_BALANCE);

        vm.prank(TEST_USER_OWNER);
        telephone = new Telephone();
    }

    function testOwner() public {
        assertEq(telephone.owner(), TEST_USER_OWNER);
    }

    function testAttackerChangeOwner() public {
        telephone.changeOwner(TEST_USER_ATTACKER);
        assertEq(telephone.owner(), TEST_USER_ATTACKER);
    }
}
