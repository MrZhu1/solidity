 pragma solidity ^0.4.25;//声明编译器版本，^表示向上兼容
/*
1、地址类型send()成员函数:不会发生异常，但是会返回false，大部分使用transfer()
           send()、transfer()最多使用2300gas，转账很容易失败
            
2、合约之间转账  CallTest-->Called
*/
//给Called这个合约转账 (CallTest-->Called)
contract Called{
    event logdata(bytes data);
    
    //不同合约之间转账,需要一个回退函数，说明这个合约可以接受以太币
    //只能有一个，没有函数名
    function () public payable{
        emit logdata(msg.data);
        // emit logdata(msg.data);
        //触发两个日志，就说明回退函数复杂一点所消耗的gas超过2300，
        //就会转账失败
    }
    
    //判断当前合约账户余额 
    function getBalance() public view returns (uint){
        return this.balance;
    }
}

contract CallTest{//部署的时候要给他一些以太币
    constructor() public payable{
        
    }
    
    //判断当前账户余额 
    function getBalance() public view returns (uint){
        return this.balance;
    }
    
    function transferEther(address towho) public returns(bool){
       // towho.transfer(1 ether);
       //return true;
        assert(towho.send(1 ether));
        //明明转账失败，却没有显示异常
        //不会有异常，但是并没有成功，必须判断返回值 
    }
}
