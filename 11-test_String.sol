pragma solidity ^0.4.25;
//import "github.com/Arachnid/solidity-stringutils/strings.sol";
import "./strings.sol";
/*
动态字节数组bytes 、字符串 string
如果一个变量public修饰，系统会自动生成一个函数，函数名与变量名一样
如果一个函数public修饰，可以直接调用这个函数

*/
contract testString{
    bytes public bs="zcxp朱鹏";//动态字节数组，存UTF8编码 
    bytes32  bs2="zhupeng";//固定长度字节数组 
    string public str1="朱鹏zcxp";//具体字符 
    
    //1、得到字符串str1的字节数，而不是字符长度
    //一个英文字符、特殊字符=1字节   1个中文字符=3字节    
    function getBytes() public view returns(uint){
        //return str1.length; string没有.length
        return bytes(str1).length;
    }
   
    //2、得到string的第i个下标元素的ASCCI码   
    function getByte(uint i) public view returns(byte){
        //bytes(str1)[0]="L";//修改 
        return (bytes(str1))[i];
    }
    
    //3、得到str1的AscII值
    function getAllBytes() public view returns(bytes){
         return bytes(str1);
    }
    
     //4、得到str1值
    function getContent() public view returns(string){
         return str1;
    }
    
     //5、固定长度字节数组 进行截断 左到右 
    function changeBytes1() public view returns(bytes1){
         return bytes1(bs2);
    }
    function changeBytes2() public view returns(bytes2){
         return bytes2(bs2);
    }
    
    //6、固定长度字节bytes32->动态字节数组bytes
    function changeBytesToDynamicBytes() public view returns(bytes){
        bytes memory newName=new bytes(bs2.length);
        for(uint i=0; i<bs2.length;i++){
            newName[i]=bs2[i];
        }
        return newName;
    }
    
    //7、动态字节数组bytes-->string
    function changeDynamicBytesToString() public view returns(string){
        return string(bs);   
    }
    
     //8、固定长度字节bytes32-->string(bytes--bytes32--string)
    function changeBytes32ToString() public view returns(string){
        //return string(bs2);  
         bytes memory newName=new bytes(bs2.length);
        for(uint i=0; i<bs2.length;i++){
            newName[i]=bs2[i];
        }
        return string(newName);
    }

    //8、得到字符串str1的长度（字符串的长度无法直接得到）
    using strings for *;
    function getstrLen() public view returns(uint len){
        len=str1.toSlice().len();
    }
}
