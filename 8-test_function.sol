pragma solidity ^0.4.25;//声明编译器版本，^表示向上兼容
/*
1、函数重载:函数名字相同 函数的参数不同（类型、数量） 不考虑函数的返回值
2、函数命名参数（参数动态赋值）:setParameter({_name:"zhucaixia",_num:99})
3、返回值特性
*/
/*
contract Function{

    //1、函数重载
    function fun(uint a,uint b) view returns(uint){
        return a+b;
    }
    
    // function fun(uint a,uint b) view returns(string){
    //     return a+b;
    // }
    
    function fun(uint8 a,uint8 b) view returns(uint8){
        return a+b;
    }
    
    function fun(uint a,uint b,uint c) view returns(uint){
        return a+b+c;
    }
    
    //虽然可以编译通过，但是不同调用，无法确定是哪一个函数
    uint public a=0;
   function fun2(address add) public returns(uint){
       a=1;
       return a;
   }
   
    function fun2(uint160 a) public returns(uint){
        a=2;
        return a;
   }
   
   function test() public view returns(uint){
       address add=0x4920ebe161687f4a2180a698171ff5bfb2fbac65;
        return fun2(add);
       //fun2(100);100无法匹配uint160   address
   }

   
   //2、函数命名参数
   uint public num;
   string public name;
   
   //参数不需要完全匹配
   function setParameter(uint _num,string _name){
       num=_num;
       name=_name;
   }

    function test1() public{
        setParameter(100,"zhupeng");
    }    
    
    //参数要完全匹配
    function test2() public {
        setParameter({_name:"zhucaixia",_num:99});
    }
 
    //返回值可以有名字,可以直接赋值
    function returnTest() public pure returns(uint sum){
        sum=10;
    }
    
    function returnTest2() public pure returns(uint sum){
        uint a=99;
        return a;
    }
    
    //多返回值实现交换
    function returnTest3(uint a,uint b) public pure returns(uint,uint){
        return (b,a);
    }
}
*/


pragma solidity ^0.4.25;//声明编译器版本，^表示向上兼容 
// 函数类型 :作为返回值的类型、函数参数类型为一个函
// 外部函数(external)：EVM会发起消息调用，地址.函数名进行调用
// 内部函数(internal)：gas消耗少，合约外部无法调用，默认是内部函数
// selector:成员变量，四个字节的字节数组
contract TestFuction{
  
    function a(uint x) external returns(uint z){
        return x*x;
    }
    
    function b(uint x) external returns(uint z){
        return 2 *x;
    }
  
    function callTest(bool useB,uint x) external returns(uint z){
        //定义函数类型变量f
        function (uint) external returns(uint) f;
        if(useB){
            f=this.b;
        }else{
            f=this.a;
        }
        return f(x);
    } 
    
    //函数变量作为返回值的类型
    function getfun() public view returns(function (uint) external returns(uint)){
        return this.b;
    }
    
    //函数参数类型为一个函数 
    function select(function (uint) external returns(uint) f,uint x) external returns(uint z){
        return f(x);
    } 
    
    //函数选择器 selector: 0x26121ff0
    function f() public view returns (bytes4){
        return this.f.selector;
    }
 }

 
 
