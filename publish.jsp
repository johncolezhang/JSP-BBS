<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%	request.setCharacterEncoding("UTF-8");%>
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
<p align="center"><b><font size="6" color="#297405">发布主题</font></b></p>  
<form action="reqpub.jsp" id="form1" name="form1" method="post" onsubmit="return val()"> 
	<table width="551" height="162" border="1" class="text2" align="center">  
  		<tr> 
		<td width="76"><font color="#297405">标题：</font></td>     
 		<td width="358"><input name="title" type="text" id="title" class="text2" size="40" maxlength="40" /></td>    
		</tr>

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
