//SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.0;
// pragma experimental SMTChecker;

contract Test {
    
    // SMTChecker is able to verify code that iterates an array, 
    // which requires finding a loop invariant in Floyd-Hoare style program verification
    function test_array_loop_invariant(uint256[] memory arr) pure public {
        require(arr.length > 0, 'size of array arr cannot be zero');
        
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] < 10) {            
                arr[i] = (arr[i] + 10)*(arr[i] + 10);
            }
            else if (arr[i] < 100) {
                arr[i] = arr[i]*(arr[i] + 10) - 100;
            }
        }

        for (uint256 i = 0; i < arr.length; i++) {
            assert(arr[i] >= 100);
        }
    }
}