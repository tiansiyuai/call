<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>查询最近通话记录</title>
    <%--<link rel="stylesheet" type="text/css" href="../css/my.css">--%>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <style type="text/css">
        body{
            background-image: url("../images/1046910.jpg");
        }
        .swap{
            text-align: center;
            margin: 0 auto;
            height: 40px;
            width: 800px;
            position: absolute;
            top: 40%;
            margin-top: -20px;
            left: 50%;
            margin-left: -400px;

        }
        .logo{
            width: 120px;
            height: 55px;
            margin-top: -20px;
        }
        h2{
            margin-bottom: 30px;
            color: #f0ecf3;
            font-weight: bold;
        }
        .searchInput{
            padding-left: 20px;
            width: 30%;
            height: 40px;
            border: 1px solid #1b6d85;
            border-radius: 10px;
            -moz-border-radius:10px;
            -webkit-border-radius:10px;
            font-weight: bold;
        }
        .searchBotton{
            height: 40px;
            width: 100px;
            font-size: 18px;
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
                <li><a href="/callLog/toFindCallLogPage">某段时间</a></li>
                <li class="active"><a href="/callLog/toFindLatestCallLog">最近时间</a></li>
                <li><a href="/callLog/findAll">所有人</a></li>
                <li><a href="/callLog/toStatCallLog">图表分析</a></li>

            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<form action='<c:url value="/callLog/findLatestCallLog" />' method="post">
    <%--<table>--%>
    <%--<tr>--%>
    <%--<td>电话号码 :</td>--%>
    <%--<td><input type="text" name="caller"></td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
    <%--<td colspan="2">--%>
    <%--<input type="submit" value="查询"/>--%>
    <%--</td>--%>
    <%--</tr>--%>
    <%--</table>--%>
    <div class="swap">
        <h2>查询最近通话记录</h2>
        <input type="text" class="searchInput" name="caller" placeholder="输入要查询的手机号"/>
        <input type="submit" class="searchBotton btn btn-primary" value="查询"/>
    </div>
</form>
</body>
</html>