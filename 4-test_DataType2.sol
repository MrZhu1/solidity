pragma solidity ^0.4.25;//声明编译器版本，^表示向上兼容
/*
1、定长浮点型fixedMxN、ufixedMxN
2、固定字节数组 bytes1--bytes32、一个字节=8位，字节数组可以存储整形、字符型等多种类型
            字节数组的长度length一旦固定就不能再动态修改
    动态字节数组 bytes bt=new bytes(2)
3、常量 (数字、字符串、十六进制)
*/
contract test_DataType2{
    ufixed32x1 f;//ufixed32x1,只能定义，不能赋值
    
    bytes1 public bt1=0x01;//byte=bytes1
    bytes2 public bt2="zh";
    bytes3 public bt3="zhu";
    string s="zhupeng";//区别是字符串不是定长的
    
    //0、动态字节数组
    bytes public name=new bytes(2);
    function InitName() public{
        name[0]=0x12;
        name[1]=0x23;
    }
    function getlenthname() public view returns(uint,bytes){
        name.length=10;
        name.push(0x99);
        return (name.length,name);
    }
    
    /*1、定长浮点型fixedMxN、ufixedMxN
    function getFixedNum() public view returns(ufixed32x1){
        return f;
    }
   */
    
    //2、字符操作 
    function getlenth() public constant returns(uint){
        return bt2.length;
        //return s.length;  错误字符串没有length方法
    }
    
    //3、字节数组常用操作  
    function compare() public view returns(bool){
        return bt2>bt3;
        // return bt2 && bt2;
    }
    
    //4、向数组一样访问某位字符（Ascii）
    function getFristChar() public constant returns(bytes1){
        return bt2[0];
    }
    
    function getFristChar2() public constant returns(uint){
        return (uint)(bt2[0]);
    }
    
    function changeArray() public constant returns(bytes2){
       // bt2[0]="p";字节数组内部数据也不能修改
        bt2="pp";
        return bt2; 
    }
    
    //5、数字常量操作
    function test() public pure returns(uint){
       // return 2e3+100;
       return 5/2+5/2;//5,常量做计算不会截断
    }
    
    function test2() public pure returns(uint){
        return ((2**1000+1)-2**1000);//1,不会发生溢出 
    }
    
    function test3() public pure returns(uint){
        uint128 a=1;//a是变量，不是常量 
      //  uint128 b=a+1.5;
        //return b;
    }

     //字符串常量操作
    function test4() public pure returns(bytes){
        //不支持拼接 return "zh"+"u";
        return "zhu";//返回ASCII码 
    }

    function test5() public pure returns(string){
        return "zhupeng";//返回字符串 
    }
    
    function test6() public pure returns(string){
        return "\x61\x62";//转义字符 
    } 
    //十六进制常量
    function test7() public pure returns(bytes2,bytes1,bytes1){
        bytes2 a=hex"aabb";
        return (a,a[0],a[1]);
    }
}
