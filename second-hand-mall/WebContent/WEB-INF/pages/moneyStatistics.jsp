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
<title>商品相关金额信息统计</title>

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
				class="tip-bottom"><i class="icon-home"></i>主页</a> <a title="商品金额信息统计"
				class="tip-bottom">商品金额信息统计</a>
		</div>
	</div>
	<div id="chart1" style="width:1000px;height:230px;display: inline-block" >
		<table class="table table-bordered" style="margin: auto;width:700px;">
	  <caption ><strong>各月相关商品金额</strong></caption>
		  <thead>
		    <tr>
		      <th>状态</th>
		      <th>总金额</th>
		      <th>一月</th>
		      <th>二月</th>
		      <th>三月</th>
		      <th>四月</th>
		      <th>五月</th>
		      <th>六月</th>
		      <th>七月</th>
		      <th>八月</th>
		      <th>九月</th>
		      <th>十月</th>
		      <th>十一</th>
		      <th>十二</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td class="success ">上架</td>
		      <td class="">${arrUp[0]}</td>
		      <td>${arrUp[1]}</td>
		      <td>${arrUp[2]}</td>
		      <td>${arrUp[3]}</td>
		      <td>${arrUp[4]}</td>
		      <td>${arrUp[5]}</td>
		      <td>${arrUp[6]}</td>
		      <td>${arrUp[7]}</td>
		      <td>${arrUp[8]}</td>
		      <td>${arrUp[9]}</td>
		      <td>${arrUp[10]}</td>
		      <td>${arrUp[11]}</td>
		      <td>${arrUp[12]}</td>
		    </tr>
		    <tr>
		      <td class="success ">下架</td>
		      <td class="">${arrDown[0]}</td>
		      <td>${arrDown[1]}</td>
		      <td>${arrDown[2]}</td>
		      <td>${arrDown[3]}</td>
		      <td>${arrDown[4]}</td>
		      <td>${arrDown[5]}</td>
		      <td>${arrDown[6]}</td>
		      <td>${arrDown[7]}</td>
		      <td>${arrDown[8]}</td>
		      <td>${arrDown[9]}</td>
		      <td>${arrDown[10]}</td>
		      <td>${arrDown[11]}</td>
		      <td>${arrDown[12]}</td>
		    </tr>
		    <tr>
		      <td class="success ">售出</td>
		      <td class="">${arrSailOut[0]}</td>
		      <td>${arrSailOut[1]}</td>
		      <td>${arrSailOut[2]}</td>
		      <td>${arrSailOut[3]}</td>
		      <td>${arrSailOut[4]}</td>
		      <td>${arrSailOut[5]}</td>
		      <td>${arrSailOut[6]}</td>
		      <td>${arrSailOut[7]}</td>
		      <td>${arrSailOut[8]}</td>
		      <td>${arrSailOut[9]}</td>
		      <td>${arrSailOut[10]}</td>
		      <td>${arrSailOut[11]}</td>
		      <td>${arrSailOut[12]}</td>
		    </tr>
		  </tbody>
	</table>
	</div>
	<div id="chart2" style="width: 40px;height:100px;display: inline-block" >
	</div>
	<div id="pad" style="height:50px">
	<button onclick="changeYear2019()" class="btn btn-danger" style="margin-left:750px;margin-top:20px">2019年</button>
	<button onclick="changeYear2020()" class="btn btn-warning" style="margin-top:20px">2020年</button>
	</div>
	<div id="main1" style="width: 1100px;height:400px;display: inline-block" >
	</div>
	<div id="main2" style="width: 10px;height:400px;display: inline-block" >
	</div>
	
	
	</div>
	<!--==================================================================================================================-->
	<jsp:include page="main_bottom.jsp"></jsp:include>
	
	 <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart1 = echarts.init(document.getElementById('main1'));
       // var myChart2 = echarts.init(document.getElementById('main2'));
        
        // 指定图表的配置项和数据
        var option1 = {
            title: {
                text: '2019年每月相关商品金额',
                subtext: '所有商品'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data:['上架金额','下架金额','售出金额']
            },
            /*grid: {
            	top: '10%',
                left: '10%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },*/
            toolbox: {
                show: true,
                feature: {
                    dataZoom: {
                        yAxisIndex: 'none'
                    },
                    dataView: {readOnly: false},
                    magicType: {type: ['line', 'bar']},
                    restore: {},
                    saveAsImage: {}
                }
            },
            xAxis: {
            	type: 'category',
                boundaryGap: true, //可以不写，但不能为false，否则柱子会左右超出Y轴
                data: ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
            },
            yAxis: {
            	type: 'value'
            },
            series: [
            	{
	                name: '上架金额',
	                type: 'bar',
	                data: [${arrUp[1]},${arrUp[2]},${arrUp[3]},${arrUp[4]},${arrUp[5]},${arrUp[6]},${arrUp[7]},${arrUp[8]},${arrUp[9]},${arrUp[10]},${arrUp[11]},${arrUp[12]}],
	                markPoint: {
	                    data: [
	                        {type: 'max', name: '最大值'},
	                        {type: 'min', name: '最小值'}
	                    ]
	                },
	                markLine: {
	                    data: [
	                        {type: 'average', name: '平均值'}
	                    ]
	                }
            	},
            	{
                    name: '下架金额',
                    type: 'bar',
                    color:'#2E8B57',
                    data:  [${arrDown[1]},${arrDown[2]},${arrDown[3]},${arrDown[4]},${arrDown[5]},${arrDown[6]},${arrDown[7]},${arrDown[8]},${arrDown[9]},${arrDown[10]},${arrDown[11]},${arrDown[12]}],
                    markPoint: {
	                    data: [
	                        {type: 'max', name: '最大值'},
	                        {type: 'min', name: '最小值'}
	                    ]
	                },
	                markLine: {
	                    data: [
	                        {type: 'average', name: '平均值'}
	                    ]
	                }
                },
            	{
                    name: '售出金额',
                    type: 'bar',
                    color:'	#4682B4',
                    data:  [${arrSailOut[1]},${arrSailOut[2]},${arrSailOut[3]},${arrSailOut[4]},${arrSailOut[5]},${arrSailOut[6]},${arrSailOut[7]},${arrSailOut[8]},${arrSailOut[9]},${arrSailOut[10]},${arrSailOut[11]},${arrSailOut[12]}],
                    markPoint: {
	                    data: [
	                        {type: 'max', name: '最大值'},
	                        {type: 'min', name: '最小值'}
	                    ]
	                },
	                markLine: {
	                    data: [
	                        {type: 'average', name: '平均值'}
	                    ]
	                }
                }
            ]
        };
        
        var option2 = {
                title: {
                    text: '2020年上架商品金额',
                    subtext: '所有商品'
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                legend: {
                    data:['上架金额','下架金额','售出金额']
                },
                /*grid: {
                	top: '10%',
                    left: '10%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },*/
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: {readOnly: false},
                        magicType: {type: ['line', 'bar']},
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: {
                	type: 'category',
                    boundaryGap: true, //可以不写，但不能为false，否则柱子会左右超出Y轴
                    data: ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
                },
                yAxis: {
                	type: 'value'
                },
                series: [
                	{
    	                name: '上架金额',
    	                type: 'bar',
    	               // data: [${January},${February},${March},${April},${May},${June},${July},${August},${September},${October},${November},${December}],
    	              data: [${arrUp2[1]},${arrUp2[2]},${arrUp2[3]},${arrUp2[4]},${arrUp2[5]},${arrUp2[6]},${arrUp2[7]},${arrUp2[8]},${arrUp2[9]},${arrUp2[10]},${arrUp2[11]},${arrUp2[12]}],
    	                markPoint: {
    	                    data: [
    	                        {type: 'max', name: '最大值'},
    	                        {type: 'min', name: '最小值'}
    	                    ]
    	                },
    	                markLine: {
    	                    data: [
    	                        {type: 'average', name: '平均值'}
    	                    ]
    	                }
                	},
                	{
                        name: '下架金额',
                        type: 'bar',
                        
                        data:  [${arrDown2[1]},${arrDown2[2]},${arrDown2[3]},${arrDown2[4]},${arrDown2[5]},${arrDown2[6]},${arrDown2[7]},${arrDown2[8]},${arrDown2[9]},${arrDown2[10]},${arrDown2[11]},${arrDown2[12]}],
                        markPoint: {
    	                    data: [
    	                        {type: 'max', name: '最大值'},
    	                        {type: 'min', name: '最小值'}
    	                    ]
    	                },
    	                markLine: {
    	                    data: [
    	                        {type: 'average', name: '平均值'}
    	                    ]
    	                }
                    },
                	{
                        name: '售出金额',
                        type: 'bar',
                        
                        data:  [${arrSailOut2[1]},${arrSailOut2[2]},${arrSailOut2[3]},${arrSailOut2[4]},${arrSailOut2[5]},${arrSailOut2[6]},${arrSailOut2[7]},${arrSailOut2[8]},${arrSailOut2[9]},${arrSailOut2[10]},${arrSailOut2[11]},${arrSailOut2[12]}],
                        markPoint: {
    	                    data: [
    	                        {type: 'max', name: '最大值'},
    	                        {type: 'min', name: '最小值'}
    	                    ]
    	                },
    	                markLine: {
    	                    data: [
    	                        {type: 'average', name: '平均值'}
    	                    ]
    	                }
                    }
                ]
            };
       
       
           
        // 使用刚指定的配置项和数据显示图表。
        myChart1.setOption(option1);
        //myChart2.setOption(option2);
      
        
        function changeYear2020(){
		myChart1.setOption(option2);

    	var arrUp2=[${arrUp2[0]},${arrUp2[1]},${arrUp2[2]},${arrUp2[3]},${arrUp2[4]},${arrUp2[5]},${arrUp2[6]},${arrUp2[7]},${arrUp2[8]},${arrUp2[9]},${arrUp2[10]},${arrUp2[11]}];
    	var arrDown2=[${arrDown2[0]},${arrDown2[1]},${arrDown2[2]},${arrDown2[3]},${arrDown2[4]},${arrDown2[5]},${arrDown2[6]},${arrDown2[7]},${arrDown2[8]},${arrDown2[9]},${arrDown2[10]},${arrDown2[11]}];
    	var arrSailOut2= [${arrSailOut2[0]},${arrSailOut2[1]},${arrSailOut2[2]},${arrSailOut2[3]},${arrSailOut2[4]},${arrSailOut2[5]},${arrSailOut2[6]},${arrSailOut2[7]},${arrSailOut2[8]},${arrSailOut2[9]},${arrSailOut2[10]},${arrSailOut2[11]}];
    	 
    	var tr=$("#chart1 tr");
    	var len=tr.length;
    	for(var i=1;i<len;i++){
    		if(i=1){
    			var td = $(tr[i]).find("td");
    			for(var j=1;j<14;j++){
    				$(td[j]).html(arrUp2[j-1]);
    			}
    		}  
    		if(i=2){
    			var td = $(tr[i]).find("td");
    			for(var j=1;j<14;j++){
    				$(td[j]).html(arrDown2[j-1]);
    			}
    		}   
    		if(i=3){
    			var td = $(tr[i]).find("td");
    			for(var j=1;j<14;j++){
    				$(td[j]).html(arrSailOut2[j-1]);
    			}
    		}   
    	}    	
     }
        
        function changeYear2019(){
       	 myChart1.setOption(option1);
       	 
       	 var arrUp=[${arrUp[0]},${arrUp[1]},${arrUp[2]},${arrUp[3]},${arrUp[4]},${arrUp[5]},${arrUp[6]},${arrUp[7]},${arrUp[8]},${arrUp[9]},${arrUp[10]},${arrUp[11]}];
      	 var arrDown=[${arrDown[0]},${arrDown[1]},${arrDown[2]},${arrDown[3]},${arrDown[4]},${arrDown[5]},${arrDown[6]},${arrDown[7]},${arrDown[8]},${arrDown[9]},${arrDown[10]},${arrDown[11]}];
      	 var arrSailOut= [${arrSailOut[0]},${arrSailOut[1]},${arrSailOut[2]},${arrSailOut[3]},${arrSailOut[4]},${arrSailOut[5]},${arrSailOut[6]},${arrSailOut[7]},${arrSailOut[8]},${arrSailOut[9]},${arrSailOut[10]},${arrSailOut[11]}];
      	 
     	var tr=$("#chart1 tr");
    	var len=tr.length;
    	for(var i=1;i<len;i++){
    		if(i=1){
    			var td = $(tr[i]).find("td");
    			for(var j=1;j<14;j++){
    				$(td[j]).html(arrUp[j-1]);
    			}
    		}  
    		if(i=2){
    			var td = $(tr[i]).find("td");
    			for(var j=1;j<14;j++){
    				$(td[j]).html(arrDown[j-1]);
    			}
    		}   
    		if(i=3){
    			var td = $(tr[i]).find("td");
    			for(var j=1;j<14;j++){
    				$(td[j]).html(arrSailOut[j-1]);
    			}
    		}   
    	}
       }
        
    </script> 
</body>
</html>