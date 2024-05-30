// SPDX-License-Identifier: GPL-3.0
pragma solidity^0.8.2;
pragma experimental SMTChecker;

/*garbage collection bug*/
contract Foo {
    uint256[] internal numbers = new uint256[](1);

    function addNumber(uint256 number) public {
        numbers.push(number);
    }
    /***
    With legacy codegen, 
    when uint40 is returned from a function, 
    the value is truncated. 
    In the code below, if a value larger than uint40 is passed to getNumber, 
    it is truncated to 40 bits. This means that the results of getNumber(0) and getNumber(2**40) are the same.

    With viaIR codegen, the value is not truncated and some garbage remains in memory. 
    Thus, the actual index accessed in the numbers array is not correct, 
    so executing getNumber(2**40) results in an 'Array index out of bound' panic error.
    ***/

    function getNumber(uint256 index) public view returns (uint256) {
        return numbers[_convertToUint40(index)];
    }

    function _convertToUint40(uint256 n) internal pure returns (uint40 result) {
        assembly {
            result := n
        }
    }

    function test_num() public view returns (bool) {
        assert(getNumber(0) == getNumber(2**40));
    }
}