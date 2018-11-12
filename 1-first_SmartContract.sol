pragma solidity ^0.4.25;//声明编译器版本，^表示向上兼容
import "./2-first_interface.sol";
/*
1、智能合约一般格式(在以太坊存储一个数值)
2、引入一个新的合约接口文件
3、定义一个函数修改器  modifier
4、定义一个事件event
5、结构体的使用
*/  

contract first_SmartContract{
    uint storedData;//uint=uint256
    event Set(uint value);//事件不需要实现 
    struct Circle{
        uint radius;
    }
    Circle c;
    
    //定义一个函数修改器 
    modifier mustOver10(uint value){
        require(value>=10);
        _;
    }
    
    function set(uint x) public mustOver10(x){//添加函数修改器 
        storedData=x;
        emit Set(x);//触发事件  
        c=Circle(x);
    }
    
    function get() public constant returns(uint){
        return storedData;
    }
}

