// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract AssemblyBinExp {
    function rpw(
        uint256 x,
        uint256 n,
        uint256 b
    ) public pure returns (uint256 z) {
        assembly {
            switch x
            // when x == 0
            case 0 {
                switch n
                // n = 0 --> x ** n = 0 ** 0 --> 1
                case 0 {
                    z := b
                }
                // n > 0 --> x ** n = 0 ** n --> 0
                default {
                    z := 0
                }
            }
            default {
                // algo
                switch mod(n, 2)
                // x > 0 and n is even --> z = 1
                case 0 {
                    z := b
                }
                // x > 0 and n is odd --> z = x
                default {
                    z := x
                }

                // n = n/2, while n > 0, n= n/2
                for {
                    n := div(n, 2)
                } n {
                    n := div(n, 2)
                } {
                    let xx := mul(x, x)
                    if iszero(eq(div(xx, x), x)) {
                        revert(0, 0)
                    }
                    x := div(xx, b)
                    if mod(n, 2) {
                        let zx := mul(z, x)
                        if and(iszero(iszero(x)), iszero(eq(div(zx, x), z))) {
                            revert(0, 0)
                        }
                        z := div(zx, b)
                    }
                }
            }
        }
    }
}
