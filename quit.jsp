<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>
<head>

<title>退 出 登 录</title></head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	session.removeAttribute("login");
%>
<p align="center"><font color="#297405" size="5">
	<%out.println("成功退出！");%>
<br>页面将在1秒后自动跳转…………</font></p></font></p>
<script type="text/javascript">
window.setTimeout("time1()","1000");
function time1(){window.location.href="index.jsp";}
</script>
</body>
</html>
