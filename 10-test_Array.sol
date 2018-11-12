pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;
/*数组 
定长数组a: uint[10] 
初始都是0，不能使用push函数,length数组长度不可变 

变长数组b、c: uint[]
.length  push()仅针对变长数组，
定长数组a、 memory数组不支持
*/
contract TestArray{
    
    uint[10] public a=[1];//定长数组,初始都是0，不能使用push函数,length数组长度不可变 
    
    uint[] public b=[25,11,252];//变长数组，调用时需要指定数组下标哦  
    uint[] public c=new uint[](5);//变长数组,必须指名数组的长度，存储在storage中   
    
    //1、返回所有定长数组a[0]、a元素
    function getArraya() public returns(uint,uint[10]){
        a[0]=10;
        a[1]=11;
       // a.length=11;
        return (a[0],a);
    }
    
    //2、变长数组b求和，以及数组长度 
    function getSumB() public view returns(uint sum,uint){
        sum=0;
        for(uint i=0;i<b.length;i++){
            sum+=b[i];   
        }
        return (sum,b.length);
    }
    
    //3、修改变长数组b下标的值以及添加元素 25,11,252,0,0,0,0,0,0,0,2
    function modifyAndPush() public view returns(uint[],uint){
        b.length=10;//修改 storage数组的长度 
        b.push(2);
        return (b,b.length);
    }
    
    //4、初始化变长数组c
    function initArrayC() public view returns(uint[],uint){
        c[0]=11;
        c[1]=12;
        return (c,c.length);
    }
    
    //5、修改变长数组c
    function changeArrayC() public view returns(uint[],uint){
        c[0]=111;
        c.length=10;
        c.push(12);
        return (c,c.length);
    }
    
    //6、数组作为参数 
    function getArrayLiteral(uint[] grade) public view returns(uint,uint){
        uint sum=0;
        for(uint i=0;i<grade.length;i++)
            sum+=grade[i];
         return (sum,grade.length);  
    }
    
    //7、二维数组uint[][3] uint[2][3] 
    uint[][3] public d=[[1,1,1],[2,2,2],[3,3,3]];
    function getLenghthD() public view returns(uint[],uint){
        d[0].length=4;
        d[0].push(11);
        return (d[0],d[0].length);
    }
    
    function getArrayD() public view returns(uint[][3],uint[]){
        return (d,d[0]);
    }
    
    function getSumD() public view returns(uint){
        uint sum=0;
        for(uint i=0;i<d.length;i++){
            for(uint j=0;j<d[i].length;j++){
                sum+=d[i][j];
            }
        }
        return sum;
    }

    //二维数组的初始化的时候要注意哎
    uint[][3] public test;
    function setTest() public constant returns(uint[][3]){
        test[0]=[1,1,1];
        test[1]=[2];
        test[2]=[3,3];
      
        return test;
    }
    
    
   
}
