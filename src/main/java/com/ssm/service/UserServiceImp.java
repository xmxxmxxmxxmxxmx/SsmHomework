package com.ssm.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssm.mapper.UserMapper;
import com.ssm.model.User;

@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserMapper usermapper;

	public Integer addUser(String code, User user, HttpSession session) {
		int flag = 2;
		//StringUtils.isNotEmpty(user.getPhone())
		//StringUtils.EMPTY.equals(user.getPhone())
		//"".equals(user.getPhone())
		if (StringUtils.isEmpty(user.getPhone())
				|| StringUtils.isEmpty(user.getPassword())
				|| StringUtils.isEmpty(code)) {
			flag = 9;
		} else if(session.getAttribute("sessionprovidecode")==null) {
			flag=0;
		} else if(!session.getAttribute("sessionprovidecode").toString().equals(code)) {
			flag=1;
		} else if(this.usermapper.queryIfexist(user)==1) {
			flag=3;
		}
		return flag;
	}

	public Integer queryIfexist(User user) {
		return this.usermapper.queryIfexist(user);
	}

	public Integer login(User user) {
		int flag = 0;// 0Ä¬ÈÏµÇÂ½²»ÆðÀ´ 1µÇÂ½³É¹¦ 2ÃÜÂë´íÎó 3ÕËºÅ´íÎó
		User u = this.usermapper.ifcanlogin(user);
		if (user.getPhone() != null && !user.getPhone().equals("")) {
			if (u != null) {
				String MD5password = this.convertMD5(user.getPassword());
				if (u.getPassword().equals(MD5password)) {
					flag = 1;
				} else {
					flag = 2;
				}
			} else {
				flag = 3;
			}
		}

		return flag;
	}

	// md5±àÂë
	public static String convertMD5(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			return new BigInteger(1, md.digest()).toString(16);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;

	}

	public void insertuser(User user) {
		this.usermapper.addUser(user);
	}

}
