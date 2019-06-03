<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!--声明文档兼容模式，表示使用IE浏览器的最新模式-->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!--设置视口的宽度(值为设备的理想宽度)，页面初始缩放值<理想宽度/可见宽度>-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 这3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>员工登录</title>
		<!-- 引入Bootstrap核心样式文件 -->
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<!-- 引入jQuery核心js文件 -->
		<script src="../js/jquery-1.11.0.min.js"></script>
		<!-- 引入BootStrap核心js文件 -->
		<script src="../js/bootstrap.min.js"></script>
		
</head>
<body style=" background-image: url(image/background.jpg);-moz-background-size:100% 100%;background-size:100% 100%;">
<div align="center" style="padding-top: 50px;">
		<form action="login.do" method="post" >
		<table  width="740" height="500" style=" background-color: rgba(246,246,246,0.5);" >
			<tr height="200"></tr>
			<tr height="30" style="margin-top:200px;">
				<td width="20%"></td>
				<td width="20%">员工号：</td>
				<td><input type="text" value="${userName }" name="username" id="userName"/></td>
				<td width="40%"></td>
			</tr>
			<tr height="30">
				<td width="40%"></td>
				<td width="10%">密  码：</td>
				<td><input type="password" value="${password }" name="password" id="password"/></td>
				<td width="30%"></td>
			</tr>
			<tr height="30">
				<td width="40%"></td>
				<td width="10%"><input type="submit" value="登录"/></td>
				<td><input type="button" value="重置" onclick="resetValue()"/></td>
				<td width="30%"></td>
			</tr>
			<tr height="10">
				<td width="40%"></td>
				<td colspan="3">
					<font color="red">${error }</font>
				</td>
			</tr>
			<tr >
				<td></td>
			</tr>
		</table>
		</form>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>