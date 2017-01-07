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
String tid=request.getParameter("tid");

if(type.equals("tea")&&ty.equals("re")){
String sql2="delete from reply where cid='"+id+"'";
stat.executeUpdate(sql2);
%>
<p align="center"><font color="#297405" size="5">
<%out.println("评论删除成功！");%>
<br>页面将在1秒后自动跳转…………</font></p></font></p>
</font></p>
<script type="text/javascript">
window.setTimeout("time2()","1000");
function time2(){window.location.href="topic.jsp?id=<%out.print(tid);%>";}
</script>
<%
}
else if(type.equals("tea")&&ty.equals("kj")){
String sql="delete from file where name='"+id+"'";
stat.executeUpdate(sql);
%>
<p align="center"><font color="#297405" size="5">
<%out.println("主题删除成功！");%>
<br>页面将在1秒后自动跳转…………</font></p></font></p>
</font></p>
<script type="text/javascript">
window.setTimeout("time2()","1000");
function time2(){window.location.href="kejian.jsp";}
</script>
<%
}
else if(ty.equals("re")&&!type.equals("tea"))
{
%>
<p align="center"><font color="#297405" size="5">
<%out.println("你不是老师，不能删除");%>
<br>页面将在1秒后自动跳转…………</font></p></font></p>
</font></p>
<script type="text/javascript">
window.setTimeout("time2()","1000");
function time2(){window.location.href="topic.jsp?id=<%out.print(tid);%>";}
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
function time2(){window.location.href="kejian.jsp";}
</script>
<%
}
%>
</body>
</html>
