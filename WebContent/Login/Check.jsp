<%@ page language="java" import="java.sql.*"
	contentType="text/html;charset=utf-8"%>
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
<title>My JSP 'check.jsp' starting page</title>
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
	<%
		request.setCharacterEncoding("utf-8");
		String users = request.getParameter("username");
		String pass = request.getParameter("pwd");
		boolean flag = false;
		PreparedStatement sql = null;
		ResultSet rs = null;
		Connection conn = null;
	%>

	<%
		/* String driver = "com.mysql.jdbc.Driver";    
		String url = "jdbc:mysql://127.0.0.1:3307/login";    
		String use = "root";     
		String password = "123"; */
		String driverName = "com.mysql.jdbc.Driver";
		String userName = "root";//数据库名  
		String userPasswd = "123";//数据库密码  
		String dbName = "company personnel management system"; //数据库名修改处 
		String url = "jdbc:mysql://localhost/company personnel management system?user=root&password=123";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection(url);
		Statement statement = connection.createStatement();
		sql = connection.prepareStatement("select * from Login where username=? and password=?");
		sql.setString(1, users);
		sql.setString(2, pass);
		rs = sql.executeQuery();
		if (rs.next()) {
			flag = true;
		}
		rs.close();
		sql.close();
		connection.close();
	%>
	<!-- 判断是否是正确的登录用户 -->
	<%
		if (flag == true) {
	%>
	<jsp:forward page="show.jsp" />
	<%
		} else if (flag == false) {
	%>
	<jsp:forward page="login_fail.jsp" />
	<%
		}
	%>
</body>
</html>
