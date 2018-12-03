package com.ssm.mapper;

import java.util.List;
import java.util.Map;

import com.ssm.model.Message;

public interface MessageMapper {
    //���ݵ�¼���ֻ��Ž��в�ѯ������ص���Ϣ
	public List<Message> queryMessageByphone(String phone);
	//ɾ��ĳһ����Ϣ 
	public void deleteon(Integer messageid);
	//�༭ĳһ����Ϣ
	public Message editone(Integer messageid);
    //ĳ���û�����Ϣ����
	public Integer MessageNum(String phone);
	//�޸�ĳһ����¼
	public void updatemessage(Message message);
	//������Ϣ
	public void addmessage(Message message);
}
