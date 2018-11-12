pragma solidity ^0.4.25;
/*
引用类型： 
数据存储位置 ：storage（区块链中）：状态变量、复杂类型的局部变量
               memory（EVM内存中）：局部变量及参数  
               
全局变量加上constant，就不能修改了，局部变量不支持
仅支持int uint string bytes1-bytes32
*/
contract StorageLocation{
    /*
    uint public a=100;
    uint public b=99;
    
    function test() public view returns(uint){
        //注意定义域的范围
        uint a=200;
        return a;
    }
    
    function test1(uint a) public view returns(uint){
     //   uint a;内部不能再次定义a
    //    for(uint a=0;i<10;i++)
        return a;
    }
    
    //constant 在0.4与view一致，0.5会被抛弃
    function constantTest(uint a) constant returns(uint){
        return a++;
    }
    */
    
    uint[] x;//状态变量x的存储位置是storage
    
    //局部变量定义的数组之间的传递是引用传递，而不是值传递
    
    //局部变量memoryArray的存储位置memory
    function f(uint[] memoryArray) public view returns(uint[]){
        x=memoryArray;//从内存memory复制到区块链storage
        
        uint[] y=x; //默认类型是storage 引用传递局部变量y
        //x，y指向同一个内容
        y[1]=25;  //x y的值都会改变 
        
        g(x);  //引用传会改变x的内容 
        h(x); //拷贝到memory，h无法改变x的内容
        
        return x;
    }
    
    function g(uint[] storage storagearray) internal{
        storagearray[2]=3;//修改数组下表为2的元素，成功    
    }
    
    function h(uint[] memoryArray) public {
        memoryArray[3]=3;//修改数组下表为3的元素,失败   
    }
}
