<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>跳转</title>

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
		String EmployeeNumbers = request.getParameter("EmployeeNumbers");
		
		String Photographs = request.getParameter("Photographs");
		String Name = request.getParameter("Name");
		String Age = request.getParameter("Age");
		String Sex = request.getParameter("Sex");
		String DateOfBirth = request.getParameter("DateOfBirth");
		String Peoples = request.getParameter("Peoples");
		String PoliticalLandscape = request
				.getParameter("PoliticalLandscape");
		
		String sal = "select EmployeeNumbers from personnel where EmployeeNumbers='"+EmployeeNumbers+"' ";
		ResultSet rs;
		rs = statement.executeQuery(sal);
		
		if(rs.next())//上面两句代码这里是判断工号是否存在的
		{
		out.println("<div align=\"center\"><font color=black size=4>员工编号为"+EmployeeNumbers+"的员工已经存在，请重新输入！ </font></div>");
		response.setHeader("Refresh","1.2;URL=PersonAdd.jsp");
		rs.close();
		return;
		}
				
		String sql = "insert into personnel(EmployeeNumbers,Photographs,Name,Age,Sex,DateOfBirth,Peoples,PoliticalLandscape) values('"
				+ EmployeeNumbers
				+ "','"
				+ Photographs
				+ "','"
				+ Name
				+ "','"
				+ Age
				+ "','"
				+ Sex
				+ "','"
				+ DateOfBirth
				+ "','"
				+ Peoples + "','" + PoliticalLandscape + "')";
	
		statement.executeUpdate(sql);
		response.setHeader("Refresh","0;URL=PersonList.jsp");
	
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

