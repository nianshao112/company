<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>跳转</title>
<script language="javascript">
	window.navigate("PersonList.jsp");
</script>
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
		request.setCharacterEncoding("UTF-8");
		out.print( request.getParameter("id"));
		//String id = request.getParameter("id");
		String id =java.net.URLDecoder.decode((String)request.getParameter("id"), "UTF-8");
		//String id = new String(request.getParameter("id").getBytes("UTF-8")); 
		String sql = "delete from personnel where EmployeeNumbers = '"+ id +"'";
		statement.executeUpdate(sql);
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
