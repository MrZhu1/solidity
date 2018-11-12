pragma solidity ^0.4.25;//声明编译器版本，^表示向上兼容
//1、数学函数 API
//2、HASH函数 API:MD4、MD5 ripemd-160 SHA-1 SHA2 SHA3:keccak 
//3、地址相关 API
//4、合约相关 API
contract testMathAPI{
    
    function testAddMod() public view returns(uint){
        uint x=2**256-1;
        uint y=1;
        uint k=100;
        return addmod(x,y,k);//不会溢出
        //return (x+y)%k;//会溢出
        // return mulmod(x,y,k);
    }
    
    function testHASH(string str) public view returns(bytes32,bytes32){
        return (keccak256(str),sha3(str));
      
        //return sha256(str);
        //return ripemd160("zhupeng");
    }
    
    
    
}
