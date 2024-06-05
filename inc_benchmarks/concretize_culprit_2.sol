//SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.7.6;
pragma abicoder v2;
pragma experimental SMTChecker;


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
        
  function _getNativePriceUSDX96() internal view returns (uint256) {              
                return 100;
        }

 }