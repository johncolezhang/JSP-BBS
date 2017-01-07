<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=
	DriverManager.getConnection("jdbc:mysql://localhost:3306/zk2013150138?user=root&password=");
	Statement stat=conn.createStatement();
%>
<html>

<style type="text/css">
	.btn02 { background:#fff;
	 height:24px; width:55px; color:#297405; border:2px solid #90be4a;
	  font-size:12px; font-weight:bold; line-height:180%; cursor:pointer;}
	 .text2 { border:2px solid #90be4a; width:200px; height:24px; font-size:16px;
	  font-weight:bold; line-height:1.6;}
	  .area { border:2px solid #90be4a;  overflow:auto; width:550px; height:169px;}
</style>
<head>
<title>信 息 管 理</title>
</head>
<%
ArrayList l=(ArrayList)session.getAttribute("login");
String ad1=(String)l.get(3);

%>
<body background="photo/yellowblue.jpg">
	<p align="center"><b><font color="#297405" size="5">你发布过的主题</font></b>
<%
String sql1="select content,time from topic where name='"+ad1+"'";
ResultSet rs=stat.executeQuery(sql1);
while(rs.next())
{
%>
<table align="center" class="text02">
<tr><td>内容：</td>
<td><%out.print(rs.getString("content"));%>&nbsp;</td><td>时间：</td>
<td><%out.print(rs.getString("time"));%></td>
</tr>
</table>
<br>
<%
}
%>

<p align="center"><b><font color="#297405" size="5">你发布过的评论</font></b>
<%
String sql2="select content,time from reply where name='"+ad1+"'";
rs=stat.executeQuery(sql2);
while(rs.next())
{
%>
<table align="center" class="text02">
<tr><td>内容：</td>
<td><%out.print(rs.getString("content"));%>&nbsp;</td><td>时间：</td>
<td><%out.print(rs.getString("time"));%></td>
</tr>
</table>

<br>
<%
}
%>

<p align="center"><b><font color="#297405" size="5">你发布过的通知</font></b>
<%
String sql3="select content,time from notice where name='"+ad1+"'";
rs=stat.executeQuery(sql3);
while(rs.next())
{
%>
<table align="center" class="text02">
<tr><td>内容：</td>
<td><%out.print(rs.getString("content"));%>&nbsp;</td><td>时间：</td>
<td><%out.print(rs.getString("time"));%></td>
</tr>
</table>
<br>
<%
}
%>

</body>

</html>
