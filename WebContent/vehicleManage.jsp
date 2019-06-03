<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆管理</title>
</head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<body><table class="table">
<thead>
					<tr>
						<th>
							车牌号
						</th>
						<th>
							车辆型号
						</th>
						<th>
							价格
						</th>
						<th>
							驾驶员工
						</th>
						<th>
							所属仓库/备注
						</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${vehicleList }" var="vehicle">
					<tr class="warning">
						<td>
							${vehicle.id }
						</td>
						<td>
							${vehicle.type }
						</td>
						<td>
							${vehicle.price }
						</td>
						<td>
							${vehicle.driver }
						</td>
						<td>
							${vehicle.pt }
						</td>
						<td>
						<!-- 当车辆没有绑定驾驶员的时候，显示“ 绑定驾驶员 ” 按钮 -->
						<c:if test="${vehicle.driver == ''}">
							<a class="btn btn-danger delete" style="background-color: red;" href="javascript:addDriver(id='${vehicle.id }')">绑定驾驶员</a>	
						</c:if>
						<a class="btn btn-danger delete" style="background-color: red;" href="javascript:removeorder(id='${vehicle.id }')">删除</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table> 
</body>
<script type="text/javascript">
function removeorder(id){
	 $.ajax({
		type : "post",
		url : "vehicleremove.do?id="+id,
		async : true,
		dataType : 'text',
		success : function(data) {
			alert("删除成功！");
			location.reload(true);
		},
		error : function(data) {
			alert("出错！请联系管理员");
		}
	}); 
}



function addDriver(id){
	var staffid=prompt("请输入驾驶员员工号","");
	$.ajax({
		type : "post",
		url : "addDriver.do",
		data : {
			"id" : id,
			"staffid": staffid
		},
		async : true,
		dataType : 'text',
		success : function(data) {
			if(data=='0'){
				alert("员工号输入有误！");
				return;
			}
			alert(data);
			location.reload(true);
		},
		error : function(data) {
			alert("出错！请联系管理员");
		}
	});
}
</script>
</html>