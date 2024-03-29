<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
	//System.out.println(path);
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
   // System.out.println(basePath);
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>

<body>

	<jsp:include page="main_top.jsp"></jsp:include>
	<jsp:include page="main_left.jsp"></jsp:include>
	<!--=============================================================================================================================================================================-->
	<!--main-container-part-->
	<div id="content" style="margin-right: 100px;margin-top: 40px;">
		<!--breadcrumbs-->
		<div id="content-header">
			<div id="breadcrumb">
			<!-- 如果会话失效，那么就会跳到登录界面 -->
				<a title="主页" class="tip-bottom" href="<%=basePath%>admin/indexs"><i class="icon-home"></i>主页</a>
			</div>
		</div>
		<!--End-breadcrumbs-->

		<!-- 主要内容 -->
		<div class="container-fluid">
			<div class="quick-actions_homepage">
				<ul class="quick-actions">
					<li class="bg_lb span4"><a
					href="<%=basePath%>user/userList?pageNum=1"> <i
							class="icon-group"></i>用户管理
					</a></li>
					
					<li class="bg_lg span4"><a
						href="<%=basePath%>good/goodsList?pageNum=1"> <i
							class="icon-signal"></i>商品管理
					</a></li>
					
					<li class="bg_ly span4"><a
					href="<%=basePath%>user/allUserInfo"> <i
							class="icon-group"></i>用户统计
					</a></li>
					
					<li class="bg_lo span4"><a
					href="<%=basePath%>good/allGoodInfo"> <i
							class="icon-signal"></i>商品统计
					</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!--==================================================================================================================-->
	<jsp:include page="main_bottom.jsp"></jsp:include>

</body>
</html>
