// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;
pragma experimental SMTChecker;

contract C {
    uint128[] x;
    function pusharray() public {
        x.push(42); x.push(42); x.push(42); x.push(42);
        uint128[] memory y = new uint128[](1);
        y[0] = 23;
        x.push(); x.push(); x.push();
        x = y;
        assert(y[0] == 23);
        assert(x[0] == 0);
        assert(x[1] == 0);
        assert(x[2] == 0);
        assert(x[3] == 0);
        //this is right now: [23]
    }
 /*
 function echidna_test() public returns (bool) {
    assert(x[0] == 23);
  }
  */
}