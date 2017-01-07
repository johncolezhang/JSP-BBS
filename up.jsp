<%@page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=
	DriverManager.getConnection("jdbc:mysql://localhost:3306/zk2013150138?user=root&password=");
	Statement stat=conn.createStatement();
%>
<html>
<head>
<title>修 改 密 码</title>
</head>

<body>
<%
	int flag=0;
	String pw=request.getParameter("pw");
	String npw=request.getParameter("npw");
	ArrayList l=(ArrayList)session.getAttribute("login");
	String ad1=(String)l.get(0);
	String ty=(String)l.get(1);
	String sql;
	if(ty.equals("stu"))
	{sql="select password from user where address='"+ad1+"'";}
	else
	{sql="select password from teacher where address='"+ad1+"'";}
	ResultSet rs=stat.executeQuery(sql);
	while(rs.next()){
	String p=rs.getString("password");
	if(p.equals(pw)){flag=1;}
	}
	if(flag==0)
		{%>
<p align="center"><font color="#297405" size="5">
	<%out.println("原密码输入错误");%>
<br>页面将在3秒后自动跳转…………</font></p></font></p>
<script type="text/javascript">
window.setTimeout("time1()","5000");
function time1(){window.location.href="update.jsp";}
</script>
	<%}
	else{
	String sql1;
	if(ty.equals("stu"))
	{sql1="update user set password='"+npw+"' where address='"+ad1+"'";}
	else
	{sql1="update teacher set password='"+npw+"' where address='"+ad1+"'";}
	stat.executeUpdate(sql1);
	%>
<p align="center"><font color="#297405" size="5">
	<%out.println("修改秘密成功!!");%>
<br>页面将在3秒后自动跳转…………</font></p></font></p>
<script type="text/javascript">
window.setTimeout("time1()","3000");
function time1(){window.location.href="home.jsp";}
</script>
	<%
	}
	stat.close();
	conn.close();
%>
</body>

</html>
