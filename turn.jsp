<%@page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=
	DriverManager.getConnection("jdbc:mysql://localhost:3306/zk2013150138?user=root&password=");
	Statement stat=conn.createStatement();
%>
<html>
<head>
<title>登 录 跳 转</title>
</head>
<body background="photo/yellowblue.jpg>
<%
	request.setCharacterEncoding("UTF-8");
	int flag=0;
	String ad1=request.getParameter("ac");
	String pw1=request.getParameter("pw");
	String type=request.getParameter("atype");
	String s;
	if(type.equals("stu"))
	{s="select name,address,password from user where address='"+ad1+"'";}//从学生中查询
	else
	{s="select name,address,password from teacher where address='"+ad1+"'";}//从老师中查询
	ResultSet rs=stat.executeQuery(s);
	String a,b,d=null;
	String c=null;
	while(rs.next()){
		a=rs.getString("address");
		b=rs.getString("password");
		d=rs.getString("name");
		if(a.equals(ad1) && b.equals(pw1)){flag=1;c=rs.getString("name");}
		
	}
	if(flag==1){
	response.sendRedirect("home.jsp");
	ArrayList l=new ArrayList();
	l.add(ad1);
	l.add(type);
	l.add(c);
	l.add(d);
	session.setAttribute("login",l);
	}
	else{		
%>
<p align="center"><font color="#297405" size="5">
<%out.println("密码或账号错误！！！");%>
<br>页面将在1秒后自动跳转…………</font></p></font></p>
</font></p>
<script type="text/javascript">
window.setTimeout("time2()","1000");
function time2(){window.location.href="index.jsp";}
</script>

<%
	}
%>

</p>
</body>
</html>