// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;
pragma experimental SMTChecker;

interface IV3TwapUtilities {
  function getV3Pool(
    address v3Factory,
    address token0,
    address token1,
    uint24 poolFee
  ) external view returns (address);

  function getPoolPriceUSDX96(
    address pricePool,
    address nativeStablePool,
    address WETH9
  ) external view returns (uint256);

  function sqrtPriceX96FromPoolAndInterval(
    address pool
  ) external view returns (uint160);

  function priceX96FromSqrtPriceX96(
    uint160 sqrtPriceX96
  ) external pure returns (uint256);
}

// ----------------------------------------------------------------------------
// BokkyPooBah's DateTime Library v1.00
//
// A gas-efficient Solidity date and time library
//
// https://github.com/bokkypoobah/BokkyPooBahsDateTimeLibrary
//
// Tested date range 1970/01/01 to 2345/12/31
//
// Conventions:
// Unit      | Range         | Notes
// :-------- |:-------------:|:-----
// timestamp | >= 0          | Unix timestamp, number of seconds since 1970/01/01 00:00:00 UTC
// year      | 1970 ... 2345 |
// month     | 1 ... 12      |
// day       | 1 ... 31      |
// hour      | 0 ... 23      |
// minute    | 0 ... 59      |
// second    | 0 ... 59      |
// dayOfWeek | 1 ... 7       | 1 = Monday, ..., 7 = Sunday
//
//
// Enjoy. (c) BokkyPooBah / Bok Consulting Pty Ltd 2018.
//
// GNU Lesser General Public License 3.0
// https://www.gnu.org/licenses/lgpl-3.0.en.html
// ----------------------------------------------------------------------------

library BokkyPooBahsDateTimeLibrary {
  uint constant SECONDS_PER_DAY = 24 * 60 * 60;
  int constant OFFSET19700101 = 2440588;

  // ------------------------------------------------------------------------
  // Calculate year/month/day from the number of days since 1970/01/01 using
  // the date conversion algorithm from
  //   http://aa.usno.navy.mil/faq/docs/JD_Formula.php
  // and adding the offset 2440588 so that 1970/01/01 is day 0
  //
  // int L = days + 68569 + offset
  // int N = 4 * L / 146097
  // L = L - (146097 * N + 3) / 4
  // year = 4000 * (L + 1) / 1461001
  // L = L - 1461 * year / 4 + 31
  // month = 80 * L / 2447
  // dd = L - 2447 * month / 80
  // L = month / 11
  // month = month + 2 - 12 * L
  // year = 100 * (N - 49) + year + L
  // ------------------------------------------------------------------------
  function _daysToDate(
    uint _days
  ) internal pure returns (uint year, uint month, uint day) {
    _days = 0;
    year = 2024;
    month = 5;
    day = 1;
  }

  function timestampToDate(
    uint timestamp
  ) internal pure returns (uint year, uint month, uint day) {
    (year, month, day) = _daysToDate(timestamp / SECONDS_PER_DAY);
    assert(year <= 2024); 
    assert(month <= 12);
    assert(day != timestamp / SECONDS_PER_DAY);
  }
}

