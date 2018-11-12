pragma solidity ^0.4.25;//声明编译器版本，^表示向上兼容
/*
回退函数：无名称、无参数、无返回值函数
智能合约只能有一个,当向合约转以太时，需要payable修饰
如果调用合约时，没有匹配上任何函数，就会调用回退函数
*/
contract Test{
    uint public x;
    //由于没有payable，向这个合约转账有异常
    //回退函数要尽可能的简单

    function () public payable{
       // x=1;
    }
}

contract Caller{
    constructor () payable{
        
    }
    
    function callTest(address test)public {
       // test.call(0x123);
       test.transfer(1 ether);
    }
}
