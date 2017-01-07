<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=
	DriverManager.getConnection("jdbc:mysql://localhost:3306/zk2013150138?user=root&password=");
	Statement stat=conn.createStatement();
	int pagecount=1;
	int pagesize=5;
	int currentpage=1;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主 题</title>
<style type="text/css">
	.btn02 { background:#fff;
	 height:24px; width:55px; color:#297405; border:2px solid #90be4a;
	  font-size:12px; font-weight:bold; line-height:180%; cursor:pointer;}
	 .text2 { border:2px solid #90be4a; width:200px; height:24px; font-size:16px;
	  font-weight:bold; line-height:1.6;}
	  .area { border:2px solid #90be4a;  overflow:auto; width:550px; height:169px;}
</style>

<script type="text/javascript"> 
function val(){
	if (form1.content.value == "")
		{alert("你还没写留言内容呐！");return false;}
	return true;
} 
</script>
</head>

<body  background="photo/yellowblue.jpg">
<%
String s=request.getParameter("id");
int tid=Integer.parseInt(s);
String sql1="select title from topic where tid='"+tid+"'";
ResultSet rs=stat.executeQuery(sql1);
while(rs.next())
{
	%>
	<p align="center"><b><font color="#297405" size="5">主题:<%out.print(rs.getString("title"));%></font></b>
	<%
}
%>

<table width="816"  height="137" border="1" class="text02" align="center">
  <tr>
  	<td width="104">
	<p align="center"><b><font color="#297405">楼主</font></b></td>
	<td width="104">
	<p align="center"><b><font color="#297405">类型</font></b></td>
  		<td width="330">
		<p align="center"><b><font color="#297405">回复</font></b></td>
  	<td width="149">
	<p align="center"><b><font color="#297405">发布时间</font></b></td>
  	  </tr>
	<%
	String sql2="select name,content,time,type from topic where tid='"+tid+"'";
	rs=stat.executeQuery(sql2);
	while(rs.next())
	{%>
	
	<tr>
	<td><%out.print(rs.getString("name"));%></td>
	<td>
	<%
	if(rs.getString("type").equals("stu")){out.print("学生");}
	else{out.print("老师");}
	%>
	</td>
	<td><b><%out.print(rs.getString("content"));%></b></td>
	<td><%out.print(rs.getString("time"));%></td>
	</tr>
<%	
	}
%>
</table>

<%
int count=0;
String sql5="select *from reply where tid='"+tid+"'";
rs=stat.executeQuery(sql5);
while(rs.next()){count++;}
%>

<br>
<%
	int ct=1;
	String sql3="select name,content,time,cid,type from reply where tid='"+tid+"'";
	PreparedStatement sta = conn.prepareStatement(sql3,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
	ResultSet rs1 = sta.executeQuery();
	rs1.last();
	int size = rs1.getRow();//得到结果个数
	pagecount=(size%pagesize==0)?(size/pagesize):(size/pagesize+1);//需要分几页
	String tmp = request.getParameter("currentpage");
	if(tmp==null){tmp="1";}
	currentpage = Integer.parseInt(tmp);
	if(currentpage>=pagecount){currentpage=pagecount;}
	if(currentpage<=0){currentpage=1;}
	boolean flag = rs1.absolute((currentpage-1)*pagesize+1);//指向第((currentpage-1)*pagesize+1)记录
	int cou=0;
	
	do
	{
	if(cou>=pagesize||count==0){break;}
	String name1=rs1.getString("name");
	String content1=rs1.getString("content");
	String time1=rs1.getString("time");
	int cid1=rs1.getInt("cid");
	String type1=rs1.getString("type");
	cou++;
%>
	<table width="816"  height="137" border="1" class="text02" align="center">
  <tr>
    <td width="65">
	<p align="center"><b><font color="#297405">楼层</font></b></td>
  	<td width="139">
	<p align="center"><b><font color="#297405">层主</font></b></td>
	<td width="104">
	<p align="center"><b><font color="#297405">类型</font></b></td>
  		<td width="286">
		<p align="center"><b><font color="#297405">回复</font></b></td>
  	<td width="134">
	<p align="center"><b><font color="#297405">发布时间</font></b></td>
	<td width="84">
	<p align="center"><b><font color="#297405">删除</font></b></td>
  	  </tr>
	<tr>
	<td><%out.print(ct+(currentpage-1)*pagesize);out.print("楼");ct++;%></td>
	<td><%out.print(name1);%></td>
	<td>
	<%
	if(type1.equals("stu")){out.print("学生");}
	else{out.print("老师");}
	%>
	</td>
	<td><b><%out.print(content1);%></b></td>
	<td><%out.print(time1);%></td>
	<td>
	<p align="center">
	<a href="delete1.jsp?id=<%out.print(cid1);%>&ty=re&tid=<%out.print(tid);%>" style="text-decoration: none; font-weight:700">删除</a></td>
	</tr>
	</table>
<p align="center">
<%
}
while(rs1.next());
%>
<b>
<a href = "topic.jsp?currentpage=1&id=<%out.print(tid);%>" style="text-decoration: none" >首页</a>  
<a href = "topic.jsp?currentpage=<% out.print(currentpage-1); %>&id=<%out.print(tid);%>" style="text-decoration: none" >上一页</a>  
<%
int c0=1;
while(c0<=pagecount)
{
%>
<a href = "topic.jsp?currentpage=<% out.print(c0); %>&id=<%out.print(tid);%>" style="text-decoration: none"><%out.print(c0);%></a>
<%
c0++;
}
%>
<a href = "topic.jsp?currentpage=<% out.print(currentpage+1); %>&id=<%out.print(tid);%>" style="text-decoration: none" >下一页</a>  
<a href = "topic.jsp?currentpage=<% out.print(pagecount); %>&id=<%out.print(tid);%>" style="text-decoration: none" >尾页</a>  
第<% out.print(currentpage); %>页/共<% if(pagecount==0){out.print("1");}else{out.print(pagecount);} %>页 
	
	
	</b> 
	
	
	<br>
	
	<%
	
	String sql4="update topic set count='"+count+"'where tid='"+tid+"'";
	stat.executeUpdate(sql4);
	stat.close();
	conn.close();
%>


</p>


<form action="reply.jsp" id="form1" name="form1" method="post" onsubmit="return val()">
<p align="center">
<textarea id="content" name="content" rows="3" cols="36" class="area"></textarea><br>
<input type="hidden" id="tid" name="tid" value=<%out.print(tid);%>></input>
<input type="submit" value="评论" class="btn02">
</p>
</form> 
<p align="center"><b> 
<a href="bbs.jsp" style="text-decoration: none">回到bbs</a>
</b></p>
</body>

</html>