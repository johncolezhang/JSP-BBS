<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>  
    <head>  
        <title>hello</title>  
    </head>  
    <body> 
    <table border="1" spacing="2">
<%
	request.setCharacterEncoding("UTF-8");
	int pagecount=1;
	int pagesize=5;
	int currentpage=1;

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=
	DriverManager.getConnection("jdbc:mysql://localhost:3306/zk2013150138?user=root&password=");
	//Statement stat=conn.createStatement();
%>
<%

String sql = "select tid,name,title,time,count,type from topic";
PreparedStatement stat = conn.prepareStatement(sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
ResultSet rs = stat.executeQuery();
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
if(cou>=pagesize){break;}
int tid=rs.getInt(1);
String name=rs.getString(2);
String title=rs.getString(3);
String time=rs.getString(4);
int count=rs.getInt(5);
String type=rs.getString(6);
cou++;
%>
<tr>
<td><%=tid%></td>  
<td><%=name%></td>  
<td><%=title%></td>  
<td><%=time%></td>  
<td><%=count%></td>  
<td><%=type%></td>  
</tr>
<%
}
while(rs.next());
conn.close();

%>
</table>
<a href = "b.jsp?currentpage=1" >首页</a>  
<a href = "b.jsp?currentpage=<% out.print(currentpage-1); %>" >上一页</a>  
<%
int c=1;
while(c<=pagecount)
{
%>
<a href = "b.jsp?currentpage=<% out.print(c); %>"><%out.print(c);%></a>
<%
c++;
}
%>
<a href = "b.jsp?currentpage=<% out.print(currentpage+1); %>" >下一页</a>  
<a href = "b.jsp?currentpage=<% out.print(pagecount); %>" >尾页</a>  
第<% out.print(currentpage); %>页/共<% out.print(pagecount); %>页 
</body>
</html> 