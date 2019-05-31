<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>查询通话记录</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <%--<link rel="stylesheet" type="text/css" href="../css/my.css">--%>
    <style>
        body{
            background: url("../images/790338.jpg") no-repeat;
        }
        form{
            margin: 0 auto;
            text-align: center;
        }
        .logo{
            width: 120px;
            height: 55px;
            margin-top: -20px;
        }
        .swap{
            width: 500px;
            height: 300px;
            /*background-color: #2e6da4;*/
            position: absolute;
            right: 7%;
            top: 50%;
            margin-left: -250px;
            margin-top: -150px;
            text-align: center;
            background: #d2b384;
            border-radius: 10px;
        }
        h3{
            margin-bottom: 30px;

        }
        .item:first-child{
            margin-top: 100px;
        }
        .item{
            position: relative;
            margin-bottom: 10px;
            text-align: center;
            left: 14%;
            /*margin-left: -255px;*/
        }
        .form-group{
            margin-left: 10px;
        }
        .form-control{
            width: 70%;
        }
    </style>
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
                <li class="active"><a href="/callLog/toFindCallLogPage">某段时间</a></li>
                <li><a href="/callLog/toFindLatestCallLog">最近时间</a></li>
                <li><a href="/callLog/findAll">所有人</a></li>
                <li><a href="/callLog/toStatCallLog">图表分析</a></li>

            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<form action='<c:url value="/callLog/findCallLog" />' method="post" class="form-horizontal">

    <div class="swap">8//
        <h3>查询通话记录</h3>
        <div class="form-group item">
            <label for="inputPassword3" class="col-sm-2 control-label">电话号码</label>
            <div class="col-sm-10">
                <input type="text" name="caller" class="form-control" id="inputPassword" placeholder="电话号码" >
            </div>
        </div>
        <div class="form-group item">
            <label for="inputPassword3" class="col-sm-2 control-label">起始时间</label>
            <div class="col-sm-10">
                <input type="text" name="startTime" class="form-control" id="inputPassword2" placeholder="起始时间" >
            </div>
        </div>
        <div class="form-group item">
            <label for="inputPassword3" class="col-sm-2 control-label">结束时间</label>
            <div class="col-sm-10">
                <input type="text" name="endTime" class="form-control" id="inputPassword3" placeholder="结束时间">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">查询</button>
            </div>
        </div>
    </div>


</form>
</body>
</html>