//SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.7.6;
pragma abicoder v2;
pragma experimental SMTChecker;

import './FixedPoint96.sol';
import './IERC20Metadata.sol';
import './IUniswapV2Pair.sol';
import './IV3TwapUtilities.sol';
import './DecentralizedIndex.sol';

abstract contract WeightedIndex is DecentralizedIndex {
  using SafeERC20 for IERC20;

  IUniswapV2Factory immutable V2_FACTORY;

  uint256 _totalWeights;

  
  constructor(
    string memory _name,
    string memory _symbol,
    uint256 _bondFee,
    uint256 _debondFee,
    address[] memory _tokens,
    uint256[] memory _weights,
    address _lpRewardsToken,
    address _v2Router,
    address _dai,
    bool _stakeRestriction,
    IV3TwapUtilities _v3TwapUtilities
  )
    DecentralizedIndex(
      _name,
      _symbol,
      _bondFee,
      _debondFee,
      _lpRewardsToken,
      _v2Router,
      _dai,
      _stakeRestriction,
      _v3TwapUtilities
    )
  {   indexType = IndexType.WEIGHTED;
    V2_FACTORY = IUniswapV2Factory(IUniswapV2Router02(_v2Router).factory());}
   /*
    indexType = IndexType.WEIGHTED;
    V2_FACTORY = IUniswapV2Factory(IUniswapV2Router02(_v2Router).factory());
    require(_tokens.length == _weights.length, 'INIT');
   
    for (uint256 _i; _i < _tokens.length; _i++) {
      indexTokens.push(
        IndexAssetInfo({
          token: _tokens[_i],
          basePriceUSDX96: 0,
          weighting: _weights[_i],
          c1: address(0),
          q1: 0 // amountsPerIdxTokenX96
        })
      );
      _totalWeights += _weights[_i];
      _fundTokenIdx[_tokens[_i]] = _i;
      _isTokenInIndex[_tokens[_i]] = true;
    }

    // at idx == 0, need to find X in [1/X = tokenWeightAtIdx/totalWeights]
    // at idx > 0, need to find Y in (Y/X = tokenWeightAtIdx/totalWeights)
    uint256 _xX96 = (FixedPoint96.Q96 * _totalWeights) / _weights[0];

    for (uint256 _i; _i < _tokens.length; _i++) {
      indexTokens[_i].q1 =
        (_weights[_i] * _xX96 * 10 ** IERC20Metadata(_tokens[_i]).decimals()) /
        _totalWeights;
    }

  }
   */
}