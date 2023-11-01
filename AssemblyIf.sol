// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

// there is NO ELSE STATEMENT statement in assembly

contract AssemblyIf {
    /**
     * @notice function to use all assembly conditions (lt = lesser than, gt = greater than, eq = equal to)
     * @param x uint num to check
     */
    function yul_if(uint x) public pure returns (uint z) {
        assembly {
            // there is else statement in assembly
            // lt = less than, x is the varibale and 10 is the number we are comparig it with
            if lt(x, 10) {
                z := 99
            }
            // check x > 10
            if gt(x, 10) {
                z := 11
            }
            if eq(x, 10) {
                z := 55
            }
        }
    }

    /**
     * @notice function to use Switch.
     * @param x uint num to check
     */
    function yul_switch(uint x) public pure returns (uint z) {
        assembly {
            switch x // checking the value of X
            // if x == 1 , z = 10;
            case 1 {
                z := 10
            }
            case 2 {
                z := 20
            }
            // if x is neither 1 or 2, z = 0
            default {
                z := 0
            }
        }
    }

    /**
     * @notice function to check the min number between the 2 numbers using If Assembly
     * @param x number 1
     * @param y number 2
     */
    function min(uint x, uint y) public pure returns (uint z) {
        assembly {
            if lt(x, y) {
                z := x
            }
            if lt(y, x) {
                z := y
            }
        }
    }

    /**
     * @notice function to check the MAX number between the 2 numbers using If Assembly
     * @param x number 1
     * @param y number 2
     */
    function max(uint x, uint y) public pure returns (uint z) {
        assembly {
            if gt(x, y) {
                z := x
            }
            if gt(y, x) {
                z := y
            }
        }
    }

    /**
     * @notice function to check the MAX number between the 2 numbers using If Assembly
     * @param x number 1
     * @param y number 2
     */
    function max1(uint x, uint y) public pure returns (uint z) {
        z = y;
        assembly {
            if gt(x, y) {
                z := x
            }
        }
    }

    /**
     * @notice function to check the MAX number between the 2 numbers using SWITCH Assembly
     * @param x number 1
     * @param y number 2
     */
    function maxSwitch(uint x, uint y) public pure returns (uint z) {
        assembly {
            switch gt(x, y)
            case 1 {
                z := x
            }
            default {
                z := y
            }
        }
    }

    /**
     * @notice function to check the MIN number between the 2 numbers using SWITCH Assembly
     * @param x number 1
     * @param y number 2
     */
    function minSwitch(uint x, uint y) public pure returns (uint z) {
        assembly {
            switch lt(x, y)
            case 1 {
                z := x
            }
            default {
                z := y
            }
        }
    }
}
