<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="add.css" type="text/css" />
<title>用户登录</title>
</head>
<body >
	
		<form action="check.jsp"  method="post" id="customers">
		
		<div id="d" align="center"><font >员工登录 </font></div>
		<center>
		<br><br>
			<table>
			
				
				<tr>
					<td>用户名:</td>
					<td><input type="text" name="username" /></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input type="password" name="pwd" /></td>
				</tr>
				
					
			</table>
				<br><br>
			<input type="submit" value="登录" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="重置" />
			<br><br>
			<b>如果您还没有注册，请单击<a href="register.jsp">这里</a>注册！</b>
			
			</center>
		</form>
		
</body>

</html>

