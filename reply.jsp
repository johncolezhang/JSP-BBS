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

<title>接 收 评 论</title>
</head>
<body>
<%
String con=request.getParameter("content");
String t=request.getParameter("tid");
int tid=Integer.parseInt(t);
ArrayList l=(ArrayList)session.getAttribute("login");
String name=(String)l.get(2);
String type=(String)l.get(1);
int c=0;
String sql1="select cid from reply";
ResultSet rs=stat.executeQuery(sql1);
while(rs.next()){
if(rs.getInt("cid")==c)
{
c++;
}
}
GregorianCalendar calendar=new GregorianCalendar();
int year=calendar.get(Calendar.YEAR);
int month=calendar.get(Calendar.MONTH) + 1;
int day=calendar.get(Calendar.DAY_OF_MONTH);
int hour=calendar.get(Calendar.HOUR_OF_DAY);
int minute=calendar.get(Calendar.MINUTE);
int second=calendar.get(Calendar.SECOND);
String time=year+"."+month+"."+day+"  "+hour+":"+minute+":"+second; 

String sql="insert into reply(name,cid,tid,content,time,type)values(?,?,?,?,?,?)";
PreparedStatement ps=conn.prepareStatement(sql);
ps.setString(1,name);
ps.setInt(2,c);
ps.setInt(3,tid);
ps.setString(4,con);
ps.setString(5,time);
ps.setString(6,type);
ps.executeUpdate();
ps.close();
stat.close();
conn.close();
%>
<p align="center"><font color="#297405" size="5">
<%out.println("评论成功！");%>
<br>页面将在0秒后自动跳转…………</font></p></font></p>
</font></p>
<script type="text/javascript">
window.setTimeout("time2()","000");
function time2(){window.location.href="topic.jsp?id=<%out.print(tid);%>";}
</script>
</body>

</html>
