<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>
<head>

<title>初 始 化</title></head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=
	DriverManager.getConnection("jdbc:mysql://localhost/?user=root&password=");
	Statement stat=conn.createStatement();
	String sql="create database zk";
	stat.executeUpdate(sql);
	stat.close();
	conn.close();
%>
</body>

</html>
