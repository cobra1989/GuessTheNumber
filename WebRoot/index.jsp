<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<script type="text/javascript">
	function focusUserName(obj){
		if(obj.value == "请输入玩家名"){
			obj.value = "";
			obj.style.color = "black";
		}
	}
	function blurUserName(obj) {
		if(obj.value == ""){
			obj.value = "请输入玩家名";
			obj.style.color = "#ccc";
		}
	}
	</script>
  </head>
  
  <body>
  <!-- 1.first.jsp输入用户名,选择难度(下拉框)。 -->
  <!-- （简单-1到10，普通-1到30，难-1到50),进入second.jsp -->
  	<div class="box">
  	<div class="title"><h2>猜&nbsp;数&nbsp;游&nbsp;戏</h2></div>
  	<hr>
  	<form action="second.jsp" method="post">
  		<div class="input"><label for="userName">玩家名:</label><input type="text" id="userName" value="请输入玩家名" onfocus="focusUserName(this);" onblur="blurUserName(this);" name="userName"/></div>
  	<div class="select"><label for="select">难度选择:</label>
  		<select name="select">
  			<option value="easy">简单模式(1-10)</option>
  			<option value="normal">普通模式(1-30)</option>
  			<option value="hard">艰难模式(1-50)</option>
  		</select>
  		<input type="hidden" name="count" value="1"/> 
  		<div class="btn"><input type="submit" value="开始游戏"/></div>
  	</form>
  	</div>
  	</div>
  </body>
</html>
