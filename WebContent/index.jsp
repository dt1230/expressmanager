<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Express物流查询</title>
<link rel="stylesheet" href="css/cityselect.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<style type="text/css">
	.demo{width:220px;margin:50px auto;}
	.demo input{padding: 12px 18px;}
</style>

</head>
<body style="background-image: url(image/background.jpg);-moz-background-size:100% 100%; background-size:100% 100%;">
<div  >
	<div style="text-align: center;margin:200px auto auto 20px;">
	
	<h1 >欢迎使用本系统</h1>
	<h3 >请选择你需要的服务：</h3>
	</div>

	<div class="demo">
		<center>
			<button onclick="javascript:window.location='selectExpress.jsp'"
				style="color: #fff; background-color: #4B95FF; border-color: #2a75fe; border-radius: 5px; height: 45px; width: 100%">我要查询快递</button>
		</center>
	</div>
	<div class="demo">
		<center>
			<button onclick="javascript:window.location='selectFreightLimitation.jsp'"
				style="color: #fff; background-color: #4B95FF; border-color: #2a75fe; border-radius: 5px; height: 45px; width: 100%">我要查看运费时效</button>
		</center>
	</div>
	<div class="demo">
		<center>
			<button onclick="javascript:window.location='addorder.jsp'"
				style="color: #fff; background-color: #4B95FF; border-color: #2a75fe; border-radius: 5px; height: 45px; width: 100%">我要发快递</button>
		</center>
	</div>
	</div>
<div style="text-align:center;">
<br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>

</body>
</html>