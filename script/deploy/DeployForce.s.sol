// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import {Script} from "forge-std/Script.sol";
import {Force, SelfDestruct} from "../../src/Force.sol";

contract DeployForce is Script {
    function run() external returns (Force, SelfDestruct) {
        vm.startBroadcast();
        Force force = new Force();
        SelfDestruct selfDestruct = new SelfDestruct();
        vm.stopBroadcast();

        return (force, selfDestruct);
    }
}
