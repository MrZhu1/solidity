pragma solidity ^0.4.25;//声明编译器版本，^表示向上兼容
//合约API 
contract testContractAPI{
    address owner;
    
    constructor() {
        owner=msg.sender;
    }
    
    function Hello() public view returns (string){
        return "Hello";
    }
    
    //销毁合约 但是存在安全隐患
    function destroyContract() public{
        this.Hello();
        selfdestruct(owner);
    }
    
    //合约的销毁者必须是合约的创建者
    function killContract() public{
        require(msg.sender==owner);
        selfdestruct(owner);
    }
    
}
contract testCall{
    function Hello() public view returns (string){
        return "Hello";
    }
    
    function call(address a){
        a.delegatecall(bytes4(sha3("destroyContract()")));
    }
}

