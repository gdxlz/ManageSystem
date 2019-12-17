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
	.table thead tr th{
	 text-align:center;
	 border:0px;	 
	 background-color: #F0E68C
	}
	</style>
<title>商品信息统计</title>

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
				class="tip-bottom"><i class="icon-home"></i>主页</a> <a title="商品信息统计"
				class="tip-bottom">商品信息统计</a>
		</div>
	</div>
	<div id="chart1" style="width:1100px;height:130px;display: inline-block" >
		<table class="table table-bordered" style="margin: auto;width:450px;">
	  <caption><strong>商品种类</strong></caption>
		  <thead>
		    <tr>
		      <th style="background-color: #F0E68C">总商品数</th>
		      <th>电子产品</th>
		      <th>生活用品</th>
		      <th>家电</th>
		      <th>食品</th>
		      <th>旧书</th>
		      <th>服装</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>${total}</td>
		      <td>${electronic}</td>
		      <td>${life}</td>
		      <td>${electric}</td>
		      <td>${food}</td>
		      <td>${book}</td>
		      <td>${colothe}</td>
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
		<table class="table table-bordered" style="margin: auto;width:300px;">
	  <caption><strong>商品状态</strong></caption>
		  <thead>
		    <tr>
		      <th>总数</th>
		      <th>在售</th>
		      <th>下架</th>
		      <th>售出</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>${total}</td>
		      <td>${noSoldOut}</td>
		      <td>${soldDown}</td>
		      <td>${soldOut}</td>
		    </tr>
		  </tbody>
	</table>
	</div>
	<div id="chart4" style="width: 40px;height:100px;display: inline-block" >
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
                text: '商品种类',
                subtext: '所有商品'
            },
            tooltip: {},
            legend: {
                data:['总数']
            },
            xAxis: {
                data: ["电子产品","生活用品","家电","食品","旧书","服装"]
            },
            yAxis: {},
            series: [{
                name: '商品种类',
                type: 'bar',
                data: [${electronic},${life},${electric},${food},${book},${colothe}],
                itemStyle: {   
                    //通常情况下：
                    normal:{  
    　　　　　　　　　　　　//每个柱子的颜色即为colorList数组里的每一项，如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
                        color: function (params){
                            var colorList = ['rgb(194,53,49)','rgb(47,69,84)','rgb(97,160,168)','rgb(212,130,101)','rgb(145,199,174)','rgb(116,159,131)'];
                            return colorList[params.dataIndex%6];
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
        option2 = {
        	    tooltip: {
        	        trigger: 'item',
        	        formatter: "{a} <br/>{b}: {c} ({d}%)"
        	    },
        	    legend: {
        	        orient: 'vertical',
        	        x: 'left',
        	        data:['电子产品','生活用品','家电','食品','旧书','服装']
        	    },
        	    series: [
        	        {
        	            name:'商品种类',
        	            type:'pie',
        	            radius: ['50%', '70%'],
        	            avoidLabelOverlap: false,
        	            label: {
        	                normal: {
        	                    show: false,
        	                    position: 'center'
        	                },
        	                emphasis: {
        	                    show: true,
        	                    textStyle: {
        	                        fontSize: '30',
        	                        fontWeight: 'bold'
        	                    }
        	                }
        	            },
        	            labelLine: {
        	                normal: {
        	                    show: false
        	                }
        	            },
        	            data:[
        	                {value:${electronic}, name:'电子产品'},
        	                {value:${life}, name:'生活用品'},
        	                {value:${electric}, name:'家电'},
        	                {value:${food}, name:'食品'},
        	                {value:${book}, name:'旧书'},
        	                {value:${colothe}, name:'服装'}
        	            ]
        	        }
        	    ]
        	};
       
        var option3 = {
                title: {
                    text: '商品下架状况'
                },
                tooltip: {},
                legend: {
                    data:['总数']
                },
                xAxis: {
                    data: ["在售","下架","售出"]
                },
                yAxis: {},
                series: [{
                    name: '商品数',
                    type: 'bar',
                    data: [${noSoldOut},${soldDown},${soldOut}],
                    itemStyle: {   
                        //通常情况下：
                        normal:{  
        　　　　　　　　　　　　//每个柱子的颜色即为colorList数组里的每一项，如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
                            color: function (params){
                                var colorList = ['rgb(194,53,49)','rgb(47,69,84)','rgb(97,160,168)'];
                                return colorList[params.dataIndex%6];
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
                       text: '商品下架情况',
                       x:'center'
                   },
                tooltip: {
                	trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['在售','下架','售出']
                },
                series : [
                    {
                        name: '商品下架情况',
                        type: 'pie',
                        radius: '55%',
                        data:[
                            {value:${noSoldOut}, name:'在售'},
                            {value:${soldDown}, name:'下架'},
                            {value:${soldOut}, name:'售出'}
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