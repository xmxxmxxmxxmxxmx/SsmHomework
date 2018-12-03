package com.ssm.service;

import java.util.List;
import java.util.Map;

import com.ssm.model.Message;
import com.ssm.util.Page;

public interface MessageService {
    //���ݵ�¼���ֻ��Ž��в�ѯ������ص���Ϣ
	public Page queryMessageByphone(Integer currPage,String phone);
	
	//ɾ��ĳһ����Ϣ 
	public void deleteon(Integer messageid);
	
	//�༭ĳһ����Ϣ
	public Message editone(Integer messageid);
	
	//�޸�ĳһ����¼
	public void updatemessage(Message message);
	
	//������Ϣ
	public void addmessage(Message message);
}
