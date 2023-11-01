// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract AssemblyIf{
    function yul_if(uint x) public pure returns (uint z) {
        assembly{
            // there is else statement in assembly
            // lt = less than, x is the varibale and 10 is the number we are comparig it with
            if lt(x,10){
                z := 99
            }
            if gt(x,10){
                z:= 11
            }
            if eq(x,10){
                z:= 55
            }
        }
    }

     function yul_switch(uint x) public pure returns (uint z) {
        assembly{
            switch x
            case 1 {
                z := 10
            }
            case 2 {
                z := 20
            }
            default {
                z := 0
            }
        }
    }

    function min(uint x, uint y) public pure returns (uint z) {
        assembly{
            if lt(x,y){z := x}
            if lt(y,x){z := y}
        }
    }

    function max(uint x, uint y) public pure returns(uint z){
        assembly{
            if gt(x,y){z := x}
            if gt(y,x){z := y}
        }
    }

    function max1(uint x, uint y) public pure returns(uint z){
        z = y;
        assembly{
            if gt(x,y){z := x}
        }
    }

    function maxSwitch(uint x, uint y) public pure returns(uint z){
        assembly{
            switch gt(x,y) 
            case 1 {
                z := x
            }
            case 0 {
                z := y
            }
        }
    }
}