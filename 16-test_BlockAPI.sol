pragma solidity 0.4.25;
/*
1、solidity 区块的一些常用API 
2、solidity API之ABI编码函数（应用程序二进制接口） 
*/
/*
contract testBlockAPI{
    //1、当前外部账户的地址、合约自带的value值
    function getAddressAndValue() public payable returns(address,uint){
        return(msg.sender, msg.value);
    }
    
    //2、剩余的gas值gasleft()
    function diffGas() public view returns(uint,uint,uint){
        uint g1=gasleft();
        uint a=2**100;
        uint g2=gasleft();
        return (g1,g1-g2,g2);
    }
    
    //3、函数的选择器（签名） 
    function testf() public view returns(bytes4,bytes4){
        return (msg.sig,this.testf.selector);
    }
    
    //4、主调用方法 
    function testCall() public view returns(address){
        //return new called().testCalled();
    }

    //5、返回给定区块号的hash值，只支持最近的256个区块
    function getBlockHash(uint blcoknumber) public view returns(bytes32){
        bytes32 bs32=blockhash(blcoknumber);
        return bs32;
    }
    
    //6、返回矿工的地址
    function getAddress() public view returns(address){
        return block.coinbase;
    }
    
    //7、返回当前块的难度
    function getDifficulty() public view returns(uint){
     //   return block.difficulty;
      //  return block.gaslimit;
        return block.number;
        return block.timestamp;
    }
}
*/

contract called{//被调用的合约 
    function testCalled() public view returns(address,address){
        return (msg.sender,tx.origin);//合约账户的地址 
    }
}

contract testABI{
    uint storedData;
    function set(uint256 x) public {
        storedData=x;
    }

    function abiEncode() public constant returns(bytes){
        //return abi.encode("zhupeng");//计算"zhupeng"的ABI编码  
        //return abi.encodeWithSignature("set(uint256)",1);//计算函数的ABI编码
    
        //return abi.encode(1,2);
        return abi.encodePacked(1,2);//紧密打包只保留前四个字节 
    }
}
