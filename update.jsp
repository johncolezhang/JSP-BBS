<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=
	DriverManager.getConnection("jdbc:mysql://localhost:3306/zk2013150138?user=root&password=");
	Statement stat=conn.createStatement();
	ArrayList l=(ArrayList)session.getAttribute("login");
	String ad1=(String)l.get(0);
	String ty=(String)l.get(1);
%>

<html>
<head>
<style type="text/css">
	.btn02 { background:#fff;
	 height:24px; width:55px; color:#297405; border:2px solid #90be4a;
	  font-size:12px; font-weight:bold; line-height:180%; cursor:pointer;}
	 .text2 { border:2px solid #90be4a; width:200px; height:24px; font-size:16px;
	  font-weight:bold; line-height:1.6;}
</style>
<title>修 改 密 码</title>
</head>

<body background="photo/yellowblue.jpg">
<form name="form1" action="up.jsp" method="post">

<p align="center"><font color="#297405" size="5"><b>修改密码</b></font></p>
<table width="1080" height="244">

<tr><td width="595" height="55">
	<p align="right"><font color="#297405" size="3"><b>账号类型：
	<%if(ty.equals("stu"))
	{out.print("学生");}
	else
	{out.print("老师");}%>
	账号：
	<%=ad1%>
	</b></font></td>
</tr>

<tr><td width="595" height="55">
	<p align="right"><font color="#297405" size="3"><b>输入密码：</b></font><input name="pw" id="pw" type="password" size="23"></td>
</tr>
	
<tr><td width="595">
	<p align="right"><font color="#297405" size="3"><b>输入新密码：</b></font><input name="npw" id="npw" type="password" size="23"></td>
</tr>
	
	<tr><td width="595">
<p align="right">
<input type="submit" value="修改" class="btn02" style="font-weight: 700">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" onclick="clear()" value="清空" class="btn02" style="font-weight: 700" ></td></tr>
</table>
</form>

</body>


</html>
