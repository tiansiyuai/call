<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>index</title>
  <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
  <style>
    body{
      /*overflow: hidden;*/
    }
    .navbar{
      z-index: 100;
      margin: 0;
    }
    .container{
      width: 100%;
      height: 800px;
      background: url("./images/595465.jpg") no-repeat;
      background-size: 100% 80%;
      background-position: top right;


    }
    .logo{
      width: 120px;
      height: 55px;
      margin-top: -20px;
    }
    .sidebar1{
      position: absolute;
      top: 100px;
      border-radius: 100%;
      width: 300px;
      height: 200px;

    }
    .sidebar2{
      position: absolute;
      border-radius: 100%;
      width: 300px;
      height: 200px;
      left: 400px;
      top: 260px;

    }
    .sidebar3{
      position: absolute;
      left: 100px;
      top: 460px;
      border-radius: 100%;
      width: 300px;
      height: 200px;

    }
    .sidebar1:hover{

    }
    footer{
      margin-top: -160px;
      height: 160px;
      background: #222222;
      color: #ffffff;
      padding-top: 80px;
      text-align: center;
    }
    .jumbotron {
      position: absolute;
      width: 400px;
      height: 600px;
      right: 30px;
      top: 70px;

      background: #ecaa64;
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
      <a class="navbar-brand" href="#"><img src="./images/logo.jpg" class="logo"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/">首页 <span class="sr-only">(current)</span></a></li>
        <li><a href="/callLog/toFindCallLogPage">某段时间</a></li>
        <li><a href="/callLog/toFindLatestCallLog">最近时间</a></li>
        <li><a href="/callLog/findAll">所有人</a></li>
        <li><a href="/callLog/toStatCallLog">图表分析</a></li>

      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="container">
  <img src="../images/side.jpg" class="sidebar1">
  <img src="../images/side2.jpg" class="sidebar2">
  <img src="../images/side3.jpg" class="sidebar3">
  <div class="right">
    <div class="jumbotron">
      <h1>Call Log!</h1>
      <p><a class="btn btn-primary btn-lg" href="/callLog/toFindCallLogPage" role="button">查询某段时间通话记录</a></p>
      <p><a class="btn btn-info btn-lg" href="/callLog/toFindLatestCallLog" role="button">查询最近时间通话记录</a></p>
      <p><a class="btn btn-warning btn-lg" href="/callLog/findAll" role="button">查询所有人的通话记录</a></p>
      <p><a class="btn btn-success btn-lg" href="/callLog/toStatCallLog" role="button">图表分析某人通话记录</a></p>
      <p><a class="btn btn-danger btn-lg" href="/" role="button">首页</a></p>
    </div>
  </div>
</div>
<footer>
  <p>&copy; 2017 版权所有 By 南阳理工学院软件学院   云计算工作室 </p>
</footer>
</body>

</html>