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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/message.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
</head>
<body>
<div class="header">
		<nav class="navbar navbar-default navbar-static-top"> <img
			src="picture/logo.png">
		<ul>
			<li><a href="">消息新增</a></li>
		</ul>
		</nav>
		
<div class="content">
		<div class="panel panel-default">
			<div class="panel-body">
			<input type="text" hidden="true" value="${loginphone}" id="loginphone" name="loginphone" />
				<form>
					<input type="hidden" id="messageid" value="" />
					<lable>消息标题：</lable>
					<input type="text" id="messagetitle" name="messagetitle"
						value="" /> <br> <br> <br>
					<lable style="vertical-align: top">消息正文：</lable>
					<textarea cols="100" rows="10" id="messagedetail" name="messagedetail"></textarea>
				</form>
				<div class="btndiv">
				<button onclick="savemessage()" class="btn btn-success btn-lg">保存</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function savemessage(){
		var messagetitle=$('#messagetitle').val();
		var messagedetail=$('#messagedetail').val();
		var phone=$('#loginphone').val();
		console.log(phone)
		$.getJSON("messagecontroller/addmessage",{"messagetitle":messagetitle,"messagedetail":messagedetail,"phone":phone},function(data){
			if(data===0){
				location.href="messagecontroller/querymessage";
			}
		})
	}
</script>
</html>