pragma solidity ^0.4.25;
//众筹项目
contract zhongchou{
    
    struct funder{//捐赠者
        address funderAddress;//捐赠者地址
        uint Tomoney;//捐款
    }
    
    struct needer{//受益人
        address NeederAddress;
        uint goal;//目标募集资金
        uint amount;//已募集资金
        uint funderAmount;//捐赠者个数
        mapping(uint => funder) map;//捐赠者id序号与捐赠者映射
    }
    
    //1、每一个受益人与id序号一一对应,并存储在区块链上
    uint neederAmount=0;
    mapping(uint => needer) needmap;
    
    //受益人首先呀明确自己的账户地址、募集资金目标
    function NewNeeder(address _NeederAddress,uint _goal){
        neederAmount++;//第一个受益人
        needmap[neederAmount]=needer(_NeederAddress,_goal,0,0);
    }
    
    //2、捐赠者通过ID号去给第几个受益人_neederAmount捐款
    function contribute(address _address,uint _neederAmount) public payable{
        needer storage _needer=needmap[_neederAmount];//根据_neederAmount去拿到那个needer
        _needer.amount+=msg.value;//受益人已募集资金增加
        _needer.funderAmount++;//捐赠者人数+1
        _needer.map[_needer.funderAmount]=funder(_address,msg.value);
        //捐赠者通过ID与捐赠者相关联
    }
    
    //第几个受益人的目标是否完成
    function IsComplete(uint _neederAmount) public {
        needer storage _needer=needmap[_neederAmount];
        if(_needer.amount >= _needer.goal){
            //目标达成,进行转账(合约账户—>受益人账户)
            _needer.NeederAddress.transfer(_needer.amount);
        }
    }
}
