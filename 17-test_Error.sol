pragma solidity ^0.4.25;
//1、错误处理 
contract testError{
    function testDIV(uint x,uint y)public view returns(uint){
        require(y!=0);
        require(x>y);
        assert(x>x/y);
        
        if(x/y==1){
            revert();
        }
        return x/y;
    }
}
