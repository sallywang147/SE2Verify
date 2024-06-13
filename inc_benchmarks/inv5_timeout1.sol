 //SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.0;
pragma experimental SMTChecker;


contract Test {

  uint256 _totalWeights;
  uint256 Q96;
  uint256[] _fundTokenIdx;
  uint256[] _isTokenInIndex;

  function culpritOne(uint256[] memory _tokens,
        uint256 _weights, 
       // uint256 indexTokens, 
        uint256 FixedPoint96) public {
        require(_tokens.length == _weights, 'INIT');
        
        for (uint256 _i; _i < _tokens.length; _i++) {
                assert(_tokens[_i]>0);
                _totalWeights += _weights;
                assert(_totalWeights>=_weights);
                _fundTokenIdx[_tokens[_i]] = _i;
                _isTokenInIndex[_tokens[_i]] = 1; //replacing "True";
                //assert(_totalWeights >= 1);
        }
        assert(_weights != 0 && FixedPoint96 * _totalWeights > 0); 
        uint256 _xX96 = (FixedPoint96 * _totalWeights) / _weights;

        //assert(_totalWeights > 0 && _weights * _xX96 * 10 ** Q96 > 0);
        for (uint256 _i; _i < _tokens.length; _i++) {
                //assert(_totalWeights != 0 && _weights * _xX96 * 10 ** Q96 > 0);
                assert(_fundTokenIdx[_tokens[_i]] == _i);
                uint256 indexTokens = (_weights * _xX96 * 10 ** Q96) / _totalWeights;
                 assert(indexTokens >=  (_weights * _xX96 * 10 ** Q96));
        }
  }
}