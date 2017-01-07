<%@ page language="java" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title></title>
<script type="text/javascript">
function val(){
	if (form1.myFile.value == "")
		{alert("请选择文件！");return false;}
	return true;
} 
</script>
</head>
	<body background="photo/yellowblue.jpg">
		<p align="center"><b>文件上传
		</b></p>
		<hr>
		
		<form name="form1" id="form1" action="upload.jsp" method="post" 
			enctype="multipart/form-data" onsubmit="return val()">
			<p align="center">你选择一个文件进行上传：
			<input type="file" name="myFile" id="myFile">
			<input type="submit" value="上传">
		</p>
		</form>
		<p align="center">${msg}
	</p>
	</body>
</html>
