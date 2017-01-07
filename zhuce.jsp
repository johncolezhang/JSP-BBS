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
<title>注 册</title>
</head>

<body background="photo/yellowblue.jpg">
<%
	int flag=0;
	String ac1=request.getParameter("ac");
	String pw1=request.getParameter("pw");
	String na1=request.getParameter("na");
	String ad1=request.getParameter("ad");
	String ty=request.getParameter("atype");
	String s;
	if(ty.equals("stu"))
	{s="select address from user where address='"+ad1+"'";}
	else
	{s="select address from teacher where address='"+ad1+"'";}
	ResultSet rs=stat.executeQuery(s);
	while(rs.next()){
		String a=rs.getString("address");
		if(a.equals(ad1)){flag=1;break;}
	}//检测是否邮箱重复
	if(ty.equals("stu"))
	{s="select id from user where id='"+ac1+"'";}
	else
	{s="select id from teacher where id='"+ac1+"'";}
	ResultSet rs1=stat.executeQuery(s);
	while(rs1.next()){
		String a1=rs1.getString("id");
		if(a1.equals(ac1)){flag=1;break;}
	}//检测是否账号重复
	if(flag==1)
	{%>
<p align="center"><font color="#297405" size="5">
	<%out.println("该账号已被注册，请重新注册");%>
<br>页面将在3秒后自动跳转…………</font></p></font></p>
<script type="text/javascript">
window.setTimeout("time1()","3000");
function time1(){window.location.href="register.jsp";}
</script>
	<%}
	else{
		if(ty.equals("stu")){
		String sql="insert into user(id,name,address,password)values(?,?,?,?)";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,ac1);
		ps.setString(2,na1);
		ps.setString(3,ad1);
		ps.setString(4,pw1);
		ps.executeUpdate();
		ps.close();
	%>
		<p align="center"><font color="#297405" size="5">
		<%out.println("类型学生，账号"+ac1+"，邮箱"+ad1+"，欢迎注册！");%>
		<br>页面将在3秒后自动跳转…………</font></p></font></p>
		</font></p>
		<script type="text/javascript">
		window.setTimeout("time2()","3000");
		function time2(){window.location.href="index.jsp";}
		</script>
	<%
		}
		else
		{
		String sql1="insert into teacher(id,name,address,password)values(?,?,?,?)";
		PreparedStatement ps1=conn.prepareStatement(sql1);
		ps1.setString(1,ac1);
		ps1.setString(2,na1);
		ps1.setString(3,ad1);
		ps1.setString(4,pw1);
		ps1.executeUpdate();
		ps1.close();
	%>
		<p align="center"><font color="#297405" size="5">
		<%out.println("类型老师，账号"+ac1+"，邮箱"+ad1+"，欢迎注册！");%>
		<br>页面将在3秒后自动跳转…………</font></p></font></p>
		</font></p>
		<script type="text/javascript">
		window.setTimeout("time3()","3000");
		function time3(){window.location.href="index.jsp";}
		</script>
	<%
		}
	}
	conn.close();
%>
</body>

</html>
