pragma solidity ^0.4.25;
contract testEvent{
    event Deposit(address add,uint value);
    
    function deposit() public payable{
        emit Deposit(msg.sender,msg.value);
    }
}

contract testEvent2 is testEvent{
    
    function deposit2() public payable{
        emit Deposit(msg.sender,msg.value);
    }
}


