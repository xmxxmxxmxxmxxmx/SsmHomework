package com.ssm.controller;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.model.Message;
import com.ssm.service.MessageService;

@Controller
@RequestMapping("messagecontroller")
public class MessageController {
	@Resource
	private MessageService messageservice;
	
	
	@RequestMapping("querymessage")
	public String querymessage(Model model,HttpSession session,Integer currPage) {
		String loginPhone=session.getAttribute("loginphone").toString();
		model.addAttribute("messagelist", this.messageservice.queryMessageByphone(currPage,loginPhone));
		return "message_list";
	}
	
	@RequestMapping("deleteone")
	public String deleteone(Integer messageid) {
		this.messageservice.deleteon(messageid);
		return "redirect:querymessage";
	}
	
	@RequestMapping("see")
	public String see(Integer messageid,Model model) {
		model.addAttribute("messagedetail",this.messageservice.editone(messageid));	
		return "message_detail";
	}
	
	@RequestMapping("indeleteone")
	public String indeleteone(Integer messageid) {
		this.messageservice.deleteon(messageid);
		return "redirect:querymessage";
	}
	
	@RequestMapping("preupdate")
	public String preupdate(Integer messageid,Model model) {
		model.addAttribute("messagedetail",this.messageservice.editone(messageid));
		return "message_update";
	}
	
	@RequestMapping("update")
	@ResponseBody
	public Integer updatemessage(Message message) {
		int flag=0;
		try {
			String newtitle=new String(message.getMessagetitle().getBytes("iso-8859-1"),"utf-8");
			message.setMessagetitle(newtitle);
			String newdetail=new String(message.getMessagedetail().getBytes("iso-8859-1"),"utf-8");
			message.setMessagedetail(newdetail);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(message);
		this.messageservice.updatemessage(message);
		return flag;
	}
	
	@RequestMapping("addmessage")
	@ResponseBody
	public Integer addmessage(Message message) {
		
		try {
			String newtitle=new String(message.getMessagetitle().getBytes("iso-8859-1"),"utf-8");
			message.setMessagetitle(newtitle);
			String newdetail=new String(message.getMessagedetail().getBytes("iso-8859-1"),"utf-8");
			message.setMessagedetail(newdetail);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.messageservice.addmessage(message);
		Integer flag=0;
		return flag;
	}
}
