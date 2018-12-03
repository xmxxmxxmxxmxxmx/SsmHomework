<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<link href="css/register.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
</head>
<body>
	<div class="header">
		<img src="picture/logo.png">
		<hr>
	</div>
	<div class="content">
		<div class="picture">
			<img src="picture/picture.png">
		</div>
		<div class="register">
			<form class="form-inline" name="frm">
				<label><h3>登录</h3></label><br> <br>
				<div class="form-group">
					<input type="email" class="form-control" id="phone" value=""
						placeholder="请输入手机号">
				</div>
				<br> <br>
				<div class="form-group">
					<input type="password" class="form-control" id="password" value=""
						placeholder="请输入密码">
				</div>
				<br> <br> <br> <br> <br>
				<p>
					<a href="register.jsp">快速注册</a>
				</p>
				<button type="button" id="login" class="btn btn-success">登录</button>
			</form>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$('.btn').click(function() {
			var phone = $('#phone').val();
			var password = $('#password').val();
			$.getJSON('usercontroller/login', {
				"phone" : phone,
				"password" : password
			}, function(data) {
				if(data===0){
					alert("请将登录信息填写完整！")
				}else if(data===1){
					location.href="messagecontroller/querymessage"
				}else if(data===2){
					alert("登录密码有误！")
				}else if(data===3){
					alert("登录账号有误！")
				}
				else if(data===4){
					var loginbtn=document.getElementById("login");
					/* document.getElementById("login").disabled=true;
					document.getElementById("login").style.background = '#999'; */
					var countdown = 120;
					function settime(obj) {
						if (countdown == 0) {
							obj.disabled = false;
							obj.innerHTML = "登录";
							countdown = 120;
							loginbtn.style.background = '#5cb85c';
							return;
						} else {
							obj.disabled = true;
							obj.innerHTML = "重新发送(" + countdown + "s)";
							countdown--;
							loginbtn.style.background = '#999';
						}
						setTimeout(function() {
							settime(obj);
						}, 1000)
					}
					settime(loginbtn);
					alert("您登陆出错已达到3次，请在2分钟后重新进行登陆操作！");
				}
			})
		})
	})
</script>
</html>