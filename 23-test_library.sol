pragma solidity ^0.4.25;//声明编译器版本，^表示向上兼容
import "./SafeMath.sol";
/*
库：像合约一样部署，但是不能定义状态变量、不能存以太币
优点：部署一次，多个合约反复使用，节约gas

*/
contract testlib{
    function add(uint x,uint y) public pure returns(uint){
        return SafeMath.add(x,y);
    }
    
    function getThis() public view returns(address){
        return this;
    }
    
    using SafeMath for uint;//扩展类型 
    function add2(uint x,uint y) public pure returns(uint){
        return x.add(y);
    }
}
