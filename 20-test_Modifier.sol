pragma solidity ^0.4.25;
/*
1、函数修改器modifier
    //定义一个函数修改器，可以被继承；
    //修饰时，函数提被插入到“_;”处
    //不符合条件，将抛出异常
2、理解函数修改器的执行流：
    如果修改器或者函数内部有return语句，
    仅仅跳出当前的修改器或者函数，“_”后继续执行

*/
contract Mutex{
    bool public locked;
    //防止递归调用
    modifier noReettrancy(){
        require(!locked);
        locked=true;
        _;
        locked=false;
    }
    
    //return 7之后，locked=false仍然会执行

    function f() public noReettrancy() returns(uint){
        return 7;
    }
}

//Exp1:
contract Exp1{
    uint public a=0;
    
    modifier mf1(){
       a=1;
       _;
       a=2;
    }
    
    modifier mf2(){
       a=3;
       _;
       a=4;
    }
    
    function test1() mf1 mf2 public{
        a=100;
    }
}
// a=1; mf2(a=3;  _;(a=100;)      a=4;)   a=2;

/*
contract owned{
    address owner;
    
    constructor() public{
        owner=msg.sender;//本合约的地址
    }
   
    //1、不带参数的函数修改器
    modifier onlyOwner(){
        require(owner==msg.sender) ;  
        _;
    }
    
    //2、带参数的函数修改器
    modifier mustOver18(uint age){
        require(age>=18);
        _;
    }
}
contract testModifier is owned{//进行继承is
    
    function kill(uint age) public onlyOwner mustOver18(age){//销毁本合约
        selfdestruct(owner);
    }
    
    //用于验证合约是否被销毁 
    function hello() public view returns(string){
        return "hello";
    }
}
*/
