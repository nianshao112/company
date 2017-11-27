<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="add.css" type="text/css" />
<title>添加员工</title>
</head>
<body>
	<%
		String driverName = "com.mysql.jdbc.Driver";
		String userName = "root";//数据库名  
		String userPasswd = "123";//数据库密码  
		String dbName = "company personnel management system"; //数据库名修改处 
		String url = "jdbc:mysql://localhost/company personnel management system?user=root&password=123";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection(url);
		Statement statement = connection.createStatement();
		String id = request.getParameter("id");
		String sql = "select * from personnel where EmployeeNumbers = '"
				+ id + "'";
		ResultSet rs;
		rs = statement.executeQuery(sql);
	%>


	<form action="PersonSuccess.jsp" method="post" id="customers">
		<div id="d" align="center">
			<font>员工信息更新 </font>
		</div>
		<br>
		<br>
		<center>
			<table border="0">
				<tr>
					<td>员工编号：</td>
					<td><input type="text" name="EmployeeNumbers"
						value="<%while (rs.next()) {
				out.print(rs.getString(1));%>"></input>
					</td>
					<td style="color:red">*必填项</td>
				</tr>
				<tr>
					<td>照片：</td>
					<td><input type="text" name="Photographs"
						value="<%out.print(rs.getString(2));%>"><br></td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="Name"
						value="<%out.print(rs.getString(3));%>"><br></td>
				</tr>
				<tr>
					<td>年龄：
					<td><input type="text" name="Age"
						value="<%out.print(rs.getString(4));%>"></td>
				</tr>
				<tr>
					<td>性别：
					<td>
						<%
							//此处有相对于简单的写法，最终用比较复杂的方法解决了，懒得改了
								String x = rs.getString(5);
								//out.print(rs.getString(5));
								if (x.equals("男")) {//用equals进行内容的判定，此处不能用==
									out.print("<input checked=\"true\" type=\"radio\" name=\"Sex\" value=\"男\">男 <input type=\"radio\" name=\"Sex\" value=\"女\">女");
								} else {
									out.print("<input type=\"radio\" name=\"Sex\" value=\"男\">男 <input  checked=\"true\"  type=\"radio\" name=\"Sex\" value=\"女\">女");
								}
						%>
					</td>
				</tr>
				<tr>
					<td>出生日期：
					<td><input type="text" name="DateOfBirth"
						value="<%out.print(rs.getString(6));%>"></td>
				</tr>
				<tr>
					<td>民族：
					<td><input type="text" name="Peoples"
						value="<%out.print(rs.getString(7));%>"></td>
				</tr>
				<tr>
					<td>政治面貌：
					<td><input type="text" name="PoliticalLandscape"
						value="<%out.print(rs.getString(8));
			}%>"></td>
				</tr>


			</table>
			<br>
			<br> <input type="reset" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="提交" />
		</center>
	</form>
	<%
		String sml = "delete from personnel where EmployeeNumbers = '" + id
				+ "'";
		statement.executeUpdate(sml);
	%>
	<%
		if (statement != null) {
			statement.close();
			statement = null;
		}
		if (connection != null) {
			connection.close();
			connection = null;
		}
	%>
</body>
</html>

