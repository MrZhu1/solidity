pragma solidity ^0.4.25;
/*
//1、派生合约需要调用父合约的构造函数，
    如果有参数，派生合约需要提供参数调用父合约的构造函数
    构造函数无函数名，无返回值,可以有参数

public:在本合约的其他函数体内部可以调用，在继承的函数体内部中也可以调用
private:在本合约的其他函数体内部中可以调用，在继承函数体内部不可以调用
internal:在本合约的其他函数体内部中可以调用，在继承的函数体内部中也可以调用
external:在本合约的其他函数体内部中不可以调用，在继承的函数体内部中也不可以调用
            return this.externalHello();外部调用

2、多重继承：从最近的基类到最近的派生类
3、抽象合约：至少有一个函数没有实现,无法部署 
            不能通过编译，只能被继承
4、接口合约 :任何一个函数都没有实现
    函数不鞥继承其他合约，接口
    不能定义变量、枚举类型、结构体
*/

contract FartherCont{
    uint public a;
    uint private b;
    uint internal c;
  //  uint external d;
    address public owner;
    uint public test=10; 
    
    constructor (uint _a) public{//构造函数 
        owner=msg.sender;
        a=_a;
    }
    
     // function FartherCont(uint _a){//构造函数 
    //     a=10;
    // }
    
    function geta() external view returns(uint){
        return a;
    }
    
    function publicHello() public view returns(string){
        return "publicHello";
    }
    
    function privateHello() private view returns(string){
        return "privateHello";
    }
    
    function internalHello() internal view returns(string){
        return "internalHello";
    }
    
    function externalHello() external view returns(string){
        return "externalHello";
    }
    
    function test() public view returns(string){
       //return publicHello();
       //return privateHello();
       //return internalHello();
       //return externalHello();不可以调用
       return this.externalHello();
    }
}

contract SubCon is FartherCont(1000){  
    //1、FartherCont(5)自动调用父亲合约的构造函数，类似于函数修改器modifier  
    uint public test=20;
    
    // 2、在子合约中也声明一个构造函数，用于父合约构造函数的初始化
    // constructor (uint s) FartherCont(s){
    // }
    
    function getA() public view returns(uint){
        a=120;//对基类的状态变量、函数进行重载
        return a;
    }
    
    function Subtest() public view returns(string){
       return publicHello();
     //  return privateHello();   不可以调用
     //  return internalHello();
     //  return externalHello();不可以调用
     //return this.externalHello();
    }
}

//2、多重继承：从最近的基类到最近的派生类
contract SubCon2 is FartherCont(19),SubCon{
    //正确
    function getTest() public view returns(uint){
        uint  test=31;//会基类中的值进行覆盖
        return test;//如果多继承的基类有相同的变量，以最右边的基类的值为准
    }
    
    function Subsubtest() public view returns(string){
        return publicHello();
     }
} 

// contract SubCon3 is SubCon,FartherCont{
//     //错误
// } 


/*3、抽象合约：至少有一个函数没有实现,无法部署 
            不能通过编译，只能被继承
contract Abstruct{
    function test1(){
        
    }
    function test2();
}
*/

/*4、接口合约 :任何一个函数都没有实现
    函数不能继承其他合约，接口
    不能定义变量、枚举类型、结构体
interface Testinterface{
    // uint a;
    // enum enmu{1,2,3};
    // struct abc{
        
    // }
    function test1();  
    function test2();  
    function test3();
}
*/



