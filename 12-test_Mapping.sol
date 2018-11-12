pragma solidity ^0.4.25;//声明编译器版本，^表示向上兼容
import "./iterable_mapping.sol";

contract testMapping{

    /*
    //msg.sender:EOA
  //1 、testMapping 
    mapping(address=>uint)  idmapping;// 地址—>序号
    mapping(uint=>string)  namemapping;// 序号-->姓名
    
    uint public sum=1;// 用户序号
    modifier control(){
        require(idmapping[msg.sender]==0);
        _;
    }
    function initMapping(string name) control public{
        address addr=msg.sender;
        idmapping[addr]=sum;
        namemapping[sum]=name;
        sum++;
    }
    
    function getIdByAddress(address add) public view returns(uint){
        return idmapping[add];
    }
    
    function getNameById(uint id) public view returns(string){
        return namemapping[id];
    }
  */  
  
  //2、生成对应函数  键：地址  值：地址对应余额
      mapping(address => uint) newmap;
      
      uint num=1;
      function initMapping(address addr) public{
          newmap[addr]=num;
          num++;
      }
      
      function getNumByAddress(address a) public view returns(uint){
          return newmap[a];
      }
  
    function getThis() view returns(address){
        return this;//合约账户  0xb05df6af0073fd592d8f6ee3d5c8ac0ff12e3967
       // return msg.sender;外部账户 0xca35b7d915458ef540ade6068dfe2f44e8fa733c
    }

    
    // function test() public{
    //     mapping(address => uint) a;
    // }
    IterableMapping.itmap data;
    //插入 
    function insert(uint k,uint v) public returns (uint size){
        IterableMapping.insert(data,k,v);
        return data.size;
    }
   
  
}
