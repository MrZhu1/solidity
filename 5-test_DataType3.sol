pragma solidity ^0.4.25;//声明编译器版本，^表示向上兼容
/*
1、枚举类型 enum
2、地址类型 address transfer()、balance
常见的全局变量:
msg.sender:合约调用者的账户地址 

*/
contract test_DataType3{
  /*  
   // 1、地址类型 address：成员变量与方法：balance、 transfer()
    constructor() public payable{
        //构造函数payable确保可以向这个合约转账，无函数名、无参数、无返回值
    }
    
   address public account1=0xca35b7d915458ef540ade6068dfe2f44e8fa733c;
   address public account2=0x692a70d2e424a56d2c6c27aa97d1a86395877b3a;
   function compareaccount() public view returns(bool){
       return account1>account2;
   }
   
    //2、获取一个外部、合约账户的余额(地址作为参数)，注意把地址转换为自己的账户地址
    function getEOABalance(address a) public constant returns(uint){
        return a.balance;//单位是wei,1eth=10^18wei 
    }
    
    //3、获取合约账户内的余额，在创建账号时要附加一些以太币
    function getContractBalance() public constant returns(uint){
     //   address a=this;//当前合约 
        return this.balance;
    }
    
    //4、what is "this"?合约账户的地址 而不是EOA
    function getThis() public view returns(address){
        return this;
    }
    
    //5、转移余额(合约内的余额this-->地址 a )矿工费由发起交易的地址支付
    function testTransfer(address a) public{
        address myaddress=this;
        //转移 1eth
        if(myaddress.balance>=1e18){
           a.transfer(1 ether);
           //a.transfer(msg.value);
        }
    }
    
    //6、常见的全局变量msg.sender
    function getGlobal1() public view returns(address){
        return msg.sender;//（address）当前调用发起人的地址
        //return msg.value;（uint）合约附带的以太币
        //return msg.data;（bytes）完整的调用数据
        //return msg.gas;（uint）当前还剩的gas
        //return msg.sig（bytes4）调用数据的前四个字节
        
    }
    function getGlobal2() public view returns(uint){
        return now;//（uint）当前块的时间戳别名
        //return tx.gasprice;（uint）交易的gas价格
        //return tx.origin; （address）交易的发送者
    }
    function getGlobal3() public view returns(uint){
        return block.difficulty;//（uint）当前块的难度 
        //return block.gaslimit;（uint）当前块的难度gaslimit
        //return block.number;（uint）当前块的块号
        //return block.timestamp;（uint）当前块时间戳 
        //return block.blockhash;（bytes32）区块号的HASH值 
        //return block.coinbase;（address）当前矿工地址 
    }
    
    
    
    */
    //1、枚举类型 enum (0-1-2-3):必须有成员对象，不能有汉字
    //主要用于状态的转移
    //使用枚举自定义一个类型ActionChoices
    enum ActionChoices{Goleft,GoRight,GoStraight,GoStill}
    
    //定义一个ActionChoices类型的变量:choice
    ActionChoices choice;
    ActionChoices defaultChoice=ActionChoices.GoStraight;
    
    function setGoStright() public{//赋值 
        choice=ActionChoices.Goleft;
    }
    
    function getChoice() public constant returns(ActionChoices){
        return choice;//默认为第一个 
    }
    
    function getDefaultChoice() public constant returns (uint){
        return uint(defaultChoice);//强制类型转换  
    }
}
