//SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.0;
// pragma experimental SMTChecker;

contract Test {

    // SMTChecker's CHC engine exhibits poor scalability similar to bounded loop unrolling.
    function false_out_of_bounds_warning(uint256[] memory arr, uint256 n) pure public {
        require(arr.length == n);
        require(n >= 200);  // The bigger this number, the longer verification takes to rule out out of bound access.
        // n >= 10: 0.36s
        // n >= 20: 0.52s 
        // n >= 50: 1.18s
        // n >= 100: 2.66s
        // n >= 200: 6.78s
        for (uint256 i = 0; i < n; i++) {
            arr[i] = 10;
        }
    }
   
}