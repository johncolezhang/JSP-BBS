<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>

<html>
<head>
<title>下 载</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String filename=request.getParameter("file");
response.setHeader("Content-Disposition","attachment;filename="+filename);
//response.setContentType("application/vnd.ms-powerpoint");
RequestDispatcher rd=request.getRequestDispatcher("cw/"+filename);
rd.forward(request,response);
%>
</body>

</html>
