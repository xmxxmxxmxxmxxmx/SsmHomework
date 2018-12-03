<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
				<label><h3>注册</h3></label><br> <br>
				<div class="form-group">
					<input type="email" class="form-control" id="phone"
						onblur="ifexist()" value="" placeholder="请输入手机号">
					<div class="tip" style="color: #F00" hidden="true">该号码已被注册</div>
				</div>
				<br> <br>
				<div class="form-group">
					<input type="text" class="form-control" id="exampleInputEmail3"
						value="" placeholder="请输入验证码">&nbsp&nbsp
					<button type="button" id="rcbtn" class="receivecode">获取验证码</button>
					<div hidden="true" id="showcode" style="font-size:24px" ></div>
					<div hidden="true" class="pwcodeinput">
						<img height="47" id="i" width="100" src="picture/3n3d.png">
						<a href="#" onclick="javascript:selectcode();return false;"><h5>看不清，换一张</h5></a>
						<input type="text" class="form-control" id="writepwcode" value="" />
						<button type="button" id="identifypwcode">确定</button>
					</div>
				</div>
				<br> <br>
				<div class="form-group">
					<input type="password" class="form-control" id="password" value=""
						placeholder="请输入密码">
				</div>
				<br> <br>
				<div class="checkbox">
					<label> <input type="checkbox" name="checkbox">我已阅读并同意<a href="https://privacy.qq.com/">《用户注册协议》</a>
					</label>
				</div>
				<br> <br>
				<button type="button" class="btn btn-default">提交</button>
			</form>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

    function selectcode(){
    	var images=['3n3d.png','7wob.png','dwse.png','m8k2.png'];
    	var url=images[Math.floor(Math.random()*images.length)];
    	document.getElementById('i').src="picture/"+url;
    	console.log(url);
    }
    
	function ifexist() {
		var newphone = $('#phone').val();
		if (!(/^1[34578]\d{9}$/.test(newphone))) {
			
		} else {
			$.getJSON('usercontroller/ifexist', {
				"phone" : newphone
			}, function(data) {
				console.log(data)
				if (data === 0) {
					$('.tip').toggle();
				} else {
					$('.tip').hide();
				}
			})
		}
	}

	var mfbtn = document.getElementById('rcbtn');
	var countdown = 60;
	function settime(obj) {
		if (countdown == 0) {
			obj.disabled = false;
			obj.innerHTML = "获取验证码";
			countdown = 60;
			return;
		} else {
			obj.disabled = true;
			obj.innerHTML = "重新发送(" + countdown + "s)";
			countdown--;
			mfbtn.style.background = '#999';
		}
		setTimeout(function() {
			settime(obj);
		}, 1000)
	}
	mfbtn.onclick = function() {
		$('#showcode').show();
		settime(mfbtn);
		alert("手机验证码已成功发送，请注意查收");
		var newcode = Math.floor(Math.random() * 10000);
		document.getElementById('showcode').innerHTML = newcode;
		var providecode = $('#showcode').html();
		$.getJSON('usercontroller/sessionexist', {
			"providecode" : providecode
		}, function(data) {
		})
	};

	$(function() {
		
		$('#identifypwcode').click(function(){
			var writepwcode=$('#writepwcode').val();
			var icode = document.getElementById("i").src
			var somecode=icode.substring(42,46);
			if(writepwcode===somecode){
				$("#showcode").show();
				$(".pwcodeinput").hide();
				$("#exampleInputEmail3").removeAttr("disabled")
			}else{
				alert("输入错误，请重试！");
			}
		})
		
		function insertuser(){
			console.log(">??????/")
			var newphone = $('#phone').val();
			var newpassword = $('#password').val();
			$.getJSON("usercontroller/insertuser",{"phone":newphone,"password":newpassword},function(data){				
			})
		}
		

		$('.btn').click(function() {
			var newphone = $('#phone').val();
			var newpassword = $('#password').val();
			var code = $('#exampleInputEmail3').val();
			var providecode = $('#showcode').html();
			var url = 'usercontroller/adduser';
			$.ajax({
				url : url,
				type : 'get',
				dataType : "json",
				data : {
					"phone" : newphone,
					"password" : newpassword,
					"code" : code,
					"providecode" : providecode,
				},
				success : function(data) {
					console.log(data);
					if (data === 0) {
						alert("手机验证码失效，请重新获取！")
					} else if (data === 2) {
						console.log(newpassword)
						if(!(/^1[34578]\d{9}$/.test(newphone))){
							alert("手机号码格式有误！");
						}else if(newpassword.length<4){
							alert("密码不得少于4位！")
						}else if(frm.checkbox.checked==true){
							alert("您已经成功注册！")
							insertuser();
							window.location.href="login.jsp";
						}else{
							alert("请阅读并同意相关协议可注册！")
						}
					}else if (data === 1) {
						alert("验证码输入错误，请重新输入")
						$("#showcode").hide();
						$(".pwcodeinput").show();
						document.getElementById("exampleInputEmail3").disabled="true"
					}else if (data === 9) {
						alert("请将各项填写完整！")
					} else if (data === 3) {
						alert("该手机号已被注册，请前去登陆！")
					}
				}

			})
		})

	})
</script>
</html>