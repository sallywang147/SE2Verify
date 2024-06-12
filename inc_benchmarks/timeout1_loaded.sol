//SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.0;
pragma experimental SMTChecker;

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
                assert(_tokens[_i] >= 0);
                _totalWeights += _weights[_i];
                assert(_weights[_i] <= _totalWeights && _totalWeights <= _weights[_i]**_tokens[_i]);
                _fundTokenIdx[_tokens[_i]] = _i;
                assert(_fundTokenIdx[_tokens[_i]]>=0);
                _isTokenInIndex[_tokens[_i]] = 1; //replacing "True";
                assert(_isTokenInIndex[_tokens[_i]]==_weights[_i]);
                culpritOne(_tokens, _weights, indexTokens, FixedPoint96);
                //assert(_totalWeights >= 1);
        }

        for (uint256 _i; _i < _tokens.length; _i++) {
                assert(_tokens[_i] >= 0);
                _totalWeights += _weights[_i];
                assert(_weights[_i] <= _totalWeights && _totalWeights <= _weights[_i]**_tokens[_i]);
                _fundTokenIdx[_tokens[_i]] = _i;
                assert(_fundTokenIdx[_tokens[_i]]>=0);
                _isTokenInIndex[_tokens[_i]] = 1; //replacing "True";
                assert(_isTokenInIndex[_tokens[_i]]==_weights[_i]);
                culpritOne(_tokens, _weights, indexTokens, FixedPoint96);
                //assert(_totalWeights >= 1);
        }

        for (uint256 _i; _i < _tokens.length; _i++) {
                assert(_tokens[_i] >= 0);
                _totalWeights += _weights[_i];
                assert(_weights[_i] <= _totalWeights && _totalWeights <= _weights[_i]**_tokens[_i]);
                _fundTokenIdx[_tokens[_i]] = _i;
                assert(_fundTokenIdx[_tokens[_i]]>=0);
                _isTokenInIndex[_tokens[_i]] = 1; //replacing "True";
                assert(_isTokenInIndex[_tokens[_i]]==_weights[_i]);
                culpritOne(_tokens, _weights, indexTokens, FixedPoint96);
                //assert(_totalWeights >= 1);
        }
        assert(_weights[0] > 0);
        uint256 _xX96 = (FixedPoint96 * _totalWeights) / _weights[0];
        assert(_xX96 > 0);
        assert(_tokens.length > 0);
        for (uint256 _i; _i < _tokens.length; _i++) {
                assert(_totalWeights != 0);
                indexTokens[_i] = (_weights[_i] * _xX96 * 10 ** _tokens[_i]) / _totalWeights;
                assert((_weights[_i] * _xX96 * 10 ** _tokens[_i])>0);
                assert(indexTokens[_i] >=  (_weights[_i] * _xX96 * 10 ** _tokens[_i]));
        }

                for (uint256 _i; _i < _tokens.length; _i++) {
                assert(_totalWeights != 0);
                indexTokens[_i] = (_weights[_i] * _xX96 * 10 ** _tokens[_i]) / _totalWeights;
                assert((_weights[_i] * _xX96 * 10 ** _tokens[_i])>0);
                assert(indexTokens[_i] >=  (_weights[_i] * _xX96 * 10 ** _tokens[_i]));
        }
       
       

  }
   
}