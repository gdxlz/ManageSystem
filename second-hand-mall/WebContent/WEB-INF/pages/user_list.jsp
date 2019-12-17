<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
	//System.out.println(path);
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //System.out.println(basePath);
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

.modal-header{
	 text-align:center;
	} 
	
table td{
 text-align:center;
 border:0px;
}


</style>
<title>用户列表</title>
	<!-- 分页 -->
<link href="<%=basePath%>css/mypage.css" rel="stylesheet">

<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

<link href="<%=basePath%>css/bootstrap-datetimepicker.min.css" rel="stylesheet">

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
				<a href="<%=basePath%>admin/indexs" title="主页"
					class="tip-bottom"><i class="icon-home"></i>主页</a> <a title="用户列表"
					class="tip-bottom">用户列表</a>
			</div>
		</div>
		<!--End-breadcrumbs-->

		<!-- Page table -->
		<div class="container" style="width: 1000px;">
			<!-- &lt;!&ndash; Marketing Icons Section &ndash;&gt;-->

			<div class="col-lg-12">
				<h2 class="page-header"
					style="margin-top:10px;text-align: center; font-family: '微软雅黑', Verdana, sans-serif, '宋体', serif;">
					用户列表显示</h2>
			</div>

			<!--搜索栏-->
			 <form class="form-horizontal" id="myserchform" name="myform" action="<%=basePath%>user/userList" method="post">
				<div class="form-group">
				<div  class="col-sm-8" style="text-align:center;">
				<input id="page" name="pageNo" type="hidden" value="1"/> 	
					<span >用户ID：</span>
					<input type="number" placeholder="请输入ID" name="uid" id="uid" value="${searchuser.uid}" style="width: 130px;"/>
					<span >用户名：</span>                                   
					<input type="text" placeholder="请输入用户名" name="username" id="username" value="${searchuser.username}" style="width: 130px;"/>	
					<span >姓名：</span>                                   
					<input type="text" placeholder="请输入真实姓名" name="name" id="name" value="${searchuser.name}" style="width: 130px;"/>				
					<br/>
					<span>性&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
					<select name="sex" id="myselectedSex" style="width: 130px;">
					<option value="" selected="selected">用户性别</option>
					<option value="男">男</option>
					<option value="女">女</option>
					</select>
					
					<span >手&nbsp;&nbsp;&nbsp;机：</span>
					<input type="number" placeholder="请输入手机号" name="telephone"  id="telephone" value="${searchuser.telephone}" style="width: 130px;"/>					
					<span >状态：</span>
					<select name="status" id="myselectedActive" style="width: 130px;">
					<option value="" selected="selected">是否激活</option>
					<option value='Y'>已激活</option>
					<option value='N'>未激活</option>
					</select>
				</div>
					<div class="col-sm-4">
					    <!-- <button class="btn btn-info btn-sm" onclick="formReset()">清空</button> -->
					    <button class="btn btn-info btn-sm" onclick="resetAll()">清空</button>
						<button class="btn btn-success btn-sm" type="submit" >查找</button>
						<button class="btn btn-danger btn-sm" type="button" id="deleteUserButton">删除</button>
					</div>
				</div>
			</form>
			
			<!--表格显示-->
			<table class="table table-bordered" >
				<thead>
					<tr>
						<th><input type="checkbox" id="selectAllButton"></th>
						<th>ID</th>
						<th>用户名</th>
						<th>密码</th>
						<th>真实姓名</th>
						<th>生日</th>
						<th>性别</th>
						<th>电话</th>
						<th>邮箱</th>
						<th>状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userList}" var="item">
						<tr>
							<td ><input type="checkbox" name="itemIds" value="${item.uid}"></td>
							<td>${item.uid}</td>
							<td>${item.username}</td>
							<td>${item.password}</td>
							<td>${item.name}</td>
							<td><fmt:formatDate value="${item.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${item.sex}</td>
							<td>${item.telephone}</td>
							<td>${item.email}</td>
							<td>
							<c:if test="${item.status =='Y'}">  
							<span style="color:blue">已激活</span>
							</c:if>
							<c:if test="${item.status !='Y'}">
							<span style="color:red">未激活</span>
							</c:if>
							</td>
							<td>
							<button type="button" class="btn btn-primary btn-sm" onclick="doView(${item.uid})">查看</button>
							<button type="button" class="btn btn-info btn-sm"  onclick="doEdit(${item.uid})">修改</button>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!--分页条-->
			<!--<div style="text-align: right">
				<div class="pagination">
					<ul>
						<li><a>总用户数:${userGrid.total }人</a></li>
						<li><a>第${userGrid.current }页</a></li>
						<c:if test="${userGrid.current ne 1 }">
							<li><a 
								href="<%=basePath%>user/userList?pageNum=${userGrid.current-1 }">上一页</a>
								</li>
						</c:if>

						<c:if test="${userGrid.current < (userGrid.total+7)/8 }">
							<li><a
								href="<%=basePath%>user/userList?pageNum=${userGrid.current+1 }">下一页</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>-->
			 <div class="page">
		                    【当前第${pageInfo.pageNum}页，总共${pageInfo.pages}页，总共${pageInfo.total}条记录】
		        <a href="javascript:jumpPage(1)" title="">首页</a>
		        <a href="javascript:jumpPage(${pageInfo.prePage})" title="">上一页</a>
		        <a href="javascript:jumpPage(${pageInfo.nextPage})" title="">下一页</a>
		        <a href="javascript:jumpPage(${pageInfo.pages})" title="">尾页</a> 
      		</div>
		</div>
	</div>

	
	<!--==================================================================================================================-->
	<jsp:include page="main_bottom.jsp"></jsp:include>
	
<!--修改  模态框（Modal） -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel" >修改用户信息</h4>
            </div>
            <div class="modal-body" style="height:300px; ">
            <form class="form-horizontal" id="myeditform" name="myform">
             <input type="hidden" id="id" name="id" value=""/>
             <input type="hidden" id="power" name="power" value=""/>
              <input type="hidden" id="goodsNum" name="goodsNum" value=""/>
            	<div class="form-group">
					 <label class="col-sm-4 control-label" >id:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_id" name="uid" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >姓名:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_name" name="name"  style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >用户名:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_username" name="username" style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >密码:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_password" name="password" style="margin-top: 8px;"/>
					</div>
				</div>
				
				<!-- <div class="form-group">
					 <label class="col-sm-4 control-label" >创建时间:</label>
					<div class="col-sm-8">
						 <input  type="text" id="datetimepicker"  name="createAt" class="form-control form_datetime" style="margin-top: 8px;">
					</div>
					
				</div> -->
				
				<div class="form-group">
					 <label class="col-sm-4 control-label" >性别:</label>
					<div class="col-sm-8">
						<select name="sex" style="margin-top: 8px;width: 372px;height: 27px;">
						<option value="男">男</option>
						<option value="女">女</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >电话:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_telephone" name="telephone"  style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >邮箱:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_email" name="email"  style="margin-top: 8px;"/>
					</div>
				</div>
				
				<div class="form-group">
					 <label class="col-sm-4 control-label" >状态:</label>
					<div class="col-sm-8">
						<select name="status" style="margin-top: 8px;width: 372px;height: 27px;">
						<option value="Y">已激活</option>
						<option value="N">未激活</option>
						</select>
					</div>
				</div>
			  </form>
            </div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="doSave()">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 查看 模态框（Modal） -->
<div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel" >查看用户信息</h4>
            </div>
            <div class="modal-body" style="height:300px; ">
            <form class="form-horizontal" id="myviewform" name="myform">

				<div class="form-group">
					 <label class="col-sm-4 control-label" >用户ID:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_id" name="uid" readonly style="margin-top: 8px;"/>
					</div>
				</div>
            	<div class="form-group">
					 <label class="col-sm-4 control-label" >用户名:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_username" name="username" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				
				<div class="form-group">
					 <label class="col-sm-4 control-label" >密码:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_password" name="password" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >姓名:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_name" name="name" readonly style="margin-top: 8px;"/>
					</div>
				</div>
			   <div class="form-group">
					 <label class="col-sm-4 control-label" >生日:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_birthday" name="birthday" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >性别:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_sex" name="sex" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >电话:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_telephone" name="telephone" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >邮箱:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_email" name="email" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >状态:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_status" name="status" readonly style="margin-top: 8px;"/>
					</div>
				</div>
			  </form>
            </div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>

<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- datetimepicker -->
<script type="text/javascript" src="<%=basePath%>js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src='<%=basePath%>js/bootstrap-datetimepicker.zh-CN.js'></script>
<!-- 全选 base.js -->
<!-- 这个js是自己写的，用于多选删除功能-->
<script type="text/javascript"src="<%=basePath%>js/custom/delete.js"></script>

<script type="text/javascript">
		//初始化时间
		$(".form_datetime").datetimepicker({  
			format:'yyyy-mm-dd hh:ii',
	    	todayHighlight: true,
	    	language:'zh-CN',
	      	autoclose: true
		});  

		/* 查看 */
		function doView(id){
			$.ajax({
				url:'<%=basePath%>user/getUser',
				type:'GET',
				data:{id:id},
				dataType:'json',
				success:function(json){
					if(json){
						//alert(JSON.stringify(json.username));//alert json对象
						$('#myviewform').find("input[name='uid']").val(json.uid);						
						$('#myviewform').find("input[name='username']").val(json.username);
						$('#myviewform').find("input[name='password']").val(json.password);
						$('#myviewform').find("input[name='name']").val(json.name);
						$('#myviewform').find("input[name='birthday']").val(new Date(json.birthday).getFullYear()+"-"+
																			("0"+(new Date(json.birthday).getMonth()+1)).slice(-2)+"-"+
																			("0"+new Date(json.birthday).getDate()).slice(-2));
						
						$('#myviewform').find("input[name='sex']").val(json.sex);
						$('#myviewform').find("input[name='telephone']").val(json.telephone);
						$('#myviewform').find("input[name='email']").val(json.email);
						if(json.status=='Y'){
							$('#myviewform').find("input[name='status']").val('已激活');
						}else{
							$('#myviewform').find("input[name='status']").val('未激活');
						}
						$('#viewModal').modal('toggle');
					}
				},
				error:function(){
					alert('请求超时或系统出错!');
					$('#viewModal').modal('hide');
				}
			});
		}
		
		/* 修改 */
		function doEdit(id){
			$.ajax({
				url:'<%=basePath%>user/getUser',
				type:'GET',
				data:{id:id},
				dataType:'json',
				success:function(json){
					if(json){
						//alert(JSON.stringify(json.username));//alert json对象
						$('#myeditform').find("input[name='uid']").val(json.uid);						
						$('#myeditform').find("input[name='username']").val(json.username);
						$('#myeditform').find("input[name='password']").val(json.password);
						$('#myeditform').find("input[name='name']").val(json.name);
						//$('#myeditform').find("input[name='birthday']").val(json.birthday);
						//$('#myeditform').find("input[name='sex']").val(json.sex);
						if(json.sex=='男'){
							$('#myeditform').find("select[name='sex']").val('男');
						}else{
							$('#myeditform').find("select[name='sex']").val('女');
						}
						$('#myeditform').find("input[name='telephone']").val(json.telephone);
						$('#myeditform').find("input[name='email']").val(json.email);
						if(json.status=='Y'){
							$('#myeditform').find("select[name='status']").val('Y');
						}else{
							$('#myeditform').find("select[name='status']").val('N');
						}
						$('#editModal').modal('toggle');
					}
				},
				error:function(){
					alert('请求超时或系统出错!');
					$('#viewModal').modal('hide');
				}
			});
				
		}
		
		/* 保存 */
		function doSave(){
			$.ajax({
				url:'<%=basePath%>user/updateUser',
				type:'POST',
				data:$('#myeditform').serialize(),// 序列化表单值  
				dataType:'json',
				success:function(json){
					alert(json.msg);
					$('#editModal').modal('toggle');
					location.reload();
				},
				error:function(){
					alert('请求超时或系统出错!');
					$('#editModal').modal('toggle');
				}
			});
				
		}
	
		//根据值 动态选中
		$("#myselectedSex option[value='${searchuser.sex}']").attr("selected","selected"); 
		$("#myselectedActive option[value='${searchuser.status}']").attr("selected","selected"); 
		
		//分页跳转
		function jumpPage(pagenum) {
	  		//先修改要访问的页码
	  		document.getElementById("page").value=pagenum;
	  		//手动提交查询form表单
	  		document.getElementById("myserchform").submit();
	  	}
		//清空表单（已废弃）
		function formReset()
		{
		document.getElementById("myserchform").reset()
		}
		//利用jquery清空表单
		function resetAll(){
			   $("#uid").val("")
			   $("#username").val("")
			   $("#name").val("")
			   $("#myselectedSex").val("")
			   $("#telephone").val("")
			   $("#myselectedActive").val("")
		}
		
	</script>

</html>
