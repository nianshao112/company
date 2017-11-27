<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<html>
<head>
<link rel="stylesheet" href="list.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function chk(id) {
		if (confirm("你是否要删除员工编号为“" + id + "”的员工")) {
			location.href = "PersonDelete.jsp?id=" + id;//问题没有解决
			//location.href="./PersonDelete.jsp?tcontent="+encodeURI(encodeURI(id));
		}
	}
	function chg(id) {
		if (confirm("你是否要修改员工编号为“" + id + "”的员工")) {
			location.href = "PersonUpdate.jsp?id=" + id;
		}
	}
	
</script>


<title>员工表单</title>
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

		String sql = "SELECT * FROM personnel "; //倒序遍历整张表 
		ResultSet rs;
		rs = statement.executeQuery(sql);
		//ResultSetMetaData rmeta = rs.getMetaData();  
		// int numColumns = rmeta.getColumnCount();
	%>
	
	<form id="customers">
	<div id="d" align="center">员工表单</div>
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
					<th colspan="2" id="a"><button class="button4"
							onclick="javascrtpt:window.location.href='PersonAdd.jsp'">添加</button>
					<button class="button4"
							onclick="javascrtpt:window.location.href='PersonSelect.jsp'">检索</button>
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
						out.print("<td colspan=\"2\" id=\"a\"><button class=\"button\" onclick=\"chg(\'"
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

