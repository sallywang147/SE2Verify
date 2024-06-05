// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;
pragma abicoder v2;
//pragma experimental SMTChecker;

import './IERC20Metadata.sol';
import './IFlashLoanRecipient.sol';
import './ITokenRewards.sol';
import './IUniswapV2Factory.sol';
import './IUniswapV2Router02.sol';
import './StakingPoolToken.sol';
import './Ownable.sol';


pragma solidity ^0.7.6;


interface IDecentralizedIndex is IERC20 {
  enum IndexType {
    WEIGHTED,
    UNWEIGHTED
  }

  struct IndexAssetInfo {
    address token;
    uint256 weighting;
    uint256 basePriceUSDX96;
    address c1; // arbitrary contract/address field we can use for an index
    uint256 q1; // arbitrary quantity/number field we can use for an index
  }

  event Create(address indexed newIdx, address indexed wallet);
  event Bond(
    address indexed wallet,
    address indexed token,
    uint256 amountTokensBonded,
    uint256 amountTokensMinted
  );
  event Debond(address indexed wallet, uint256 amountDebonded);
  event AddLiquidity(
    address indexed wallet,
    uint256 amountTokens,
    uint256 amountDAI
  );
  event RemoveLiquidity(address indexed wallet, uint256 amountLiquidity);

  function FLASH_FEE_DAI() external view returns (uint256);

  function BOND_FEE() external view returns (uint256); // 1 == 0.01%, 10 == 0.1%, 100 == 1%

  function DEBOND_FEE() external view returns (uint256); // 1 == 0.01%, 10 == 0.1%, 100 == 1%

  function indexType() external view returns (IndexType);

  function created() external view returns (uint256);

  function lpStakingPool() external view returns (address);

  function lpRewardsToken() external view returns (address);

  function getIdxPriceUSDX96() external view returns (uint256, uint256);

  function isAsset(address token) external view returns (bool);

  function getAllAssets() external view returns (IndexAssetInfo[] memory);

  function getTokenPriceUSDX96(address token) external view returns (uint256);

  function bond(address token, uint256 amount) external;

  function debond(
    uint256 amount,
    address[] memory token,
    uint8[] memory percentage
  ) external;

  function addLiquidityV2(
    uint256 idxTokens,
    uint256 daiTokens,
    uint256 slippage
  ) external;

  function removeLiquidityV2(
    uint256 lpTokens,
    uint256 minTokens,
    uint256 minDAI
  ) external;

  function flash(
    address recipient,
    address token,
    uint256 amount,
    bytes calldata data
  ) external;
}

/**
 * @dev Collection of functions related to the address type
 */


abstract contract DecentralizedIndex is IDecentralizedIndex, ERC20 {
  using SafeERC20 for IERC20;

  uint256 public constant override FLASH_FEE_DAI = 10; // 10 DAI
  uint256 public immutable override BOND_FEE;
  uint256 public immutable override DEBOND_FEE;
  address immutable V2_ROUTER;
  address immutable V2_POOL;
  address immutable DAI;
  address immutable WETH;
  IV3TwapUtilities immutable V3_TWAP_UTILS;

  IndexType public override indexType;
  uint256 public override created;
  address public override lpStakingPool;
  address public override lpRewardsToken;

  IndexAssetInfo[] public indexTokens;
  mapping(address => bool) _isTokenInIndex;
  mapping(address => uint256) _fundTokenIdx;

  bool _swapping;
  bool _swapOn = true;
  bool _unlocked = true;

  event FlashLoan(
    address indexed executor,
    address indexed recipient,
    address token,
    uint256 amount
  );

  modifier lock() {
    require(_unlocked, 'LOCKED');
    _unlocked = false;
    _;
    _unlocked = true;
  }

  modifier noSwap() {
    _swapOn = false;
    _;
    _swapOn = true;
  }

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
  ) ERC20(_name, _symbol) {
    created = block.timestamp;
    BOND_FEE = _bondFee;
    DEBOND_FEE = _debondFee;
    lpRewardsToken = _lpRewardsToken;
    V2_ROUTER = _v2Router;
    address _v2Pool = IUniswapV2Factory(IUniswapV2Router02(_v2Router).factory())
      .createPair(address(this), _dai);
    lpStakingPool = address(
      new StakingPoolToken(
        string(abi.encodePacked('Staked ', _name)),
        string(abi.encodePacked('s', _symbol)),
        _dai,
        _v2Pool,
        lpRewardsToken,
        _stakeRestriction ? _msgSender() : address(0),
        _v3TwapUtilities
      )
    );
    V2_POOL = _v2Pool;
    DAI = _dai;
    WETH = IUniswapV2Router02(_v2Router).WETH();
    V3_TWAP_UTILS = _v3TwapUtilities;
    emit Create(address(this), _msgSender());
  }

  function _transfer(
    address _from,
    address _to,
    uint256 _amount
  ) internal virtual override {
    if (_swapOn && !_swapping) {
      uint256 _bal = balanceOf(address(this));
      uint256 _min = totalSupply() / 10000; // 0.01%
      if (_from != V2_POOL && _bal >= _min && balanceOf(V2_POOL) > 0) {
        _swapping = true;
        _feeSwap(
          _bal >= _min * 100 ? _min * 100 : _bal >= _min * 20 ? _min * 20 : _min
        );
        _swapping = false;
      }
    }
    super._transfer(_from, _to, _amount);
  }

  function _feeSwap(uint256 _amount) internal {
    address[] memory path = new address[](2);
    path[0] = address(this);
    path[1] = DAI;
    _approve(address(this), V2_ROUTER, _amount);
    address _rewards = StakingPoolToken(lpStakingPool).poolRewards();
    IUniswapV2Router02(V2_ROUTER)
      .swapExactTokensForTokensSupportingFeeOnTransferTokens(
        _amount,
        0,
        path,
        _rewards,
        block.timestamp
      );
    uint256 _rewardsDAIBal = IERC20(DAI).balanceOf(_rewards);
    if (_rewardsDAIBal > 0) {
      ITokenRewards(_rewards).depositFromDAI(0);
    }
  }

  function _transferAndValidate(
    IERC20 _token,
    address _sender,
    uint256 _amount
  ) internal {
    uint256 _balanceBefore = _token.balanceOf(address(this));
    _token.safeTransferFrom(_sender, address(this), _amount);
    require(
      _token.balanceOf(address(this)) >= _balanceBefore + _amount,
      'TFRVAL'
    );
  }

  function _isFirstIn() internal view returns (bool) {
    return totalSupply() == 0;
  }

  function _isLastOut(uint256 _debondAmount) internal view returns (bool) {
    return _debondAmount >= (totalSupply() * 98) / 100;
  }

  function isAsset(address _token) public view override returns (bool) {
    return _isTokenInIndex[_token];
  }

  function getAllAssets()
    external
    view
    override
    returns (IndexAssetInfo[] memory)
  {
    return indexTokens;
  }

  function addLiquidityV2(
    uint256 _idxLPTokens,
    uint256 _daiLPTokens,
    uint256 _slippage // 100 == 10%, 1000 == 100%
  ) external override lock noSwap {
    uint256 _idxTokensBefore = balanceOf(address(this));
    uint256 _daiBefore = IERC20(DAI).balanceOf(address(this));

    _transfer(_msgSender(), address(this), _idxLPTokens);
    _approve(address(this), V2_ROUTER, _idxLPTokens);

    IERC20(DAI).safeTransferFrom(_msgSender(), address(this), _daiLPTokens);
    IERC20(DAI).safeIncreaseAllowance(V2_ROUTER, _daiLPTokens);

    IUniswapV2Router02(V2_ROUTER).addLiquidity(
      address(this),
      DAI,
      _idxLPTokens,
      _daiLPTokens,
      (_idxLPTokens * (1000 - _slippage)) / 1000,
      (_daiLPTokens * (1000 - _slippage)) / 1000,
      _msgSender(),
      block.timestamp
    );

    // check & refund excess tokens from LPing
    if (balanceOf(address(this)) > _idxTokensBefore) {
      _transfer(
        address(this),
        _msgSender(),
        balanceOf(address(this)) - _idxTokensBefore
      );
    }
    if (IERC20(DAI).balanceOf(address(this)) > _daiBefore) {
      IERC20(DAI).safeTransfer(
        _msgSender(),
        IERC20(DAI).balanceOf(address(this)) - _daiBefore
      );
    }
    emit AddLiquidity(_msgSender(), _idxLPTokens, _daiLPTokens);
  }

  function removeLiquidityV2(
    uint256 _lpTokens,
    uint256 _minIdxTokens, // 0 == 100% slippage
    uint256 _minDAI // 0 == 100% slippage
  ) external override lock noSwap {
    _lpTokens = _lpTokens == 0
      ? IERC20(V2_POOL).balanceOf(_msgSender())
      : _lpTokens;
    require(_lpTokens > 0, 'LPREM');

    uint256 _balBefore = IERC20(V2_POOL).balanceOf(address(this));
    IERC20(V2_POOL).safeTransferFrom(_msgSender(), address(this), _lpTokens);
    IERC20(V2_POOL).safeIncreaseAllowance(V2_ROUTER, _lpTokens);
    IUniswapV2Router02(V2_ROUTER).removeLiquidity(
      address(this),
      DAI,
      _lpTokens,
      _minIdxTokens,
      _minDAI,
      _msgSender(),
      block.timestamp
    );
    if (IERC20(V2_POOL).balanceOf(address(this)) > _balBefore) {
      IERC20(V2_POOL).safeTransfer(
        _msgSender(),
        IERC20(V2_POOL).balanceOf(address(this)) - _balBefore
      );
    }
    emit RemoveLiquidity(_msgSender(), _lpTokens);
  }

  function flash(
    address _recipient,
    address _token,
    uint256 _amount,
    bytes calldata _data
  ) external override lock {
    address _rewards = StakingPoolToken(lpStakingPool).poolRewards();
    IERC20(DAI).safeTransferFrom(
      _msgSender(),
      _rewards,
      FLASH_FEE_DAI * 10 ** IERC20Metadata(DAI).decimals()
    );
    uint256 _balance = IERC20(_token).balanceOf(address(this));
    IERC20(_token).safeTransfer(_recipient, _amount);
    IFlashLoanRecipient(_recipient).callback(_data);
    require(IERC20(_token).balanceOf(address(this)) >= _balance, 'FLASHAFTER');
    emit FlashLoan(_msgSender(), _recipient, _token, _amount);
  }

  function rescueERC20(address _token) external lock {
    // cannot withdraw tokens/assets that belong to the index
    require(!isAsset(_token) && _token != address(this), 'UNAVAILABLE');
    IERC20(_token).safeTransfer(
      Ownable(address(V3_TWAP_UTILS)).owner(),
      IERC20(_token).balanceOf(address(this))
    );
  }

  function rescueETH() external lock {
    require(address(this).balance > 0, 'NOETH');
    _rescueETH(address(this).balance);
  }

  function _rescueETH(uint256 _amount) internal {
    if (_amount == 0) {
      return;
    }
    (bool _sent, ) = Ownable(address(V3_TWAP_UTILS)).owner().call{
      value: _amount
    }('');
    require(_sent, 'SENT');
  }

  receive() external payable {
    _rescueETH(msg.value);
  }
}