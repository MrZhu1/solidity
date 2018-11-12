pragma solidity ^0.4.25;//声明编译器版本，^表示向上兼容
/*
1、布尔类型 booleans
2、整型int
3、整型溢出问题 
*/
contract test_DataType{
   bool a=true;
   bool b=false;
   
   int8 c=-1;
   int8 d=2;
   uint32 e=11;//此时e必须为正数  
   
   uint256 public zero=9;
   uint256 public max=2**256-1;
   uint256 public mm=2**255;
   
   function test1() public constant returns(bool){
       return a&&b;
   }
   
   function test2() public constant returns(bool){
       return a||b;
   }
   
   function Add(uint8 x,uint8 y) public pure returns(uint8){
       uint8 c=x+y;
       assert(c>=x);//断言用于解决整型溢出问题  
       return c;
   } 
   
   function test4() public constant returns(uint){
       //return 4>>1;4/2
       //return 4<<2;4*2*2
   }
   
   
   //减法验证向下溢出  
   function subUderFlow() public constant returns(uint){
       uint a=zero-1;
       return a;
   }
   
   //加法验证向上溢出 
   function addOverFlow() public constant returns(uint){
       uint b=max+1;
       return b;
   }
   
   //乘法溢出 
   function mulOverFlow() public constant returns(uint){
       uint c=mm*2;
       return c;
   }
}
