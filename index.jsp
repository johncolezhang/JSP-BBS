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
<style type="text/css">
	.btn02 { background:#fff;
	 height:24px; width:55px; color:#297405; border:2px solid #90be4a;
	  font-size:12px; font-weight:bold; line-height:180%; cursor:pointer;}
	 .text2 { border:2px solid #90be4a; width:200px; height:24px; font-size:16px;
	  font-weight:bold; line-height:1.6;}
</style>
<head>

<title>登 录</title>
<script type="text/javascript">
function val(){
	acco=document.form1.ac.value;
	pass=document.form1.pw.value;
	veri=document.form1.verify.value;
	if(acco==""){
		document.form1.ac.focus();
		document.getElementById("d1").innerHTML="请输入账号！";
		document.getElementById("d2").innerHTML="";
		document.getElementById("d3").innerHTML="";		
		return false;
	}
	if(acco!=""&&(!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(acco))){
	 	document.getElementById("d1").innerHTML="请填写您正确的Email邮箱!";
	 	document.form1.ac.focus();
	 	return false;
	 }
	else if(acco!=""&&pass==""){
		document.form1.pw.focus();
		document.getElementById("d2").innerHTML="请输入密码！";
		document.getElementById("d1").innerHTML="";
		return false;
	}
	else if(acco!=""&&pass!=""){
		var inputCode = document.getElementById("verify").value.toUpperCase();//转化大写
		if(inputCode.length <=0) {
  			document.getElementById("d2").innerHTML="";
  			document.getElementById("d3").innerHTML="请输入验证码！";
  			document.form1.verify.focus();
  			return false;
		}
		else if(inputCode != code ){
			document.getElementById("d3").innerHTML="验证码输入错误！";
  			document.form1.verify.focus();
			createCode();
			return false;
		}		
		else {
			/*if(acco!="java@szu.edu.cn"&&pass!="java1234"){
				document.getElementById("d1").innerHTML="账号错误！";
				document.getElementById("d2").innerHTML="密码错误！";
				createCode();
				document.form1.ac.value="";
				document.form1.pw.value="";
				document.form1.verify.value="";
				return false;
			}*/
			/*else{*/
			document.getElementById("d1").innerHTML=acco+"欢迎登录！";
			document.getElementById("d2").innerHTML="";
			document.getElementById("d3").innerHTML="";
				/*}*/
		}
	
	}
}
var code ; //在全局 定义验证码
function createCode(){ 
	code = new Array();
	var codelength = 4;//验证码的长度
	var checkCode = document.getElementById("checkCode");
	checkCode.value = "";
	var selectChar = new Array(2,3,4,5,6,7,8,9,1,0);
	for(var i=0;i<codelength;i++) {
   		var charIndex = Math.floor(Math.random()*10);//对数下舍入
   		code +=selectChar[charIndex];
	}
	if(code.length != codelength){
   		createCode();
	}
	checkCode.value = code;
}

</script>
</head>
<body onload="createCode()" background="photo/yellowblue.jpg">
<form name="form1" action="turn.jsp" onsubmit="return val()" method="post">
<p align="center"><b><font color="#297405" size="5">欢迎登录！</font></b></p>
<table width="1141" height="188">

<tr><td width="605" height="41" align="right">
	<b><font color="#297405">输入邮箱：</font></b><input name="ac" id="ac" class="text2" autocomplete="off" type="text"></td>
<td height="41" width="284"><font color="#FF0000"><div id="d1">
	<p align="left"></div></font></td></tr>

<tr><td width="605" height="40" align="right">
	<b><font color="#297405">输入密码：</font></b><input name="pw" id="pw" class="text2" type="password" size="20"></td>
<td height="41" width="284"><font color="#FF0000"><div id="d2">
	<p align="left"></div></font></td></tr>


<tr><td width="605" height="50" align="right">
	<b><font color="#297405">输入验证码：</b></font><input name="verify" class="text2" id="verify" type="text"></td>
	<td width="284">
	<input type="button" id="checkCode"  class="btn02" class="code" onclick="createCode()" style="font-weight: 700"><a href="#" onclick="createCode()" style="text-decoration: none; font-weight: 700">看不清楚?</a></td>
	<td height="50" width="0"><font color="#FF0000"><div id="d3">
		<p align="left">&nbsp;</div></font></td></tr>

<tr><td>
	<p align="right"><b><font color="#297405">选择账号类型：
	<input type="radio" name="atype" id="atype" value="stu" checked>学生
	<input type="radio" name="atype" id="atype" value="tea">老师</font></b>
</td></tr>
<tr><td width="605">
<p align="right">
<input type="submit" class="btn02" value="登录" style="font-weight: 700" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset"  class="btn02" value="清空" style="font-weight: 700" ></td>
<td>
<p align="center">
<a href="register.jsp" style="text-decoration: none; font-weight: 700">没有账号？去注册！</a></td>
</tr>


<tr><td>
	<p align="right"><b><font color="#297405">测试账号：1148697133@qq.com 密码：javajava(姓名：张可 类型：学生)</font></b><br>
	<p align="right"><b><font color="#297405">测试账号：java@java.java 密码：javajava(姓名：王平 类型：老师)</font></b><br>
	<p align="right"><b><font color="#297405">测试账号：123456@qq.com 密码：123456(姓名：才旺 类型：学生)</font></b><br>
	<p align="right"><b><font color="#297405">测试账号：111111@qq.com 密码：111111(姓名：贾森 类型：老师)</font></b><br>

</td></tr>
</table>
<p align="right">&nbsp;</p>
</form>


</body>

</html>