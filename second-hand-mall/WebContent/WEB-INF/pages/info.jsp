<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8" />
	<title>个人信息</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css">
		.center{
			width: 250px;
		    margin-left: 400px;
		    font-size: 25;
		    }
		    .bg{
			 /*background-color: #2E363F; */
			background:url(../images/背景.jpg) no-repeat;
			background-size:100%;
			padding: 0;			
		}
	</style>
</head>
<link rel="stylesheet" href="<%=basePath%>css/info_main.css"/>
<body>

	<jsp:include page="main_top.jsp"></jsp:include>
	<jsp:include page="main_left.jsp"></jsp:include>
	<!--=============================================================================================================================================================================-->
	<!--main-container-part-->
	<div id="content" style="margin-right: 100px; margin-top: 40px;">
		<!--breadcrumbs-->
		<div id="content-header">
			<div id="breadcrumb">
				<a href="<%=basePath%>admin/indexs" title="主页" class="tip-bottom">
				<i class="icon-home"></i>主页</a> <a title="管理员个人信息" class="tip-bottom">管理员个人信息</a>
			</div>
		</div>
		<!--End-breadcrumbs-->
		<!-- Tabs Container-->
		<section id="tabsContainer" class="clearfix" style="height:700px;background:url(../images/背景.jpg) no-repeat;background-size:100%;">

			<!--Inner-->
			<div id="innerBg" style="background:url(../images/倒置背景.jpg) no-repeat;background-size:100%;height:700px">

				<!--About Tab-->
				<article id="about" class="clearfix bg">
					<!-- Introduction -->
					<section id="introduction" class="clearfix bg">
						<h1 style="margin-left:400px;font-size:30px">个人信息</h1>
						<ul class="info">
							<li class="center" style="font-size:20px"><span>姓名</span> : ${admin.userName}</li>
							<li class="center" style="font-size:20px"><span>账号</span> : ${admin.phone}</li>
							<li class="center" style="font-size:20px"><span>角色</span> : 后台管理员</li>
						</ul>
					</section>
					<!-- End introduction -->
				</article>

			</div>
			<!--End Inner-->
		</section>

	</div>
	<!--==================================================================================================================-->
	<jsp:include page="main_bottom.jsp"></jsp:include>
	<!--End Page Wrapper-->
</body>

