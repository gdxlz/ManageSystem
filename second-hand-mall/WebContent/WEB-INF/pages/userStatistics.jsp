<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;UTF-8" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
	//System.out.println(path);
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //System.out.println(basePath);
%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
 	
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入 ECharts 文件 -->
   <script src="http://echarts.baidu.com/dist/echarts.min.js"></script> 
<!-- <script src="js/apache-echarts-4.2.1/echarts.all.js"></script> --> 

	<style>	
	.modal-header{
		 text-align:center;
		} 		
	table td{
	 text-align:center;
	 border:0px;
	}	
	</style>
<title>用户信息统计</title>

<link href="<%=basePath%>css/mypage.css" rel="stylesheet">

<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

<link href="<%=basePath%>css/bootstrap-datetimepicker.min.css" rel="stylesheet">
</head>
<body>
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<jsp:include page="main_top.jsp"></jsp:include>
	<jsp:include page="main_left.jsp"></jsp:include>
	<!--=============================================================================================================================================================================-->
	<!--main-container-part-->
	<div id="content" style="margin-right: 130px;margin-top: 40px;">
		<!--breadcrumbs-->
	<div id="content-header">
		<div id="breadcrumb">
			<a href="<%=basePath%>admin/indexs" title="主页"
				class="tip-bottom"><i class="icon-home"></i>主页</a> <a title="用户信息统计"
				class="tip-bottom">用户信息统计</a>
		</div>
	</div>
	<div id="chart1" style="width:1100px;height:130px;display: inline-block" >
		<table class="table table-bordered" style="margin: auto;width:300px;">
	  <caption><strong>用户性别</strong></caption>
		  <thead>
		    <tr class="success">
		      <th style="background-color: #F0E68C">总人数</th>
		      <th style="background-color: #F0E68C">男</th>
		      <th style="background-color: #F0E68C">女</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>${total}人</td>
		      <td>${manNum}人</td>
		      <td>${womanNum}人</td>
		    </tr>
		  </tbody>
	</table>
	</div>
	<div id="chart2" style="width: 40px;height:100px;display: inline-block" >
	</div>
	<div id="main1" style="width: 570px;height:400px;display: inline-block" >
	</div>
	<div id="main2" style="width: 570px;height:400px;display: inline-block" >
	</div>
	
	<div id="chart3" style="width:1100px;height:130px;display: inline-block" >
		<table class="table table-bordered" style="margin: auto;width:300px">
	  <caption><strong>用户激活人数</strong></caption>
		  <thead>
		    <tr>
		      <th style="background-color: #F0E68C">总人数</th>
		      <th style="background-color: #F0E68C">激活人数</th>
		      <th style="background-color: #F0E68C">未激活人数</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>${total}人</td>
		      <td>${activeNum}人</td>
		      <td>${noActiveNum}人</td>
		    </tr>
		  </tbody>
	</table>
	</div>
	<div id="chart3" style="width: 40px;height:100px;display: inline-block" >
	</div>
	<div id="main3" style="width: 570px;height:400px;display: inline-block" >
	</div>
	<div id="main4" style="width: 570px;height:400px;display: inline-block" >
	</div>
	</div>
	<!--==================================================================================================================-->
	<jsp:include page="main_bottom.jsp"></jsp:include>
	
	 <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart1 = echarts.init(document.getElementById('main1'));
        var myChart2 = echarts.init(document.getElementById('main2'));
        var myChart3 = echarts.init(document.getElementById('main3'));
        var myChart4 = echarts.init(document.getElementById('main4'));
        // 指定图表的配置项和数据
        var option1 = {
            title: {
                text: '用户性别'
            },
            tooltip: {},
            legend: {
                data:['人数']
            },
            xAxis: {
                data: ["男","女"]
            },
            yAxis: {},
            series: [{
                name: '人数',
                type: 'bar',
                data: [${manNum},${womanNum}],
                itemStyle: {   
                    //通常情况下：
                    normal:{  
    　　　　　　　　　　　　//每个柱子的颜色即为colorList数组里的每一项，如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
                        color: function (params){
                            var colorList = ['rgb(164,0,0)','rgb(51,75,92)'];
                            return colorList[params.dataIndex%2];
                        }
                    },
                    //鼠标悬停时：
                    emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                },
            }]
        };
        var option2 ={
       		title: {
                   text: '用户性别比例',
                   x:'center'
               },
            tooltip: {
            	trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['男','女']
            },
            series : [
                {
                    name: '用户性别比例',
                    type: 'pie',
                    radius: '55%',
                    data:[
                        {value:${manNum}, name:'男'},
                        {value:${womanNum}, name:'女'}
                    ]
                }
            ]
        };
       
        var option3 = {
                title: {
                    text: '用户激活状况'
                },
                tooltip: {},
                legend: {
                    data:['人数']
                },
                xAxis: {
                    data: ["已激活","未激活"]
                },
                yAxis: {},
                series: [{
                    name: '人数',
                    type: 'bar',
                    data: [${activeNum},${noActiveNum}],
                    itemStyle: {   
                        //通常情况下：
                        normal:{  
        　　　　　　　　　　　　//每个柱子的颜色即为colorList数组里的每一项，如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
                            color: function (params){
                                var colorList = ['rgb(164,0,0)','rgb(51,75,92)'];
                                return colorList[params.dataIndex%2];
                            }
                        },
                        //鼠标悬停时：
                        emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    },
                }]
            };
        
            var option4 ={
           		title: {
                       text: '用户激活比例',
                       x:'center'
                   },
                tooltip: {
                	trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['已激活','未激活']
                },
                series : [
                    {
                        name: '用户激活比例',
                        type: 'pie',
                        radius: '55%',
                        data:[
                            {value:${activeNum}, name:'已激活'},
                            {value:${noActiveNum}, name:'未激活'}
                        ]
                    }
                ]
            };
           
        // 使用刚指定的配置项和数据显示图表。
        myChart1.setOption(option1);
        myChart2.setOption(option2);
        myChart3.setOption(option3);
        myChart4.setOption(option4);
    </script> 
</body>
</html>