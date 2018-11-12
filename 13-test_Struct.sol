pragma solidity ^0.4.25;//声明编译器版本，^表示向上兼容
//结构体定义、声明 、调用
contract testStruct{
    struct Student{
        string name;
        uint grade;
    //  Student st1;一个结构体内部不能递归声明自己的类型一个结构体内部不能递归声明自己的类型
    }
    
    //1、只声明 不做初始化
    Student st1;
    //2、按结构体声明顺序进行初始化
    Student public st2=Student("zhupeng",100);
    //3、按照变量名进行初始化  
    Student public st3=Student({name:"zhucaixia",grade:99});


    //4、结构体中含有Mapping变量怎么办
    struct structType2{
        Student[] st1;//结构体数组 
        mapping(string =>structType2) indexs;
    }  
    //要么可以不初始化
    //要么跳过对mapping的初始化 
        structType3  st=structType3("zhupeng",23);
  
    struct structType3{
        string name;
        uint num;
        mapping(uint => string) map;
    }
    
    //要么重新在合约内部声明一个未初始化的结构体变量
    //只能用storage来操作结构体中的mapping
    structType3 ss;
    function init3() public view returns(uint,string){
        structType3 memory st3=structType3("zhupengpeng",101);
        ss=st3;
        ss.map[0]="zhupengpeng";
        return (st3.num,ss.map[0]);
    }
    
    
    //5、如果在参数或者返回值使用结构体，
    //函数必须声明为internal，不能是public
    //引用传递storage ->storage
        Student stu;
    //合法 
    function interFunc(Student storage s) internal{ 
        Student storage stu2=s;
        stu2.name="zhucaixia";
        stu2.grade=89;
    }
    
    function test() public view returns(string,uint){
        interFunc(stu);
        return (stu.name,stu.grade);
    }
    
    //memory ->storage
    function interFunc2(Student memory s) internal{ 
        stu=s;
        s.name="aaa";
        s.grade=12;
    }
    
    function test2() public view returns(string,uint){
        Student memory temp=Student("bbb",12);
        interFunc2(temp);
        return (stu.name,stu.grade);
    }
    

    // function interFunc2(structType1 st) public{
    // }非法 
}
