<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询页面</title>
<link rel="stylesheet" href="add.css" type="text/css" />
</head>
<body>

<form  id="customers" action="PersonSelectSuccess.jsp" method="post" id="form">
				<center>
				<div id="d" align="center">员工查询</div>
				<br><br>
				<table border="0">
					<tr>
							<td><select name="type">
								<option value ="EmployeeNumbers">员工编号</option>
				 				<option value ="Name">姓名</option>
				 				<option value ="Sex">性别</option>

			  				</select><br></td>
							<td>
							<input type="text" name="xx" ></input>
							</td>
							
					</tr>
					
			
					
						
			  </table>
			  <br><br>
					<input type="submit" value="开始检索"/>
			</center>
			</form>
</body>
</html>
