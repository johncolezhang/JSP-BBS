<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
ArrayList l=(ArrayList)session.getAttribute("login");
String ad1=(String)l.get(0);
String ty=(String)l.get(1);
%>
<html>
<head>

<title>头</title>
<style type="text/css">
.dotline{BORDER-BOTTOM-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-TOP-STYLE: dotted}
img,a,table{display:inline;}
</style>
<script type="text/javascript">
function val(){
//var obj=
//document.getElementById("d1").innerHTML="欢迎"+obj;
}
</script>
</head>
<body topmargin="0" bottommargin="0" background="photo/yellowblue.jpg" onload="val()">
<p align="center"> 
<img border="0" src="photo\logo.png" width="405" height="120"><font face="华文中宋" size="3">&nbsp;&nbsp;&nbsp;&nbsp;
<a target="bodyiframe" style="text-decoration:none" href="body.html">首页</a>|
<a target="bodyiframe" style="text-decoration:none" href="uploadForm.jsp">课件上传</a>|
<a href="kejian.jsp" target="bodyiframe" style="text-decoration:none">课件下载</a>|
<a style="text-decoration: none" target="bodyiframe" href="datamanage.jsp">信息管理</a>|
<a style="text-decoration: none" target="bodyiframe" href="notice.jsp">课程通知</a>|
<a style="text-decoration: none" target="bodyiframe" href="data.html">课程资料</a>|
<a style="text-decoration: none" target="bodyiframe" href="publish.jsp">发布主题</a>|
<a href="bbs.jsp" style="text-decoration: none"target="bodyiframe">BBS</a>|
<table border="0" cellpadding="0" cellspacing="0">
<tr>
  <td>
    <table border="0" width="262">
    <tr>
    <td align="right">
    <font size="2" face="华文中宋">
    
	<a target="_top" style="text-decoration: none" href="quit.jsp">退出登录</a>|<a style="text-decoration: none" href="update.jsp" target="_blank">修改密码</a><br>欢迎
	<%
	if(ty.equals("stu"))
	{out.print("学生");}
	else
	{out.print("老师");}
	%>
	<%=ad1%>
    </td>
    </tr>
    <tr>
    <td width="256" height="85">
    <!--img border="0" src="photo\prizelogo.png" width="326" height="45"-->
    </td>
    </tr>
    </table>    
  </td>
</tr>
</table></font><hr class=dotline color=#008000 size=1></p>
</body>
</html>