//SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.0;
// pragma experimental SMTChecker;

contract Test {
    
    // SMTChecker has basic capabilities on reasoning about accumulation over an array,
    // which is frequently used in DeFi protocols
    function array_accumulation(uint256[] memory arr) pure public {
        require(arr.length <= 100);

        uint256 twice_sum = 0;
        for (uint256 i = 0; i < arr.length; i++) {
            twice_sum += 2;
        }

        assert(twice_sum == 2*arr.length);  // proved in 0.20s individually
        assert(twice_sum <= 200);  // proved in 8.94s individually
        // proved in 9.34s together
        // Same as array_size_issue_1.sol. The maximum array size has a huge impact on CHC solver runtime.
        // 10: 0.47s; 20: 0.72s; 50: 2.15s; 100: 9.34s
    }
}