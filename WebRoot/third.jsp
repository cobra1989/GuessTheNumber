<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'third.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/styles.css">


</head>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("userName");
	String mode = request.getParameter("select");
	String num = request.getParameter("number");
	String clock = request.getParameter("clock");
	String count = request.getParameter("counter");
	String surprised =  request.getParameter("surprised");
%>
<body>
	<div class="box">
		<div class="title">
			<h2>猜&nbsp;数&nbsp;游&nbsp;戏</h2>
		</div>
		<hr>
		<form action="second.jsp" method="post" onsubmit="return true">
			<input type="hidden" value="<%=name %>" name="userName"/>
			<input type="hidden" value="<%=mode %>" name="select"/>
			<input type="hidden" value="<%=num %>" name="number"  id="number"/>
			<input type="hidden" value="<%=clock %>" name="clock" id="clock"/>
			<input type="hidden" value="<%=count %>" name="count"/>
			<input type="hidden" value="<%=surprised %>" name="surprised" id="surprised"/>
			<input type="hidden" name="back" id="back"/>
			<div class="input">
				<label for="userName" id="result"></label>
				
			</div>
			<div class="btn">
				<input type="submit" value="返回重猜" style="display:none; margin-left: 165px;" id="backbtn"/>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	var min = 0;
	var hours = 0;
	var sec = parseInt(document.getElementById("clock").value);
		if(sec > 60){
			min = obj%60;
			sec = sec - min*60;
			if(min>60){
				hours = min%60;
				min = min - hours*60;
			}
		}
	var str = hours+" 小时 "+min+" 分钟 "+sec+" 秒 ";
		
	var num = parseInt(document.getElementById("number").value);
	var surprised = parseInt(document.getElementById("surprised").value);
		if(num == surprised){
			document.getElementById("result").innerHTML = "<div style='text-align: left; margin-left:100px;'><span>恭喜用户:<%=name%>,回答正确!<br>总计竞猜次数:<%=count%><br>总计用时:<span id='total'></span></div>";
			document.getElementById("total").innerHTML = str;
		}else if(num > surprised){
			document.getElementById("backbtn").style.display='block';
			document.getElementById("back").value ="big"
			document.getElementById("result").innerHTML ="数字错误,返回重新猜!";
		}else if(num < surprised){
			document.getElementById("backbtn").style.display='block';
			document.getElementById("back").value ="small"
			document.getElementById("result").innerHTML ="数字错误,返回重新猜!";
		}
		
</script>
</html>
