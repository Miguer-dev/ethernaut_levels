// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import {Script} from "forge-std/Script.sol";
import {Telephone} from "../../src/Telephone.sol";

contract DeployTelephone is Script {
    function run() external returns (Telephone) {
        vm.startBroadcast();
        Telephone telephone = new Telephone();
        vm.stopBroadcast();

        return telephone;
    }
}
