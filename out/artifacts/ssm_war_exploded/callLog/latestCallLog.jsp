<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>通话记录</title>
    <link rel="stylesheet" type="text/css" href="../css/my.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">

    <style>
        .logo{
            width: 120px;
            height: 55px;
            margin-top: -20px;
        }
        .waring{
            margin: 0 auto;
            display: block;
            text-align: center;
            position: absolute;
            left: 50%;
            top: 50%;
            font-size: 36px;
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
                <li><a href="/callLog/toFindLatestCallLog">最近时间</a></li>
                <li><a href="/callLog/findAll">所有人</a></li>
                <li><a href="/callLog/toStatCallLog">图表分析</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<c:if test="${log == null}">
    <p class="waring">无记录</p>
</c:if>
<c:if test="${log != null}">
    <table id="t1" border="1px" class="t-1" style="width: 800px">
        <tr>
            <td>电话1</td>
            <td><c:out value="${log.caller}" /></td>
        </tr>
        <tr>
            <td>电话2</td>
            <td><c:out value="${log.callee}"/></td>
        </tr>
        <tr>
            <td>时间</td>
            <td><c:out value="${log.callTime}"/></td>
        </tr>
        <tr>
            <td>时长</td>
            <td><c:out value="${log.callDuration}"/></td>
        </tr>

    </table>
</c:if>

</body>
</html>