// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import {Script} from "forge-std/Script.sol";
import {Delegate, Delegation} from "../../src/Delegation.sol";

contract DeployDelegation is Script {
    function run() external returns (Delegation, Delegate) {
        vm.startBroadcast();
        Delegate delegate = new Delegate(msg.sender);
        Delegation delegation = new Delegation(address(delegate));
        vm.stopBroadcast();

        return (delegation, delegate);
    }
}
