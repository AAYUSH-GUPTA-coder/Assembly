// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract AssemblyVariable {
    function yul_let() public pure returns (uint z) {
        // declear assembly
        assembly {
            // := is used to set the value, let is the datatype
            let x := 123
            z := 989
        }
    }
}
