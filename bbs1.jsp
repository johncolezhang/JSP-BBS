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
<style type="text/css">
	.btn02 { background:#fff;
	 height:24px; width:55px; color:#297405; border:2px solid #90be4a;
	  font-size:12px; font-weight:bold; line-height:180%; cursor:pointer;}
	 .text2 { border:2px solid #90be4a; width:200px; height:24px; font-size:16px;
	  font-weight:bold; line-height:1.6;}
	  .area { border:2px solid #90be4a;  overflow:auto; width:550px; height:169px;}
</style>
<head>

<title>论 坛 查 询</title> 
<script type="text/javascript">
function val(){
if (form1.keyword.value == ""){
	alert("查询条件不能为空");
	return false;
	} 
 } 
 </script>
 </head>
 <body background="photo/yellowblue.jpg"> 
 <p align="center"><b><font size="6" color="#297405">java论坛bbs</font></b></p>
 <form method="post" onsubmit="return val()" id="form1" name="form1">
 
	<center><b><font color="#297405">请您输入查询的主题：</font></b><input type="text" name="keyword" id="keyword" class="text2" />
  <input type="submit" class="btn02" value="查询" /> <center>
  </form>
  <table width="811"  height="137" border="1" class="text02" align="center">
  <tr>
  	<td width="104">
	<p align="center"><b><font color="#297405">发帖人</font></b></td>
	<td width="104">
	<p align="center"><b><font color="#297405">类型</font></b></td>

  	<td width="358">
	<p align="center"><b><font color="#297405">主题</font></b></td>
  		<td width="88">
		<p align="center"><b><font color="#297405">回复量</font></b></td>
  	<td width="115">
	<p align="center"><b><font color="#297405">发布时间</font></b></td>

  </tr>
  
  <%
  String keyword=request.getParameter("keyword");
  String a,b,c,g;
  int d,e;
  String sql1="select tid,name,title,time,count,type from topic where title='"+keyword+"'";
ResultSet rs=stat.executeQuery(sql1);
	while(rs.next()){
		a=rs.getString("name");
		b=rs.getString("title");
		c=rs.getString("time");
		g=rs.getString("type");
		d=rs.getInt("tid");
		e=rs.getInt("count");
		
%>
	<tr>
	<td><%out.print(a);%></td>
	<td>
	<%
	if(g.equals("stu")){out.print("学生");}
	else{out.print("老师");}
	%>
	</td>
	<td><a href="topic.jsp?id=<%=d%>" style="text-decoration: none; font-weight: 700"><%out.print(b);%></td>
	<td><%out.print(e);%></td>
	<td><%out.print(c);%></td>
	</tr>
<%
	}
%>
 
</table>
<tr>
<p align="center"><b>
<a style="text-decoration: none" target="bodyiframe" href="publish.jsp">发布新的主题</a></b></p>
</tr> 
<tr>
<p align="center"><b>
<a style="text-decoration: none" target="bodyiframe" href="bbs.jsp">返回bbs</a></b></p>
</tr>
</body>
</html>
