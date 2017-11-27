<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="add.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language=javascript>
	function check(str) {
		exp = /[^\w]/gi;
		if (str.search(exp) != -1) {
			return false;
		}
		
		return true;
	}
	
	function checkinput() {
		if (!check(document.form.EmployeeNumbers.value)) {
			alert("员工编号只能输入字母和数字的组合");
			return false;
		}
		if (document.form.EmployeeNumbers.value == "") {
			alert("员工编号不能为空");
			return false;
		}
		return true;
	}
</script>

<title>添加员工</title>
</head>
<body>


	<form  action="PersonSuccess.jsp" name=form onsubmit=return(checkinput())  method="post" id="customers">
	<div id="d" align="center"><font>员工信息录入 </font></div>
		<center>
		<br><br>
		<table border="0">
			<tr>
				<td>员工编号：</td>
				<td><input type="text" name="EmployeeNumbers"></input></td>
				<td style="color:red">*必填项</td>
			</tr>

			<tr>
				<td>照片：</td>
				<td><input type="text" name="Photographs"></input><br></td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td><input type="text" name="Name"></input><br></td>
			</tr>
			<tr>
				<td>年龄：
				<td><input type="text" name="Age"></input></td>
			</tr>
			<tr>
				<td>性别：
				<td><input type="radio" name="Sex" value="男">男 <input
					type="radio" name="Sex" value="女">女</td>
			</tr>
			<tr>
				<td>出生日期：
				<td><input type="text" name="DateOfBirth"></input></td>
			</tr>
			<tr>
				<td>民族：
				<td><input type="text" name="Peoples"></input></td>
			</tr>
			<tr>
				<td>政治面貌：
				<td><input type="text" name="PoliticalLandscape"></input></td>
			</tr>
			
		</table>
		<br><br>
		
		<input type="reset" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="提交" />


	</center>
	</form>
</body>
</html>

