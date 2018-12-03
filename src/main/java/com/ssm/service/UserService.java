package com.ssm.service;

import javax.servlet.http.HttpSession;

import com.ssm.model.User;

public interface UserService {
	public Integer addUser(String code,User user,HttpSession session);
	public Integer queryIfexist(User user);
	public Integer login(User user);
	public void insertuser(User user);
}
