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
	String sql1="create table user(id varchar(20) not null,"+
								   "name varchar(20) not null,"+
								   "address varchar(20) not null primary key,"+
								   "password varchar(20) not null)";
	stat.executeUpdate(sql1);
	String sql2="insert into user values('001','张可','1148697133@qq.com','javajava')";
	stat.executeUpdate(sql2);
	String sql20="insert into user values('002','才旺','123456@qq.com','123456')";
	stat.executeUpdate(sql20);
	String sql3="create table teacher(id varchar(20) not null,"+
									  "name varchar(20) not null,"+
									  "address varchar(20) not null primary key,"+
									  "password varchar(20) not null)";
	stat.executeUpdate(sql3);
	String sql4="insert into teacher values('001','王平','java@java.java','javajava')";
	stat.executeUpdate(sql4);
	String sql40="insert into teacher values('002','贾森','111111@qq.com','111111')";
	stat.executeUpdate(sql40);
	String sql5="create table topic(name varchar(20) not null,"+
									"title varchar(50) not null,"+
									"content text not null,"+
									"tid int not null primary key,"+
									"time varchar(20) not null,"+
									"count int not null,"+
									"type varchar(10) not null)";
	stat.executeUpdate(sql5);
	String top1="insert into topic values('张可','大家好，啊啊啊','快来回帖刷经验！！！',0,'2015.6.9 0:0:0',8,'stu')";
	stat.executeUpdate(top1);
	String top2="insert into topic values('王平','卖萌！','不许刷经验！！',1,'2015.6.9 0:0:0',1,'tea')";
	stat.executeUpdate(top2);
	String top3="insert into topic values('贾森','不错~','来和我聊天吧！！',2,'2015.6.9 0:0:0',1,'tea')";
	stat.executeUpdate(top3);
	String top4="insert into topic values('才旺','大家好，我是张可的舍友','满一百楼就爆照！',3,'2015.6.9 0:0:0',5,'stu')";
	stat.executeUpdate(top4);

	String sql6="create table reply(tid int not null,"+
									"name varchar(20) not null,"+
									"cid int not null primary key,"+
									"content text not null,"+
									"time varchar(20) not null,"+
									"type varchar(10) not null)";
	stat.executeUpdate(sql6);
	String rep1="insert into reply values(0,'张可',0,'哈哈','2015.6.9 0:0:0','stu')";
	stat.executeUpdate(rep1);
	String rep2="insert into reply values(1,'王平',1,'哈哈','2015.6.9 0:0:0','tea')";
	String rep4="insert into reply values(2,'贾森',2,'哈哈','2015.6.9 0:0:0','tea')";
	stat.executeUpdate(rep4);
	stat.executeUpdate(rep2);
	String rep3="insert into reply values(3,'才旺',3,'哈哈','2015.6.9 0:0:0','stu')";
	stat.executeUpdate(rep3);
	String sql7="create table notice(nid int not null,"+
									"name varchar(20) not null,"+
									"content varchar(100) not null,"+
									"time varchar(20) not null)";
	stat.executeUpdate(sql7);
	String not1="insert into notice values(0,'王平','考试被取消了！','2015.6.9 0:0:0')";	
	String not2="insert into notice values(1,'贾森','下节课透题啊！','2015.6.9 0:0:0')";
	String not3="insert into notice values(2,'王平','下节课要点名，记得互相通知啊！','2015.6.9 0:0:0')";
	stat.executeUpdate(not1);
	stat.executeUpdate(not2);
	stat.executeUpdate(not3);
	String sql50="create table file(name varchar(100) not null)";
	stat.executeUpdate(sql50);
	String sql51="insert into file values('ElementaryJs.ppt')";
	String sql52="insert into file values('JspAccessDatabase.ppt')";
	stat.executeUpdate(sql51);
	stat.executeUpdate(sql52);
	
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
	str="insert into reply values(3,'张可',15,'爆照？','2015.6.9 0:0:0','stu');";
	stat.executeUpdate(str);
	str="insert into reply values(3,'才旺',16,'好好，大家快来刷楼','2015.6.9 0:0:0','stu');";
	stat.executeUpdate(str);
	str="insert into reply values(3,'才旺',17,'说到做到','2015.6.9 0:0:0','stu');";
	stat.executeUpdate(str);
	str="insert into reply values(3,'王平',18,'同学们不要讨论与学习无关的啊！','2015.6.9 0:0:0','tea');";
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
