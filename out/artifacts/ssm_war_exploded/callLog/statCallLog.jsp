<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>通话记录统计结果</title>
    <%--<link rel="stylesheet" type="text/css" href="../css/my.css">--%>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <style>
        body{
            background: url("../images/1089891.jpg");
        }
        form{
            border-radius: 15px;
            text-align: center;
            position: absolute;
            margin-left: 200px;
            width: 35%;
            height: 300px;
            top: 100px;
            /*background-color: #2e6da4;*/
            background: #b8926e;
            background-size: 300px 500px;
        }
        .logo{
            width: 120px;
            height: 55px;
            margin-top: -20px;
        }
        #main{
            width:600px;
            height:400px;
            position: absolute;
            right: 10%;
            top: 50px;
            border-radius: 20px;
        }
        h2{
            margin-bottom: 30px;
            font-weight: bold;
        }
        .item{
            position: relative;
            margin-bottom: 20px;
            width: 80%;
            height: 40px;
            text-align: center;
            left: 18%;
        }
        label{
            line-height: 40px;
            /*font-size: 18px;*/
        }
        .form-control{
            width: 60%;
        }

        footer {
            margin-top: -160px;
            height: 100px;
            background: #222222;
            color: #ffffff;
            padding-top: 80px;
            text-align: center;
            position: absolute;
            bottom: 0px;
            clear: both;
            display: block;
            z-index: 101;
            width: 100%;
        }
        p {
            margin: 0 0 10px;
            position: absolute;
            bottom: 20px;
            width: 100%;
        }
    </style>
    <script src="../js/jquery-3.2.0.min.js"></script>
    <script src="../js/echarts.js"></script>
    <script>
        $(function () {
            var myChart = echarts.init(document.getElementById('main'));
            var option = {
                title: {
                    text: '<c:out value="${title}" />'
                },
                backgroundColor: '#cacab0',//背景色
                tooltip: {},
                legend: {
                    data: ['通话次数']
                },
                toolbox: {
                    show : true,
                    feature : {
                        dataView : {show: true, readOnly: false},
                        magicType : {show: true, type: ['line', 'bar']},
                        restore : {show: true},
                    }
                },
                xAxis: {
                    data: [<c:forEach items="${list}" var="e">'<c:out value="${e.yearMonth}"/>',</c:forEach>]
                },
                yAxis: {},
                series: [{
                    name: '通话次数',
                    type: 'bar',
                    data: [<c:forEach items="${list}" var="e"><c:out value="${e.count}"/>, </c:forEach>]
                }]
            };
            myChart.setOption(option);
        })
    </script>
</head>
<body>
<nav class="navbar  navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/"><img src="../images/logo.jpg" class="logo"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="/">首页 <span class="sr-only">(current)</span></a></li>
                <li><a href="/callLog/toFindCallLogPage">某段时间</a></li>
                <li><a href="/callLog/toFindLatestCallLog">最近时间</a></li>
                <li><a href="/callLog/findAll">所有人</a></li>
                <li class="active"><a href="/callLog/toStatCallLog">图表分析</a></li>

            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<form action='<c:url value="/callLog/statCallLog" />' method="post">

    <h2>按年份查询</h2>
    <div class="form-group item">
        <label for="inputPassword3" class="col-sm-3 control-label">电话号码</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="inputPassword3" name="caller" placeholder="电话号码">
        </div>
    </div>
    <div class="form-group item">
        <label for="inputPassword3" class="col-sm-3 control-label"> 年 份: </label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="inputPassword3" name="year" placeholder="年 份">
        </div>
    </div>
    <input type="submit" name="查询" class="btn btn-primary">
</form>

<div id="main" >
</div>

<footer>
    <p>南阳理工学院软件学院云计算工作室 &copy; 2017 版权所有 </p>
</footer>
</body>
</html>