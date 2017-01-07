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

<title>删 除</title>
</head>
<body>
<%
ArrayList l=(ArrayList)session.getAttribute("login");
String type=(String)l.get(1);
String id=request.getParameter("id");
String ty=request.getParameter("ty");
if(type.equals("tea")&&ty.equals("bb")){
String sql1="delete from topic where tid='"+id+"'";
String sql2="delete from reply where tid='"+id+"'";
stat.executeUpdate(sql1);
stat.executeUpdate(sql2);
%>
<p align="center"><font color="#297405" size="5">
<%out.println("主题删除成功！");%>
<br>页面将在1秒后自动跳转…………</font></p></font></p>
</font></p>
<script type="text/javascript">
window.setTimeout("time2()","1000");
function time2(){window.location.href="bbs.jsp";}
</script>
<%
}
else if(type.equals("tea")&&ty.equals("no")){
String sql="delete from notice where nid='"+id+"'";
stat.executeUpdate(sql);
%>
<p align="center"><font color="#297405" size="5">
<%out.println("主题删除成功！");%>
<br>页面将在1秒后自动跳转…………</font></p></font></p>
</font></p>
<script type="text/javascript">
window.setTimeout("time2()","1000");
function time2(){window.location.href="notice.jsp";}
</script>
<%
}
else if(ty.equals("no")&&!type.equals("tea"))
{
%>
<p align="center"><font color="#297405" size="5">
<%out.println("你不是老师，不能删除");%>
<br>页面将在1秒后自动跳转…………</font></p></font></p>
</font></p>
<script type="text/javascript">
window.setTimeout("time2()","1000");
function time2(){window.location.href="notice.jsp";}
</script>
<%
}
else
{
%>
<p align="center"><font color="#297405" size="5">
<%out.println("你不是老师，不能删除");%>
<br>页面将在1秒后自动跳转…………</font></p></font></p>
</font></p>
<script type="text/javascript">
window.setTimeout("time2()","1000");
function time2(){window.location.href="bbs.jsp";}
</script>
<%
}
%>
</body>
</html>
