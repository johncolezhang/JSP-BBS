<%@page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	int pagecount=1;
	int pagesize=5;
	int currentpage=1;
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=
	DriverManager.getConnection("jdbc:mysql://localhost:3306/zk2013150138?user=root&password=");
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
<title>论 坛 首 页</title> 
<script type="text/javascript">
function val(){
if (form1.keyword.value == ""){
	alert("查询条件不能为空");
	return false;
	} 
 } 
 </script>
 </head>
 
 <%
 int count10=0;
 String sql100="select *from topic";
 Statement stat1=conn.createStatement();
 ResultSet rs1=stat1.executeQuery(sql100);
 while(rs1.next()){count10++;}
 %>
 
 <body background="photo/yellowblue.jpg"> 
 <p align="center"><b><font size="6" color="#297405">java论坛bbs</font></b></p>
 <form method="post" action="bbs1.jsp" onsubmit="return val()" id="form1" name="form1">
 
	<center><b><font color="#297405">请您输入查询的主题：</font></b><input type="text" name="keyword" id="keyword" class="text2" />
  <input type="submit" class="btn02" value="查询" /> <center>
  </form>
  <table width="832"   border="1"  align="center">
  <tr height="50">
  	<td width="104">
	<p align="center"><b><font color="#297405">发帖人</font></b></td>
	<td width="104">
	<p align="center"><b><font color="#297405">类型</font></b></td>

  	<td width="358">
	<p align="center"><b><font color="#297405">主题</font></b></td>
  		<td width="88">
		<p align="center"><b><font color="#297405">回复量</font></b></td>
  	<td width="163">
	<p align="center"><b><font color="#297405">发布时间</font></b></td>
		<td width="43">
	<p align="center"><b><font color="#297405">删除</font></b></td>

 
  </tr>
<%
  String sql1="select tid,name,title,time,count,type from topic";
  PreparedStatement stat = conn.prepareStatement(sql1,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
  ResultSet rs=stat.executeQuery();
  rs.last(); 
  int size = rs.getRow();
  pagecount=(size%pagesize==0)?(size/pagesize):(size/pagesize+1);
  String tmp = request.getParameter("currentpage");
  if(tmp==null){tmp="1";}
  currentpage = Integer.parseInt(tmp);
  if(currentpage>=pagecount){currentpage=pagecount;}
  if(currentpage<=0){currentpage=1;}
  boolean flag = rs.absolute((currentpage-1)*pagesize+1);
  int cou=0;
  do
  {
  if(cou>=pagesize||count10==0){break;}
  int tid=rs.getInt(1);
  String name=rs.getString(2);
  String title=rs.getString(3);
  String time=rs.getString(4);
  int count=rs.getInt(5);
  String type=rs.getString(6);
  cou++;	
%>
	<tr height="30">
	<td><%out.print(name);%></td>
	<td>
	<%
	if(type.equals("stu")){out.print("学生");}
	else{out.print("老师");}
	%>
	</td>
	<td><a href="topic.jsp?id=<%=tid%>" style="text-decoration: none; font-weight: 700"><%out.print(title);%></td>
	<td><%out.print(count);%></td>
	<td><%out.print(time);%></td>
	<td>
	<a href="delete.jsp?id=<%=tid%>&ty=bb" style="text-decoration: none; font-weight: 700">删除</a>
	</td>
	</tr>
<%
	}
	while(rs.next());
	conn.close();
%>
 
</table>
	<b>
<a href = "bbs.jsp?currentpage=1" style="text-decoration: none" >首页</a>  
<a href = "bbs.jsp?currentpage=<% out.print(currentpage-1); %>" style="text-decoration: none" >上一页</a>  
<%
int c=1;
while(c<=pagecount)
{
%>
<a href = "bbs.jsp?currentpage=<% out.print(c); %>" style="text-decoration: none"><%out.print(c);%></a>
<%
c++;
}
%>
<a href = "bbs.jsp?currentpage=<% out.print(currentpage+1); %>" style="text-decoration: none" >下一页</a>  
<a href = "bbs.jsp?currentpage=<% out.print(pagecount); %>" style="text-decoration: none" >尾页</a>  
第<% out.print(currentpage); %>页/共<% if(pagecount==0){out.print("1");}else{out.print(pagecount);} %>页 
</b> 
<p align="center"><b>
<a style="text-decoration: none" target="bodyiframe" href="publish.jsp">发布新的主题</a></b></p> 
</body>
</html>