// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import {Script} from "forge-std/Script.sol";
import {CoinFlip} from "../src/CoinFlip.sol";

contract DeployCoinFlip is Script {
    function run() external returns (CoinFlip) {
        vm.startBroadcast();
        CoinFlip coinFlip = new CoinFlip();
        vm.stopBroadcast();

        return coinFlip;
    }
}