// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;
pragma experimental SMTChecker;

contract C {
    uint128[] x;
    function f() public {
        x.push(42); x.push(42); x.push(42); x.push(42);
        uint128[] memory y;// = new uint128[](1);
        y[0] = 23;
        x = y;
        x.push(); x.push(); x.push();
        assert(y[0] == 23);
        assert(x[0] == 0);
        assert(x[1] == 0);
        assert(x[2] == 0);
        assert(x[3] == 0);
        // After resizing the array, its contents are [1, 0, 0, 0],
        // instead of [23, 0, 0, 0]. Resizing can be also be done by
        // assigning to `.length` or by assigning to the `slot` member
        // inside inline assembly.
    }

 function echidna_test() public returns (bool) {
    assert(x[0] == 0);
  }

function echidna_test2() public returns (bool) {
    assert(x[1] == 0);
  }
}