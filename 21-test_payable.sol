pragma solidity ^0.4.25;
//payable:如果不加就不能附加value
//view:view 与constant等价,表示一个函数不能修改状态，本地执行不会消耗gas
//pure:表示一个函数不读取状态，也不修改状态，本地执行不会消耗gas
/*
contract testViewANDPure{
    uint public b=1;
    
    function test1(uint a) public view returns(uint){
        return a+b;//没有修改b的状态，不会消耗gas，b的值不会改变  
    }
    
    function test2(uint a) public returns(uint){
        b=2*a;//修改了b的状态
        return a+b;
    }
    
    function test3(uint a) public pure returns(uint){
        return a+2;
    }
    
}
*/

contract testPayable{
    
    //普通函数 
    function deposit() public payable{
        
    }   
    
    //构造函数 
    constructor() public payable{
        
    }
    
    //回退函数 
    function () public payable{
        //接受以太币的时候会被调用
    }
    
    //账户余额
    function getBalance() public view returns(uint){
        return this.balance;
    }
}

contract call{
    constructor() public payable{
        
    }
    
    function testTransfer(address a) public{
        address myAddress=this;
        if(myAddress.balance>=1e18){
            a.transfer(1 ether);
        }
    }
}
