<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
	System.out.println(path);
//	/squirrel
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    System.out.println(basePath);
//	http://localhost:80/squirrel/

%>
<!DOCTYPE html>
<html lang="zh">

<head>
<title>佛大管理员后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css"/>
<link rel="stylesheet" href="<%=basePath%>css/matrix-login.css"/>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap-responsive.min.css"/>
<link rel="stylesheet" href="<%=basePath%>font-awesome/css/font-awesome.css" />
</head>

<!-- <body style="background-image:url(a.jpg)">-->
<body>
	<div id="loginbox">
	<!-- 背景图片是在matrix-login.css里面 -->
	<h1 style="text-align:center;">佛大校园二手后台管理</h1>
		<form id="loginform" class="form-vertical" action="<%=basePath%>admin/index" method="post" role="form">
			<div class="control-group normal_text">
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_lg"><i class="icon-user"></i> </span> <input
							type="text"  name="phone" id="phone"
							class="required" value="" placeholder="账号" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly"><i class="icon-lock"></i> </span>
						<input
							type="password" placeholder="密码" name="password"
							id="password" />
					</div>
				</div>
			</div>
			<!--<c:if test="${msg!=null}">
				<span style="color:red;">${msg}</span><br>
				</c:if>-->
			<div class="form-actions">
				<input type="submit" class="btn btn-success" value="登录" style="margin-left:20%">
				<input type="reset" class="btn btn-warning" value="取消" style="margin-left:40%">
			</div>
		</form>
	</div>
	<script src="<%=basePath%>js/jquery.min.js"/></script>
	<script src="<%=basePath%>js/matrix.login.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=basePath%>js/jquery.validate.js"/></script>
	<script src="<%=basePath%>js/jquery.md5.js"/></script>
	<script type="text/javascript">
    $("#loginform").validate({
        rules: {
        	phone: "required",
            password: {
                required: true,
                //minlength: 6
            },
        },
        messages: {
        	phone:  "请输入账号",
            password: {
                required: "请输入密码",
                minlength: jQuery.format("密码不能小于6个字符")
            }
        }
    });
    
   
    
    //function encrypt(){
    	/// var pwd = $.md5($("#password").val());
    //	$("#password").val(pwd);
    //	return true;
    	// };
</script>
</body>

</html>
