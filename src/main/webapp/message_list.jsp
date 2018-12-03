<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>注册</title>
<link href="css/message.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
</head>
<body>
	<div class="header">
		<nav class="navbar navbar-default navbar-static-top"> <img
			src="picture/logo.png">
		<ul>
			<li><a href="">消息列表</a></li>
			<li><a href="">账单详情</a></li>
			<li><a href="">业务办理</a></li>
			<li><a href="">售后服务</a></li>
		</ul>
		</nav>
		<div id="cancel">
			<a href="usercontroller/cancel">注销</a>
		</div>
	</div>
	<div class="content">
		<form name="frm" action="messagecontroller/querymessage">
			<input type="hidden" id="currPage" name="currPage" />
		</form>
		<a href="message_add.jsp" class="btn btn-success btn-sm" role="button">新增消息</a>
		</td>
		<table class="table table-striped ">
			<tr class="label-success">
				<th style="width: 5%">序号</th>
				<th style="width: 40%">消息标题</th>
				<th style="width: 15%">消息日期</th>
				<th style="width: 10%">操作</th>
			</tr>
			<c:forEach items="${messagelist.data}" var="ml" varStatus="status">
				<tr>
					<td>${status.index+1}</td>
					<td><a href="messagecontroller/see?messageid=${ml.id}">${ml.messagetitle}</a></td>
					<td>${ml.date}</td>
					<td><a href="messagecontroller/deleteone?messageid=${ml.id}"
						class="btn btn-danger btn-sm" role="button">删除</a> <a
						href="messagecontroller/preupdate?messageid=${ml.id}"
						class="btn btn-success btn-sm" role="button">编辑</a></td>
				</tr>
			</c:forEach>

		</table>

		<div>
			共${messagelist.totalPage}页 第${messagelist.currPage}页 <a
				href="javascript:go(1)">首页</a>
			<c:if test="${messagelist.currPage>1 }">
				<a href="javascript:go(${messagelist.currPage-1})">
			</c:if>
			上一页
			<c:if test="${messagelist.currPage>1 }">
				</a>
			</c:if>
			<c:if test="${messagelist.currPage<messagelist.totalPage }">
				<a href="javascript:go(${messagelist.currPage+1})">
			</c:if>
			下一页
			<c:if test="${messagelist.currPage>=messagelist.totalPage }">
				</a>
			</c:if>
			<a href="javascript:go(${messagelist.totalPage})">末页</a>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function go(currPage) {
		$('#currPage').val(currPage)
		document.frm.submit();
	}
</script>
</html>