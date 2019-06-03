<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建车辆</title>
</head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-6 column">
			<form class="form-horizontal" action="addstaff.do" method="post" role="form">
			<input type="hidden" name="pt" value="${loginUser.type}">
			    <div class="form-group">
					 <label for="inputEmail1" class="col-sm-2 control-label">车牌号</label>
					<div class="col-sm-10">
						<input width="80px;" type="text" class="form-control" id="inputEmail1" name="name" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail1" class="col-sm-2 control-label">车辆型号</label>
					<div class="col-sm-10">
						<input width="80px;" type="text" class="form-control" id="inputEmail1" name="name" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail1" class="col-sm-2 control-label">价格</label>
					<div class="col-sm-10">
						<input width="80px;" type="text" class="form-control" id="inputEmail1" name="name" />
					</div>
				</div>
				
				 <button type="submit" class="btn btn-default">添加</button>
			</form>
		</div>
		<div class="col-md-6 column">
		</div>
	</div>
</div>
</body>
</html>