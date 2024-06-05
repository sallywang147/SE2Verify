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
                
                IUniswapV2Pair _nativeStablePool = IUniswapV2Pair(
                V2_FACTORY.getPair(DAI, WETH)
                );
                address _token0 = _nativeStablePool.token0();
                (uint8 _decimals0, uint8 _decimals1) = (
                IERC20Metadata(_token0).decimals(),
                IERC20Metadata(_nativeStablePool.token1()).decimals()
                );
                (uint112 _res0, uint112 _res1, ) = _nativeStablePool.getReserves();
                /*
                return  (FixedPoint96.Q96 * _res0 * 10 ** _decimals1) /
                        _res1 / 10 ** _decimals0;
                _token0 == DAI
                        ? (FixedPoint96.Q96 * _res0 * 10 ** _decimals1) /
                        _res1 /
                        10 ** _decimals0
                        : (FixedPoint96.Q96 * _res1 * 10 ** _decimals0) /
                        _res0 /
                        10 ** _decimals1;
                */
        }

 }
