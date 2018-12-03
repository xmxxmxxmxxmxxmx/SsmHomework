package com.ssm.mapper;

import com.ssm.model.User;

public interface UserMapper {
	//用户注册
	public void addUser(User user);
	//注册之前查询数据库中有无该号码
	public Integer queryIfexist(User user);
	//登陆检验
	public User ifcanlogin(User user);
}
