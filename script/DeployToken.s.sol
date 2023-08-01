// SPDX-License-Identifier: MIT

pragma solidity ^0.7.2;

import {Script} from "forge-std/Script.sol";
import {Token} from "../src/Token.sol";

contract DeployToken is Script {
    function run() external returns (Token) {
        vm.startBroadcast();
        Token token = new Token(20000);
        vm.stopBroadcast();

        return token;
    }
}
