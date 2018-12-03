package com.ssm.mapper;

import java.util.List;
import java.util.Map;

import com.ssm.model.Message;

public interface MessageMapper {
    //根据登录的手机号进行查询所有相关的消息
	public List<Message> queryMessageByphone(String phone);
	//删除某一条消息 
	public void deleteon(Integer messageid);
	//编辑某一条消息
	public Message editone(Integer messageid);
    //某个用户的消息总量
	public Integer MessageNum(String phone);
	//修改某一条记录
	public void updatemessage(Message message);
	//增加消息
	public void addmessage(Message message);
}
