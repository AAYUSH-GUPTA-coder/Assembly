// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AssemblyMath {
    // check Overflow
    function yul_add(uint x, uint y) public pure returns(uint z){
        assembly {
            z := add(x,y)
            if lt(z,x){
                revert(0,0)
            }
        }
    }

    // check overflow
    function yul_mul(uint x, uint y) public pure returns(uint z){
        assembly{
            switch x
            case 0 {z := 0}
            default {
                z := mul(x,y)
                // iszero is an opcode that checks if the value at the top of the stack is zero.
                if iszero(eq(div(z,x), y)) {
                    revert (0,0)
                }
            }
        }
    }

    function yul_fixed_point_round(uint x, uint b) public pure returns(uint z){
        assembly{
            // x = 90
            // b = 100
            // half = b /2 = 50
            // z = x + half = 140
            // z = 140 / 100 * 100 = 100

            let half := div(b,2)
            z := add(x,half)
            z := mul(div(z,b), b)
        }
    }

    // Underflow
    function sub(uint x, uint y) public pure returns (uint z) {
        assembly{
            // 100 - 110
            // 100 -10 
            z := sub(x,y)
            if lt(x,z){
                revert(0,0)
            }
        }
    }
} 