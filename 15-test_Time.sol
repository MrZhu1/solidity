pragma solidity ^0.4.25;
import "./Datetime.sol";
//时间time
contract testTime{
    //1、返回当前时间戳（某种计数法） now
    function currTime() public constant returns(uint){
        return block.timestamp;
        //return now;
    }
    
    //2、一天最多使用一次
    uint public lastTs;
    function doSomething() public {
        if(now - lastTs>=1 days){
            //doSomething
        }
        lastTs=now;
    }
    
    //3、对时间库函数的一些操作
    function getYear() public view returns(uint){
        return DateTime.getYear(now);
    }
    function getMonth() public view returns(uint){
        return DateTime.getMonth(now);
    }
    function getDay() public view returns(uint){
        return DateTime.getDay(now);
    }
 
    
}
