// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}

contract SelfDestruct{

    receive() external payable {       
    }

    fallback() external payable {        
    }

    function destroyContract(address payable to) public {        
        selfdestruct(to); 
    }
}