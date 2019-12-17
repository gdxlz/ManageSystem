<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<%=basePath%>font-awesome/css/font-awesome.css" />

</head>

<body style="background-color:#F0E68C" >
	<!-- <div id="sidebar" style="border-color:#F0E68C">
		<ul style="border-color:#F0E68C">
			<li class="submenu"><a href="#"><i class="icon icon-group"></i>
					<span>用户管理</span> </a>
				
					<li style="border-color:#F0E68C"><a href="<%=basePath%>user/userList?pageNum=1">用户列表</a></li>
					<li><a href="<%=basePath%>admin/user/user_add.jsp">添加用户</a></li>
				
			</li>
			<li class="submenu"><a href="#"><i class="icon icon-signal"></i>
					<span>商品管理</span> </a>
				
					<li style="border-color:#F0E68C"><a href="<%=basePath%>good/goodsList?pageNum=1">商品列表</a></li>
					<li><a href="<c:url value="/back/agent/addForm"/>">添加商品</a></li>
				
			</li>				
				</ul>
			</li>
		</ul>
	</div>-->
	<!--sidebar-menu-->
	 <!--<div id="sidebar">
		<ul>
					<li class="submenu"><a href="#"><i class="icon icon-group"></i>
					<span>用户管理</span> </a>
					<ul>
					<li><a href="<%=basePath%>user/userList?pageNum=1">用户列表</a></li>
					<li><a href="<%=basePath%>user/allUserInfo">用户统计</a></li> 
					</ul>			
					</li>
					
					<li class="submenu"><a href="#"><i class="icon icon-signal"></i>
					<span>商品管理</span> </a>
					<ul>
					<li><a href="<%=basePath%>good/goodsList?pageNum=1">商品列表</a></li>
					<li><a href="<%=basePath%>good/allGoodInfo">商品统计</a></li>	
					</ul>
					</li>							
		</ul>
			
	</div>-->
	<div id="sidebar">
		<ul>
			<li class="submenu"><a href="#"><i class="icon icon-group"></i>
					<span>信息管理</span> </a>
				<ul>
					<li><a href="<%=basePath%>user/userList?pageNum=1">用户列表</a></li>
					<li><a href="<%=basePath%>good/goodsList?pageNum=1">商品列表</a></li>
				</ul>
			</li>
			<li class="submenu"><a href="#"><i class="icon icon-signal"></i>
					<span>统计信息</span> </a>
				<ul>
					<li><a href="<%=basePath%>user/allUserInfo">用户统计</a></li> 
					<li><a href="<%=basePath%>good/allGoodInfo">商品统计</a></li>	
					<li><a href="<%=basePath%>good/allGoodAndTimeInfo">商品时间统计</a></li>	
					<li><a href="<%=basePath%>good/moneyInfo">商品金额统计</a></li>	
				</ul>
			</li>
		
			<li class="submenu"><a href="#"><i class="icon icon-ok"></i>
					<span>审核商品</span> </a>
				<ul>
					<li><a href="<%=basePath%>good/check">商品信息</a></li>
					
				</ul>
			</li>
		
			<li class="submenu"><a href="#"><i class="icon icon-fullscreen"></i>
					<span>系统设置</span> </a>
				<ul>
					<li><a href="<%=basePath%>admin/info">个人信息</a></li>
					<li><a href="<%=basePath%>admin/modify">修改密码</a></li>
				</ul>
			</li>
		</ul>
	</div>
 </body>


</html>
