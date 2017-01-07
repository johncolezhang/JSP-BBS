<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>
<head>
<title>建 表</title></head>

<body>
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=
	DriverManager.getConnection("jdbc:mysql://localhost:3306/zk2013150138?user=root&password=");
	Statement stat=conn.createStatement();

	String str="insert into reply values(0,'才旺',4,'不服来战','2015.6.9 0:0:0','stu');";
	stat.executeUpdate(str);
	str="insert into reply values(0,'张可',5,'来就来！','2015.6.9 0:0:0','stu');";
	stat.executeUpdate(str);
	str="insert into reply values(0,'才旺',6,'不给就送','2015.6.9 0:0:0','stu');";
	stat.executeUpdate(str);
	str="insert into reply values(0,'张可',7,'不，叔叔我不送！','2015.6.9 0:0:0','stu');";
	stat.executeUpdate(str);
	str="insert into reply values(0,'才旺',8,'来跟我打拳皇','2015.6.9 0:0:0','stu');";
	stat.executeUpdate(str);
	str="insert into reply values(0,'才旺',9,'快！','2015.6.9 0:0:0','stu');";
	stat.executeUpdate(str);
	str="insert into reply values(0,'张可',10,'不了，我要学！习！','2015.6.9 0:0:0','stu');";
	stat.executeUpdate(str);
	str="insert into topic values('王平','大家要讨论学习啊','不然就挂你们！',4,'2015.6.9 0:0:0',0,'tea')";
	stat.executeUpdate(str);
	str="insert into topic values('张可','大家觉得这个bbs怎么样？','来评论吧！',5,'2015.6.9 0:0:0',4,'stu')";
	stat.executeUpdate(str);
	str="insert into reply values(5,'才旺',11,'一般般','2015.6.9 0:0:0','stu');";
	stat.executeUpdate(str);
	str="insert into reply values(5,'王平',12,'太丑','2015.6.9 0:0:0','tea');";
	stat.executeUpdate(str);
	str="insert into reply values(5,'张可',13,'但功能都实现了啊！','2015.6.9 0:0:0','stu');";
	stat.executeUpdate(str);
	str="insert into reply values(5,'才旺',14,'哈哈','2015.6.9 0:0:0','stu');";
	stat.executeUpdate(str);

	%>
	<p align="center"><font color="#297405" size="5">
	<%out.println("表格创建成功，跳转到登录主页");%>
<br>页面将在1秒后自动跳转…………</font></p></font></p>
<script type="text/javascript">
window.setTimeout("time1()","1000");
function time1(){window.location.href="index.jsp";}
</script>
<%
	stat.close();
	conn.close();
%>

</body>

</html>
