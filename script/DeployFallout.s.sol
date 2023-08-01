// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import {Script} from "forge-std/Script.sol";
import {Fallout} from "../src/Fallout.sol";

contract DeployFallout is Script {
    function run() external returns (Fallout) {
        vm.startBroadcast();
        Fallout fallout = new Fallout();
        vm.stopBroadcast();

        return fallout;
    }
}
