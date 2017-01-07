<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%@ page import="java.util.*" import="java.sql.*"%>

<html>
<%	request.setCharacterEncoding("UTF-8");%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=
	DriverManager.getConnection("jdbc:mysql://localhost:3306/zk2013150138?user=root&password=");
	Statement stat=conn.createStatement();
%>
<head>

<title>课 件</title>
<style type="text/css">
	.btn02 { background:#fff;
	 height:24px; width:55px; color:#297405; border:2px solid #90be4a;
	  font-size:12px; font-weight:bold; line-height:180%; cursor:pointer;}
	 .text2 { border:2px solid #90be4a; width:600px; height:40px; font-size:16px;
	  font-weight:bold; line-height:1.6;}
	  .area { border:2px solid #90be4a;  overflow:auto; width:550px; height:169px;}
</style>
</head>

<body  background="photo/yellowblue.jpg">
<p align="center"><b><font color="#297405" size="5">
课件下载</font></font></b></p>

<table align="center" border="1" class="text2" width="618" height="132">
<tr>
<td width="467">课件</td>
<td>下载</td>
<td>删除</td>
</tr>
<%
int cou=1;
String sql1="select name from file";
String name=null;
ResultSet rs=stat.executeQuery(sql1);
while(rs.next())
{
name=rs.getString("name");
%>
<tr>
<td width="467">课件<%out.print(cou);cou++;%>：<%out.print(name);%></td>
<td><a href="download.jsp?file=<%out.print(name);%>" style="text-decoration: none">下载</a></td>
<td><a href="delete1.jsp?id=<%out.print(name);%>&ty=kj" style="text-decoration: none">删除</a></td>
</tr>
<%}%>
</table>

</body>

</html>