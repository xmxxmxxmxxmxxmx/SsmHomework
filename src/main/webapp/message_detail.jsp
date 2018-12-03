<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>消息详情</title>
<link href="css/message.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
</head>
<body>
	<div class="header">
		<nav class="navbar navbar-default navbar-static-top"> 
		<img src="picture/logo.png">
		<ul>
			   <li><a href="">消息详情</a></li>
		    </ul> 
		</nav>

	</div>
	<div class="content">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="messagetitle">${messagedetail.messagetitle}</div>
				<div class="messagedate">${messagedetail.date}</div>
				<div class="messagecontent">${messagedetail.messagedetail}</div>
			</div>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$('#delete').click(function() {
			alert("消息已经成功删除！")
		})
	})
</script>
</html>