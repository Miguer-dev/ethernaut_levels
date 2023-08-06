// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {Test, console} from "forge-std/Test.sol";
import {Force, SelfDestruct} from "../../src/Force.sol";
import {DeployForce} from "../../script/deploy/DeployForce.s.sol";

contract ForceTest is Test {
    DeployForce deployForce;
    Force force;
    SelfDestruct selfDestruct;

    address TEST_USER_ATTACKER = makeAddr("userAttacker");
    uint256 constant STARTTING_BALANCE = 100 ether;
    uint256 constant SEND_BALANCE = 1 ether;

    function setUp() external {
        vm.deal(TEST_USER_ATTACKER, STARTTING_BALANCE);

        deployForce = new DeployForce();
        (force, selfDestruct) = deployForce.run();
    }

    function testAttackerAddBalance() public {
        vm.prank(TEST_USER_ATTACKER);
        (bool success,) = address(selfDestruct).call{value: SEND_BALANCE}("");
        require(success);
        selfDestruct.destroyContract(payable(address(force)));

        assert(address(force).balance > 0);
    }
}
