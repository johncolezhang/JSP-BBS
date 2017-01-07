<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
ArrayList l=(ArrayList)session.getAttribute("login");
String ad1=(String)l.get(0);
String ty=(String)l.get(1);
%>

<html>
<head> <title>主 页</title>
<link rel="shortcut icon" href="photo\favicon.ico" type="image/x-icon">
<link rel="icon" href="\photo\favicon.ico" type="image/x-icon">
</head>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0">
<iframe src='head.jsp' name="head" id="head" width="100%" height="144px" frameborder="0" scrolling="no"></iframe>
<iframe id="bodyiframe" name="bodyiframe" src="body.html" width="100%" height="0" frameborder="0" scrolling="no" onload="SetBodyHeight()"></iframe>
<iframe src="foot.html" width="100%" height="150px" frameborder="0" scrolling="no"></iframe>

<script type="text/javascript">
function SetBodyHeight(){
  var iframeid=document.getElementById("bodyiframe"); 
  if (document.getElementById){
    if (iframeid && !window.opera){
      if (iframeid.contentDocument && iframeid.contentDocument.body.offsetHeight){
        iframeid.height = iframeid.contentDocument.body.offsetHeight;
      }
      else if(iframeid.Document && iframeid.Document.body.scrollHeight){
        iframeid.height = iframeid.Document.body.scrollHeight;
      }
    }
  }
}
</script>

</body>

</html>