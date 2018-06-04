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

<title>My JSP 'second.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<%!
	int ran=0; 
%>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("userName");
	String mode = request.getParameter("select");
	String sur = request.getParameter("surprised");
	String count = request.getParameter("count");
	String clock = request.getParameter("clock");
	String back =  request.getParameter("back");
	if(back != null){
		if(back.equals("big")){
			out.print("<script type='text/javascript'>alert('数字偏大,请往小猜')</script>");
		}else if(back.equals("small")){
			out.print("<script type='text/javascript'>alert('数字偏小,请往大猜')</script>");
		}
	}
	int clocktime;
	if(clock != null){
		clocktime = Integer.parseInt(clock);
	}else{
		clocktime = 0;
	}
	
	if(sur == null){
		if (mode.equals("easy")) {
			ran = new Random().nextInt(9) + 1;
		} else if (mode.equals("normal")) {
			ran = new Random().nextInt(29) + 1;
		} else if (mode.equals("hard")) {
			ran = new Random().nextInt(49) + 1;
		}
	}else{
		if(sur != null){
			ran = Integer.parseInt(sur);
		}
	}
%>
<script type="text/javascript">
	//输入框点击效果
	function focusUserName(obj) {
		if (obj.value == "请输入竞猜数字") {
			obj.value = "";
			obj.style.color = "black";
		}
	}
	//输入框移开效果
	function blurUserName(obj) {
		if (obj.value == "") {
			obj.value = "请输入竞猜数字";
			obj.style.color = "#ccc";
		}
	}
	//三种难度数字范围判断
	function validate() {
		var mode = document.getElementById("gameMode");
		var num = document.getElementById("number");
		var sur = document.getElementById("surprised").value;
		if (mode.value == "easy") {
			if (num.value > 0 && num.value <= 10) {
				return true;
			} else {
				alert("简单模式(数字仅限:1-10)");
				return false;
			}
		} else if (mode.value == "normal") {
			if (num.value > 0 && num.value <= 30) {
				return true;
			} else {
				alert("普通模式(数字仅限:1-30)");
				return false;
			}
		} else if (mode.value == "hard") {
			if (num.value > 0 && num.value <= 50) {
				return true;
			} else {
				alert("艰难模式(数字仅限:1-50)");
				return false;
			}
		}
	}
	//时间
	var c = 0+<%=clocktime%>;
	var t;
	function timedCount() {
		document.getElementById("clock").innerHTML = c;
		document.getElementById("clocks").value = c;
		c = c + 1;
		t = setTimeout("timedCount()", 1000);
	}
	//竞猜次数计数
	function guess() {
		var counter = document.getElementById("counter").value;
		if (counter == "") {
			document.getElementById("counter").value = 1;
		} else {
			document.getElementById("counter").value = parseInt(counter) + 1;
		}

	}
</script>

</head>
<body onload="timedCount()">
	<!-- second.jsp输入你的答案,进入third.jsp -->
	<div class="box">
		<div class="title">
			<h2>猜&nbsp;数&nbsp;游&nbsp;戏</h2>
		</div>
		<hr>
		<form action="third.jsp" method="post" onsubmit="return validate();">
			<div style="margin-left: 70px;">
				<span>竞猜耗时:</span><span style="margin-left: 20px;" id="clock"></span><span>秒</span>
			</div>
			<div class="input">
				<label for="userName">竞猜数字:</label>
				<input type="text" id="number" value="请输入竞猜数字" onfocus="focusUserName(this);" onblur="blurUserName(this);" name="number" />
				<input type="hidden" value="<%=name %>" name="userName" />
				<input type="hidden" value="<%=mode %>" id="gameMode" name="select" />
				<input type="hidden" value="<%=ran %>" name="surprised" id="surprised" />
				<input type="hidden" id="clocks" name="clock" />
				<input type="hidden" name="counter" id="counter" value="<%=count %>"/>
			</div>
			<div class="btn">
				<input type="submit" value="开始竞猜" onclick="guess();"/>
			</div>
		</form>
	</div>
</body>
</html>
