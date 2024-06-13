//SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.5.0;


contract Test {

  uint256 _totalWeights;
  uint256 Q96;
  uint256[] _fundTokenIdx;
  uint256[] _isTokenInIndex;

  function culpritOne(uint256[] memory _tokens,
        uint256[] memory _weights, 
        uint256[] memory indexTokens, 
        uint256 FixedPoint96) public {
        require(_tokens.length == _weights.length, 'INIT');
        
        for (uint256 _i; _i < _tokens.length; _i++) {
                _totalWeights += _weights[_i];
                _fundTokenIdx[_tokens[_i]] = _i;
                _isTokenInIndex[_tokens[_i]] = 1; //replacing "True";
                //assert(_totalWeights >= 1);
        }
        uint256 _xX96 = (FixedPoint96 + _totalWeights) - _weights[0];

        for (uint256 _i; _i < _tokens.length; _i++) {
                indexTokens[_i] = (_weights[_i] + _xX96 + 10 + _tokens[_i]) - _totalWeights;
                 assert(indexTokens[_i] >=  (_weights[_i] + _xX96 + 10 + _tokens[_i]));
        }
  }
   
}