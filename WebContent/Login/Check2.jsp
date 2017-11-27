<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>检验注册页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--  
    <link rel="stylesheet" type="text/css" href="styles.css">  
    -->

</head>

<body>
	<br>

	<%
		String driverName = "com.mysql.jdbc.Driver";
		String userName = "root";//数据库名  
		String userPasswd = "123";//数据库密码  
		String dbName = "company personnel management system"; //数据库名修改处 
		String url = "jdbc:mysql://localhost/company personnel management system?user=root&password=123";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection(url);
		Statement statement = connection.createStatement();

		request.setCharacterEncoding("utf-8");
		String users = request.getParameter("username");
		String pass = request.getParameter("pwd");
		
		String sal = "select username from Login where username='"
				+ users + "' ";
		ResultSet rs;
		rs = statement.executeQuery(sal);

		if (rs.next())//上面两句代码这里是判断工号是否存在的
		{
			out.println("<div align=\"center\"><font color=black size=4>用户名"
					+ users + "已经存在，请重新输入！ </font></div>");
			response.setHeader("Refresh", "1.2;URL=register.jsp");
			rs.close();
			return;
		}
		
		PreparedStatement sql = connection
				.prepareStatement("insert into Login(username,password)values(?,?)");
		sql.setString(1, users);
		sql.setString(2, pass);
		int rtn = sql.executeUpdate();
		sql.close();
		connection.close();

		
	%>
	<%
	out.println("<div align=\"center\"><font color=black size=4>注册成功 </font></div>");
		response.setHeader("refresh", "1.2;url=login.jsp");
	%>
</body>
</html>

