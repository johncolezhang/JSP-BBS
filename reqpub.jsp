<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Math"%>
<%@ page import="java.util.Calendar"%> 
<%@ page import="java.util.GregorianCalendar"%>
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=
	DriverManager.getConnection("jdbc:mysql://localhost:3306/zk2013150138?user=root&password=");
	Statement stat=conn.createStatement();
%>
<html>

<head>

<title>接 收 主 题</title>
</head>

<body>
<%
int flag=0;
String tit=request.getParameter("title");
String con=request.getParameter("content");
ArrayList l=(ArrayList)session.getAttribute("login");
String name=(String)l.get(2);
String type=(String)l.get(1);
int t=0;
String sql1="select tid from topic";
ResultSet rs=stat.executeQuery(sql1);
while(rs.next()){
if(rs.getInt("tid")==t)
{
t++;
}
}

GregorianCalendar calendar=new GregorianCalendar();
int year=calendar.get(Calendar.YEAR);
int month=calendar.get(Calendar.MONTH) + 1;
int day=calendar.get(Calendar.DAY_OF_MONTH);
int hour=calendar.get(Calendar.HOUR_OF_DAY);
int minute=calendar.get(Calendar.MINUTE);
int second=calendar.get(Calendar.SECOND);
int count=0;
String time=year+"."+month+"."+day+"  "+hour+":"+minute+":"+second; 
String sql2="insert into topic(name,title,tid,content,time,count,type)values('"+name+"','"+tit+"','"+t+"','"+con+"','"+time+"','"+count+"','"+type+"')";
stat.executeUpdate(sql2);

%>
<p align="center"><font color="#297405" size="5">
<%out.println("主题发表成功！");%>
<br>页面将在1秒后自动跳转…………</font></p></font></p>
</font></p>
<script type="text/javascript">
window.setTimeout("time2()","1000");
function time2(){window.location.href="bbs.jsp";}
</script>
<%

stat.close();
conn.close();
%>
</body>

</html>
