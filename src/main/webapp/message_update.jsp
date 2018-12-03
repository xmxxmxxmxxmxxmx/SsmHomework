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
		<nav class="navbar navbar-default navbar-static-top"> <img
			src="picture/logo.png">
		<ul>
			<li><a href="">消息更新</a></li>
		</ul>
		</nav>

	</div>
	<div class="content">
		<div class="panel panel-default">
			<div class="panel-body">
				<form>
					<input type="hidden" id="messageid" value="${messagedetail.id}" />
					<lable>消息标题：</lable>
					<input type="text" id="messagetitle"
						value="${messagedetail.messagetitle}" /> <br> <br> <br>
					<lable>消息日期：</lable>
					<input type="date" id="date" value="${messagedetail.date}" /> <br>
					<br> <br>
					<lable style="vertical-align: top">消息正文：</lable>
					<textarea cols="100" rows="10" id="messagedetail">${messagedetail.messagedetail}</textarea>
				</form>
				<div class="btndiv">
					<button id="save" class="btn btn-success btn-sm">保存</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$("#save").click(function() {
			var messageid = $("#messageid").val();
			var date = $("#date").val();
			var messagetitle = $("#messagetitle").val();
			var messagedetail = $("#messagedetail").val();
			/* $.getJSON("messagecontroller/update", {
				"date" : date,
				"messagetitle" : messagetitle,
				"messagedetail" : messagedetail,
				"id":messageid
			}, function(data) {
				if(data==0){
					console.log(data)
					window.location.href="messagecontroller/querymessage";
				}
			}) */
			var url='messagecontroller/update';
			$.ajax({
				url : url,
				type : 'get',
				dataType : "json",
				data : {
					"date" : date,
					"messagetitle" : messagetitle,
					"messagedetail" : messagedetail,
					"id" : messageid,
				},
				success : function(data){
					if(data===0){
						console.log(data)
						location.href="messagecontroller/querymessage";
					}
				}
			})
		})
	})
</script>
</html>