pragma solidity ^0.4.25;
//类型转换 与 delete重置变量 
contract testCast{
    //1、类型转换
    //低类型转换为高类型，高类型不可以转换为低类型
    function add() public pure returns(uint){
        uint8 i=10;
        uint16 j=20;
        
        uint16 k=i+j;//i会隐式转换为uint16
        return k;//k会隐式转换为uint
    }
    
    //强制转换发生截断 
    function f1() public pure returns(uint,uint16){
        int8 y=-3;
        uint x=uint(y);

        uint32 a=12345678;
        uint16 b=uint16(a);
        return(x,b);
    }
    
    //2、delete重置变量 
    struct CustomType{
        bool myBool;
        uint myInt;
    }
    
    function testDel() public{
        bool b=true;
        delete b;//b=false
        
        uint a=1;
        delete a;//a=0
        
        address addr=msg.sender;
        delete addr;//addr=0x0
        
        bytes memory bs="123";
        delete bs; //bs=0x0
        
        string memory str="123";
        delete str; //str=""
        
        uint[] memory arr=new uint[](7);
        delete arr;//arr.length=0
        
        CustomType memory ct=CustomType(true,100);
        delete ct;//myBool=false,myInt=0
    }
    
    // delete  mapping
    mapping(address => uint) balances;
    function delMapping() public{
        //  delete balances;
        delete balances[msg.sender];
    }
    
    uint data;
    uint[] dataArray;
    function f2() public{
        //值传递 ,互相不会影响  
        uint x=data;
        delete x;
        delete data;
        
        //引用赋值 
        uint[] storage y=dataArray;
        delete dataArray;
       // delete y;报错 没有办法向一个引用类型的storage直接赋值 
    }
    
}
