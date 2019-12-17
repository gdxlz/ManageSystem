<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //out.print("test test test test");
  	//out.println(basePath);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
</head>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/matrix-style.css" />
<link rel="stylesheet" href="<%=basePath%>css/matrix-media.css" />
<link rel="stylesheet" href="<%=basePath%>font-awesome/css/font-awesome.css" />

<body>
	<!--Header-part-->
	<div id="headers" >
	
	   	<div style="float:letf;height:50px;background-color:#F0E68C;">
	   	<div style="float:left;background-color:#FFB53E;height:50px;width:220px;">
	   	<a href="<%=basePath%>admin/indexs">
	   	<p style="font-size:30px;text-align:center;">首页</p>
	   	</a>
	   	</div>
	   	<h1 style="text-align:center;margin-top: 10px;margin-bottom: 0px;color:#FFB53E">佛大校园二手商城后台管理系统</h1>
	   	</div>
	    
	  
	</div>
	<!--close-Header-part-->
	<!--top-Header-menu-->
	<div id="user-nav" class="navbar navbar-inverse" style="border-color:#F0E68C">
		<ul class="nav" style="height:50px;background-color:#F0E68C;border-color:#F0E68C">
			<li class="dropdown" id="profile-messages" style="border-color:#F0E68C"><a title="" href="#"
				data-toggle="dropdown" data-target="#profile-messages"
				class="dropdown-toggle"> <i class="icon icon-user"></i> 
				<span class="text">${sessionScope.admin.userName }</span><b class="caret"></b> </a>
				<ul class="dropdown-menu">
					<li><a href="<%=basePath%>admin/info"><i class="icon-user"></i>个人信息</a></li>
					<li class="divider"></li>
					<li><a href="<%=basePath%>admin/modify"><i class="icon-check"></i>修改密码</a></li>
					<li class="divider"></li>
					<li><a href="<%=basePath%>admin/logOut"
						onclick="return confirm('确认退出吗？');"><i class="icon-key"></i>退出</a>
					</li>
				</ul>
			</li>
			<li class="" style="border-color:#F0E68C"><a title="" href="<%=basePath%>admin/logOut"
				onclick="return confirm('确认退出吗？');"><i
					class="icon icon-share-alt"></i> <span class="text">退出</span> </a></li>
		</ul>
	</div>
	<!-- <%out.print("<script>alert('"+basePath+"');</script>"); %> -->
	<!-- 实现左边动画 -->
	<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
	<script src="<%=basePath%>js/matrix.js"/></script>
	<!-- 实现上边动画 -->
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
	
	

	
</body>
</html>
