<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
<title>发 布 主 题</title>

<script type="text/javascript"> 
function val(){
	if (form1.title.value == "")
		{alert("请填写主题标题");return false;}
	if (form1.content.value == "")
		{alert("你还没写留言内容呐！");return false;}
	return true;
} 
</script>
</head>

<body background="photo/yellowblue.jpg"> 
<p align="center"><b><font size="6" color="#297405">课程通知</font></b></p>  
<table width="732"  height="137" border="1" class="text02" align="center">
  <tr>
  	<td width="104">
	<p align="center"><b><font color="#297405">发布老师</font></b></td>
  	<td width="358">
	<p align="center"><b><font color="#297405">通知</font></b></td>
  		<td width="88">
	<p align="center"><b><font color="#297405">发布时间</font></b></td>
		<td width="43">
	<p align="center"><b><font color="#297405">删除</font></b></td>

 
  </tr>
<%
  String a,b,c;
  int d;
  String sql1="select nid,name,content,time from notice";
ResultSet rs=stat.executeQuery(sql1);
	while(rs.next()){
		a=rs.getString("name");
		c=rs.getString("time");
		b=rs.getString("content");
		d=rs.getInt("nid");
%>
	<tr>
	<td><%out.print(a);%></td>
	<td><b><%out.print(b);%></b></td>
	<td><%out.print(c);%></td>
	<td><a href="delete.jsp?id=<%=d%>&ty=no" style="text-decoration: none; font-weight: 700">删除</a>
</td>
	</tr>
<%
	}
%>
 
</table>


<form action="reqnot.jsp" id="form1" name="form1" method="post" onsubmit="return val()"> 
	<table width="551" height="162" border="1" class="text2" align="center">  

		<tr>
		<td><font color="#297405">内容：</font></td>
		<td><textarea name="content" class="area" cols="44"rows="10" id="content"></textarea></td> 
		</tr>
		<tr>
		<td><input type="submit" class="btn02" name="submit" id="submit" value="提交" /></td>
		<td><input type="reset" name="reset" class="btn02" id="reset" value="重置" /></td>
		</tr>
	</table>
	<center>
		<div>
			<a style="text-decoration: none" target="bodyiframe" href="bbs.jsp">
			返回bbs</a></div>
	</center>
</form>
</body>
</html>