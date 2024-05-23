pragma solidity ^0.5.2;

contract test { 

  uint256 public currentSupply = 1000; 
  address private _owner; 

  function balanceOf(address account) public view returns (uint256) {
        return account.balance;
    }
  function deposit(address user, uint256 amount) public {
        // check for amount and user
        require(
            amount > 0 && user != address(0x0),
            "Insufficient amount or invalid user"
        );

        // input balance
        uint256 input1 = balanceOf(user);

        // transfer amount to user
        address payable _user = address(uint160(user));
        _user.transfer(amount);
        assert(currentSupply > 100 && msg.sender == _owner);
        currentSupply = currentSupply + amount;
    }

}