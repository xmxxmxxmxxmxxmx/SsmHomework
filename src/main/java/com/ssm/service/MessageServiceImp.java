package com.ssm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.ssm.mapper.MessageMapper;
import com.ssm.model.Message;
import com.ssm.util.Page;
@Service
public class MessageServiceImp implements MessageService{

	@Autowired
	private MessageMapper messagemapper;
	
	public Page queryMessageByphone(Integer currPage,String phone) {
		Page page=new Page();
		if(currPage == null) currPage=1;
		page.setCurrPage(currPage);
		page.setTotalCount(this.messagemapper.MessageNum(phone));
		page.init();
		PageHelper.startPage(currPage, Page.PAGE_SIZE);
		page.setData(this.messagemapper.queryMessageByphone(phone));
		return page;
	}

	public void deleteon(Integer messageid) {
        this.messagemapper.deleteon(messageid);
	}

	public Message editone(Integer messageid) {
		return this.messagemapper.editone(messageid);
	}

	public void updatemessage(Message message) {
		this.messagemapper.updatemessage(message);
	}

	public void addmessage(Message message) {
		this.messagemapper.addmessage(message);
		
	}

}
