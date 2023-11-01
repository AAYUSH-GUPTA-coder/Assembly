// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract AssemblyError {
    function yul_revert(uint x) public pure {
        assembly {
            // revert(p,s) - end execution
            // This tells the EVM which part of the memory to return with the revert
            // p = start of the memory
            // s = size of code memory
            // p+s = end of the memory

            // return data mem[p..(p+s)]
            // This is used to encode some kind of error message when we call the function
            if gt(x, 10) {
                revert(0, 0)
            }

            // Revert all the state changes
        }
    }
}
