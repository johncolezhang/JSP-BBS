<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=
	DriverManager.getConnection("jdbc:mysql://localhost:3306/zk2013150138?user=root&password=");
	Statement stat=conn.createStatement();
%>

<html>
<head>
<style type="text/css">
	.btn02 { background:#fff;
	 height:24px; width:55px; color:#297405; border:2px solid #90be4a;
	  font-size:12px; font-weight:bold; line-height:180%; cursor:pointer;}
	 .text2 { border:2px solid #90be4a; width:200px; height:24px; font-size:16px;
	  font-weight:bold; line-height:1.6;}
</style>
<title>注 册</title>
<script type="text/javascript">

function val(){
	acco=document.form1.ac.value;
	pass=document.form1.pw.value;
	addr=document.form1.ad.value;
	name=document.form1.na.value;

	{if(acco==""){
		document.form1.ac.focus();
		document.getElementById("d1").innerHTML="请输入账号";
		return false;
		}
	else if(acco!=""&&pass==""){
		document.form1.pw.focus();
		document.getElementById("d2").innerHTML="请输入密码";
		document.getElementById("d1").innerHTML="";
		return false;
		}
	else if(acco!=""&&pass!=""&&addr==""){
		document.form1.ad.focus();
		document.getElementById("d3").innerHTML="请输入邮箱";
		document.getElementById("d2").innerHTML="";
		document.getElementById("d1").innerHTML="";
		return false;
		}
	if(addr!=""&&(!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(addr))){
	 	document.getElementById("d3").innerHTML="请填写您正确的Email邮箱!";
	 	document.form1.ad.focus();
	 	return false;
	 	}
	else if(acco!=""&&pass!=""&&addr!=""&&name==""){
		document.form1.na.focus();
		document.getElementById("d4").innerHTML="请输入姓名";
		document.getElementById("d3").innerHTML="";
		document.getElementById("d2").innerHTML="";
		document.getElementById("d1").innerHTML="";
		return false;
		}


		
	else if(addr!=""&&name!=""&&pass!=""&&acco!=""){
		document.getElementById("d1").innerHTML="账号："+acco+"  姓名："+name+"  邮箱："+addr +" 欢迎注册！";
		document.getElementById("d2").innerHTML="";
		document.getElementById("d3").innerHTML="";
		document.getElementById("d4").innerHTML="";

		}}
	}
	
</script>
</head>
<body background="photo/yellowblue.jpg">
<form name="form1" action="zhuce.jsp" onsubmit="return val()" method="post">
<p>　</p>
<p align="center"><font color="#297405" size="5"><b>欢迎注册！</b></font></p>
<table width="1080" height="244">

<tr><td width="595" height="55">
	<p align="right"><font color="#297405" size="3"><b>输入账号：</b></font><input name="ac" id="ac" type="text" size="23"></td>
<td height="55"><div id="d1">
	<p align="center"></div></td></tr>
	
<tr><td width="595">
	<p align="right"><font color="#297405" size="3"><b>输入邮箱：</b></font><input name="ad" id="ad" type="text" size="23"></td>
<td><div id="d3">
	<p align="center"></div></td></tr>
	
	<tr><td width="595">
	<p align="right"><font color="#297405" size="3"><b>输入姓名：</b></font><input name="na" id="na" type="text" size="23"></td>
<td><div id="d4">
	<p align="center"></div></td></tr>
	
<tr><td width="595">
	<p align="right"><font color="#297405" size="3"><b>输入密码：</b></font><input name="pw" id="pw" type="password" size="24"></td>
<td><div id="d2">
	<p align="center"></div></td></tr>

<tr><td>
	<p align="right"><b><font color="#297405">选择账号类型：
	<input type="radio" name="atype" id="atype" value="stu" checked>学生
	<input type="radio" name="atype" id="atype" value="tea">老师</font></b>
</td></tr>



<tr><td width="595">
<p align="right">
<input type="submit" value="注册" class="btn02" style="font-weight: 700">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" onclick="clear()" value="清空" class="btn02" style="font-weight: 700" ></td></tr>
</table>
</form>

</body>

</html>