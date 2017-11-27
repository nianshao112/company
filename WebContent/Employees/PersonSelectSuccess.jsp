<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function chk(id) {
		if (confirm("你是否要删除员工编号为“" + id + "”的员工")) {
			location.href = "PersonDelete.jsp?id=" + id;
		}
	}
	function chg(id) {
		if (confirm("你是否要修改员工编号为“" + id + "”的员工")) {
			location.href = "PersonUpdate.jsp?id=" + id;
		}
	}
</script>
<link rel="stylesheet" href="list.css" type="text/css" />
<title>查询成功页面</title>
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
		String type = request.getParameter("type");
		String value = request.getParameter("xx");
		String sql = "select * from personnel where "+type+" = '"
				+ value + "'";
		ResultSet rs;
		rs = statement.executeQuery(sql);
	%>

	<form id="customers">
		<div id="d" align="center">查询页面</div>
		<br><br>
		<div style="width: 100%; text-align: center">
			<table id="customers">
				<tr>
					<th>员工编号
					<th>照片
					<th>姓名
					<th>年龄
					<th>性别
					<th>出生日期
					<th>民族
					<th>政治面貌
					<th colspan="2"><button class="button4"
							onclick="javascrtpt:window.location.href='PersonList.jsp'">返回主页面</button>
					
				</tr>

				<%
					while (rs.next()) {
						out.print("<tr>");
						out.print("<td>" + rs.getString(1) + "</td>");
						out.print("<td>" + rs.getString(2) + "</td>");
						out.print("<td>" + rs.getString(3) + "</td>");
						out.print("<td>" + rs.getString(4) + "</td>");
						out.print("<td>" + rs.getString(5) + "</td>");
						out.print("<td>" + rs.getString(6) + "</td>");
						out.print("<td>" + rs.getString(7) + "</td>");
						out.print("<td>" + rs.getString(8) + "</td>");
						out.print("<td colspan=\"2\"><button class=\"button\" onclick=\"chg(\'"
								+ rs.getString(1) + "\')\" > 更新 </button>");
						out.print("<button class=\"button\" onclick=\"chk(\'"
								+ rs.getString(1) + "\')\" > 删除 </button></td>");
						out.print("</tr>");

					}
				%>

			</table>
		</div>
	</form>
</body>
</html>
