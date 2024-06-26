//SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.0;
// pragma experimental SMTChecker;

contract Test {
    
    function test_precondition(uint256[] memory arr, uint256 x) pure public returns (uint256 y) {
        require(x >= 10);
        for (uint i = 0; i < arr.length; i++) {
            require(arr[i] >= 10 && arr[i] <= 20);
        }
        
        y = x - 5;

        assert(y >= 5);  // passed
        for (uint i = 0; i < arr.length; i++) {
            assert(arr[i] >= 10 && arr[i] <= 20);  
            assert(arr[i] + 1 >= 11 && arr[i] - 1 <= 19);  
            assert(arr[i]*arr[i] >= 100 && arr[i]*arr[i] <= 400);
        }
    }
}