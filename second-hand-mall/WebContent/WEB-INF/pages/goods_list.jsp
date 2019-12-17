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
<title>商品列表</title>
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
					class="tip-bottom"><i class="icon-home"></i>主页</a> <a title="商品列表"
					class="tip-bottom">商品列表</a>
			</div>
		</div>
		<!--End-breadcrumbs-->

		<!-- Page table -->
		<div class="container" style="width: 1000px;">
			<!-- &lt;!&ndash; Marketing Icons Section &ndash;&gt;-->

			<div class="col-lg-12">
				<h2 class="page-header"
					style="margin-top:10px;text-align: center; font-family: '微软雅黑', Verdana, sans-serif, '宋体', serif;">
					商品列表显示</h2>
			</div>

			<!--搜索栏-->
			 <form class="form-horizontal" id="myserchform" name="myform" action="<%=basePath%>good/goodsList" method="post">
			<!-- onreset="resetSelect()">-->
				<div class="form-group">
				<div  class="col-sm-8" style="text-align:center;">
					<input id="page" name="pageNo" type="hidden" value="1"/> 	
					<span >商品ID：</span>
					<input type="number" placeholder="请输入ID" name="goodId" id="goodId" value="${searchgoods.goodId}" style="width: 130px;" / >
					<span >名称：</span>
					<input type="text"  placeholder="请输入名称" name="goodName"  id="goodName" value="${searchgoods.goodName}" style="width: 130px;"/>
					<span >卖家ID：</span>
					<input type="number" placeholder="请输入ID" name="userId" id="userId" value="${searchgoods.userId}" style="width: 130px;"/>
					<br/>
					<span >描&nbsp;&nbsp;&nbsp;&nbsp;述：</span>
					<input id="description" type="text"  placeholder="请输入描述" name="description" id="description" value="${searchgoods.description}" style="width: 130px;"/>
					<span >状态：</span>
					<select name="status" id="myselected" style="width: 130px;" >
					<option value="" selected="selected">商品状态</option>
					<option value="1">下架</option>
					<option value="0">在售</option>
					<option value="2">已售</option>
					<option value="9">审查</option>
					</select>
					
					<span >类&nbsp;&nbsp;&nbsp;别：</span>
					<select name="catelog" id="mytypeselected" style="width: 130px;">
					<option value="" selected="selected">商品类别</option>
					<option value="电子产品">电子产品</option>
					<option value="生活用品">生活用品</option>
					<option value="家电">家电</option>
					<option value="食品">食品</option>
					<option value="旧书">旧书</option>
					<option value="服装">服装</option>
					
					</select>
				</div>
					<div class="col-sm-4">
						<button class="btn btn-info btn-sm" onclick="resetAll()">清空</button>
						<button class="btn btn-success btn-sm" type="submit" >查找</button>
						<button class="btn btn-danger btn-sm" type="button" id="deleteGoodsButton">删除</button>
					</div>
				</div>
			</form>
			
			<!--表格显示-->
			<table class="table table-bordered" >
				<thead>
					<tr>
						<th><input type="checkbox" id="selectAllButton"></th>
						<th>商品ID</th>
						<th>名称</th>
						<th>卖家ID</th>
						<th>价格</th>
						<th>描述</th>
						<th>状态</th>
						<th>类别</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${goodsList}" var="item">
						<tr>
							<td ><input type="checkbox" name="itemIds" value="${item.goodId}"></td>
							<td>${item.goodId}</td>
							<td>${item.goodName}</td>
							<td>${item.userId}</td>
							<td>${item.price}</td>
							<td>${item.description}</td>
							
							<td>
							<c:if test="${item.status == 0}">
							<span style="color:blue">在售</span>
							</c:if>
							<c:if test="${item.status == 1}">
							<span style="color:red">下架</span>
							</c:if>
							<c:if test="${item.status == 2}">
							<span style="color:red">已售</span>
							</c:if>
							<c:if test="${item.status == 9}">
							<span style="color:red">审核中</span>
							</c:if>
							</td>
							
							<td>
					        <c:if test="${item.catelog == '电子产品'}">  
							<span> 电子产品</span>
							</c:if>
							<c:if test="${item.catelog == '生活用品'}">  
							<span>生活用品 </span>
							</c:if>
							<c:if test="${item.catelog == '家电'}">  
							<span> 家电  </span>
							</c:if>
							<c:if test="${item.catelog == '食品'}">  
							<span> 食品  </span>
							</c:if>
							<c:if test="${item.catelog == '旧书'}">  
							<span>旧书 </span>
							</c:if>
							<c:if test="${item.catelog == '服装'}">  
							<span> 服装</span>
							</c:if>
							</td>
					
							
							<td>
							<button type="button" class="btn btn-primary btn-sm" onclick="doView(${item.goodId})">查看</button>
							<button type="button" class="btn btn-info btn-sm"  onclick="doEdit(${item.goodId})" >修改</button>
						</tr>
					</c:forEach>
				</tbody>
			</table>

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
                <h4 class="modal-title" id="myModalLabel" >修改商品信息</h4>
            </div>
            <div class="modal-body" style="height:0 auto; ">
            <form class="form-horizontal" id="myeditform" name="myform">
             <input type="hidden" id="id" name="goodId" value=""/>
            	<div class="form-group">
					 <label class="col-sm-4 control-label" >商品名称:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_goodName" name="goodName" style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >卖家ID:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_userId" name="userId" style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >价格:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_price" name="price" style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group" >
					 <label class="col-sm-4 control-label" >描述:</label>
					<div class="col-sm-8">
					<textarea rows="3" cols="20" id="my_description" name="description" style="margin-top: 8px;width:365px">
					</textarea>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >状态:</label>
					<div class="col-sm-8">
						<select name="status" style="margin-top: 8px;width: 372px;height: 27px;">
						<option value="1" selected="selected">下架</option>
						<option value="0">在售</option>
						<option value="2">售出</option>
						<option value="9">审核中</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >类别:</label>
					<div class="col-sm-8">
						<select name="catelog" style="margin-top: 8px;width: 372px;height: 27px;">
						<option value="电子产品" selected="selected">电子产品</option>
						<option value="生活用品">生活用品</option>
						<option value="家电">家电</option>
						<option value="食品">食品</option>
						<option value="旧书">旧书</option>
						<option value="服装">服装</option>
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
                <h4 class="modal-title" id="myModalLabel" >查看商品信息</h4>
            </div>
            <div class="modal-body" style="height:0 auto; ">
            <form class="form-horizontal" id="myviewform" name="myform">
             <input type="hidden" id="id" name="goodId" value=""/>
            	<div class="form-group">
					 <label class="col-sm-4 control-label" >商品名称:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_goodName" name="goodName" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >卖家ID:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_userId" name="userId" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >价格:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_price" name="price" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >描述:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_description" name="description" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >状态:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_status" name="status" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >商品类别:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_catelog" name="catelog" readonly style="margin-top: 8px;"/>
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
<script type="text/javascript"src="<%=basePath%>js/custom/delete.js"></script>

<script type="text/javascript">
		//初始化时间
		$(".form_datetime").datetimepicker({  
			format:'yyyy-mm-dd',
	    	todayHighlight: true,
	    	language:'zh-CN',
	    	minView: "month", 
	      	autoclose: true
		});  
		

		/* 查看 */
		function doView(id){
			$.ajax({
				url:'<%=basePath%>good/getGoods',
				type:'GET',
				data:{id:id},
				dataType:'json',
				success:function(json){
					if(json){
						$('#myviewform').find("input[name='goodId']").val(json.goodId);
						$('#myviewform').find("input[name='goodName']").val(json.goodName);
						$('#myviewform').find("input[name='userId']").val(json.userId);
						$('#myviewform').find("input[name='price']").val(json.price);
						$('#myviewform').find("input[name='description']").val(json.description);
						if(json.status==0){
							$('#myviewform').find("input[name='status']").val('在售');
						}else if(json.status==1){
							$('#myviewform').find("input[name='status']").val('下架');
						}else if(json.status==2){
							$('#myviewform').find("input[name='status']").val('已售');
						}
						else if(json.status==9){
							$('#myviewform').find("input[name='status']").val('审核中');
						}
						
						if(json.catelog=='生活用品'){
							$('#myviewform').find("input[name='catelog']").val('生活用品');
						}else if(json.catelog=='电子产品'){
							$('#myviewform').find("input[name='catelog']").val('电子产品');
						}else if(json.catelog=='家电'){
							$('#myviewform').find("input[name='catelog']").val('家电');
						}else if(json.catelog=='食品'){
							$('#myviewform').find("input[name='catelog']").val('食品');
						}else if(json.catelog=='旧书'){
							$('#myviewform').find("input[name='catelog']").val('旧书');
						}else{
							$('#myviewform').find("input[name='catelog']").val('服装');
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
			//alert("你点击了修改");
			$.ajax({
				url:'<%=basePath%>good/getGoods',
				type:'GET',
				data:{id:id},
				dataType:'json',
				success:function(json){
					if(json){
						//alert(JSON.stringfy(json));
						$('#myeditform').find("input[name='goodId']").val(json.goodId);
						$('#myeditform').find("input[name='goodName']").val(json.goodName);
						$('#myeditform').find("input[name='userId']").val(json.userId);
						$('#myeditform').find("input[name='price']").val(json.price);
						$('#myeditform').find("textarea[name='description']").val(json.description);
						$('#myeditform').find("select[name='status']").val(json.status);
						$('#myeditform').find("select[name='catelog']").val(json.catelog);
						
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
				url:'<%=basePath%>good/updateGoods',
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
	$("#mytypeselected option[value='${searchgoods.catelog}']").attr("selected","selected"); 
	$("#myselected option[value='${searchgoods.status}']").attr("selected","selected"); 
	
	//分页跳转
	function jumpPage(pagenum) {
  		//先修改要访问的页码
  		document.getElementById("page").value=pagenum;
  		//手动提交查询form表单
  		document.getElementById("myserchform").submit();
  	}
	//清空表单的下拉列表的值
	function resetSelect(){
        //1、先把重置后的值赋给select对象；2、通过trigger出发change事件
		//alert("111");
        //$("#myserchform #description").attr("value",'tes1t');// 填充内容
        $("#myserchform #myselected").attr("selected",'0');
		$("#myserchform #mytypeselected").attr("selected",'');
		//location.reload();
	}
	//清空表单(废弃，无用)
	function formReset()
	{
	document.getElementById("myserchform").reset()
	}
	//利用jquery清空表单
	function resetAll(){
		   $("#goodId").val("")
		   $("#goodName").val("")
		   $("#userId").val("")
		   $("#description").val("")
		   $("#myselected").val("")
		   $("#mytypeselected").val("")
	}
</script>

</html>
