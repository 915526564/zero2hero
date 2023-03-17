// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract wkDemo{
    //单代币挖矿-简单鉴权-按秒领取
    address public owner;

    //代币地址
    address public coinAddr;
    //质押代币地址
    address public ZYCoinAddr;


    //合约质押代币总量
    uint public ttTokenS;

    //每秒发放数量
    uint public num;


    constructor(address _token1,address _token2){
        coinAddr=_token1;
        ZYCoinAddr=_token2;
        owner=msg.sender;
    }

    modifier admin(){
        require(msg.sender==owner,"You are not the owner.");
        _;
    }

    function setNum(uint _num) admin public {
        num=_num;
    }

    //用户质押结构体
    struct userZy{
        address user;
        uint tokenNum;
        uint time;
    }
    //用户质押映射
    mapping(address=>userZy) public userInit;


    //用户质押
    function pledge(uint _tokenNum ) public {

        userReceive();
        userInit[msg.sender]=userZy({user:msg.sender,tokenNum:_tokenNum,time:block.timestamp});
        ttTokenS+=_tokenNum;
        // ttTokenS-=userInit[msg.sender].tokenNum;
    }
    //用户领取
    function userReceive() public {
        userZy storage UZ= userInit[msg.sender];
        if (UZ.tokenNum>0){

        require(msg.sender==UZ.user,"no owner.");
        uint a=block.timestamp-UZ.time;
        Ierc20(coinAddr).transfer(msg.sender,a*num*UZ.tokenNum/ttTokenS);
        UZ.time=block.timestamp;

        }
    }
    //用户取回本金
    function userGetBJ(uint _tokenNum) public {
        userZy storage UZ= userInit[msg.sender];
        require(msg.sender==UZ.user,"no owner.");
        userReceive();
        Ierc20(ZYCoinAddr).transfer(msg.sender,_tokenNum);
        UZ.tokenNum-=_tokenNum;


    }

    //查询代币总量
    function getTokenNum() public  view returns(uint){
        return Ierc20(coinAddr).balanceOf(address(this));
    }



}


interface Ierc20{
    function balanceOf(address account) external  view returns (uint256);
    function transfer(address to, uint256 amount) external  returns (bool);
}
