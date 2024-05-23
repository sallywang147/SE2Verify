pragma solidity ^0.5.2;

contract test { 

  address private _owner; 

  function buggy_test(uint256 currentSupply) public payable returns (uint256){
        currentSupply = 2;
        return currentSupply;
    }

  function balanceOf(address account) public view returns (uint256) {
        return account.balance;
    }
  function deposit(address user, uint256 amount, uint256 currentSupply) public {
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
        currentSupply = buggy_test(currentSupply);
        assert(currentSupply > 100 && msg.sender == _owner);
        currentSupply = currentSupply + amount;
    }

}