pragma solidity ^0.4.25;//声明编译器版本，^表示向上兼容 
/*
1、call()、delegatecall()成员函数 :
在一个合约内调用另外一个合约的函数还有可以附加value、gas 
PS：elegatecall不可以附加value、gas

格式：被调用合约地址.call(被调用函数名前四个字节，被调用函数参数)

2、在CallTest合约中调用合约Called中的函数

*/
contract Called {
    uint public n;
    address public sender;
    event logdata(bytes data);
    
    constructor () public payable{
        //构造函数可以转移以太币
    }
    
    function () public payable {
        //回退函数
        emit logdata(msg.data);
    }
    
    function setN(uint _n) public payable{
        n = _n;
        sender = msg.sender;//保存合约地址
    }

    function getBalance() public view returns (uint) {
        return this.balance;
    }
}

contract CallTest {
    uint public n;
    address public sender;
    
    constructor () public payable{
        
    }

    function callandSetN(address _e, uint _n) public{
        bytes4 methodId = bytes4(keccak256("setN(uint256)"));
        require(_e.call.value(1 ether)(methodId, _n));
        // _e.call.gas(1000)(methodId, _n);
        // _e.call.gas(1000).value(1 ether)(methodId, _n);
    }

    // delegatecall只是调用代码，合约环境还是当前合约。
    function delegatecallAndSetN(address _e, uint _n) public{
        bytes4 methodId = bytes4(keccak256("setN(uint256)"));
        _e.delegatecall(methodId, _n);
    }

    function callNoFunc(address addr) public returns (bool){
        return addr.call("tinyxiong", 1234);
    }

}
