package com.ssm.mapper;

import com.ssm.model.User;

public interface UserMapper {
	//�û�ע��
	public void addUser(User user);
	//ע��֮ǰ��ѯ���ݿ������޸ú���
	public Integer queryIfexist(User user);
	//��½����
	public User ifcanlogin(User user);
}
