<%@ page language="java" import="java.util.*" import="com.jspsmart.upload.*" import="javax.servlet.*" pageEncoding="UTF-8"%>
<html>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("gb2312");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=
	DriverManager.getConnection("jdbc:mysql://localhost:3306/zk2013150138?user=root&password=");
	Statement stat=conn.createStatement();
%>
<head>
<titile>上 传</title>
</head>
<body>
<%
		int flag=0;
		String desc=null;		
		
		SmartUpload smartUpload = new SmartUpload();//初始化	
		ServletConfig config1 = this.getServletConfig();
		smartUpload.initialize(config1, request, response); 	
		try {
			//上传文件
			smartUpload.upload(); 
			//得到上传的文件对象
			File smartFile = smartUpload.getFiles().getFile(0);
			//保存文件
			
			//smartFile.saveAs("D:/" + smartFile.getFileName(),smartUpload.SAVE_PHYSICAL);// 保存文件
			smartFile.saveAs("/cw/" + smartFile.getFileName(),smartUpload.SAVE_VIRTUAL);// 保存文件
			String name=smartFile.getFileName();
			String sql="insert into file values('"+name+"')";
			stat.executeUpdate(sql);
	
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}

		String msg = "Upload Success!";
		request.setAttribute("msg", msg);
		
		RequestDispatcher rd = request.getRequestDispatcher("/uploadForm.jsp");
		rd.forward(request, response);
%>
</body>
<html>