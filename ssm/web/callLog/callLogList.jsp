<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<html>
<head>
    <title>通话记录</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/my.css">
    <script type="text/javascript" src="../js/jquery-3.2.0.min.js"></script>
    <style>
        *{
            background: none;
        }
        body{
            background: #caf0ec;

        }
        .logo{
            width: 120px;
            height: 55px;
            margin-top: -20px;
        }
        .tail{
            text-align: center;
            font-size: 18px;
            font-weight: bold;
        }
        #btnChangeTable, #btnChangeTable1 {
            position: absolute;
            right: 12%;
        }

        #btnCleanTable, #btnCleanTable1{
            position: absolute;
            right: 6%;

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
                <li class="active" ><a href="/callLog/findAll">所有人</a></li>
                <li><a href="/callLog/toStatCallLog">图表分析</a></li>
                <li id="btnChangeTable"><a  href="#" >刷新表格</a></li>
                <li id="btnCleanTable"><a  href="#" >清除表格</a></li>
                <li><a href="callLogList.jsp">跳转测试</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<input id="btnChangeTable1" type="button" class="btn btn-primary" value="刷新表格">
<input id="btnCleanTable1" type="button" class="btn btn-warning" value="清除表格">
<table id="t1" border="1px" class="t-1 " style="width: 800px">
    <caption class="tail">通话记录</caption>
    <thead>
    <tr class="hand">
        <td>电话1</td>
        <td>名称1</td>
        <td>电话2</td>
        <td>名称2</td>
        <td>主(被)叫</td>
        <td>通话时间</td>
        <td>通话时长</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${callLogs}" var="log">
        <tr>
            <td><c:out value="${log.caller}"/></td>
            <td><c:out value="${log.callerName}"/></td>
            <td><c:out value="${log.callee}"/></td>
            <td><c:out value="${log.calleeName}"/></td>
            <td>
                <c:if test="${log.caller == param.caller}">主叫</c:if>
                <c:if test="${log.caller != param.caller}">被叫</c:if>
            </td>
            <td><c:out value="${log.callTime}"/></td>
            <td><c:out value="${log.callDuration}"/></td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="7" style="text-align: right">
        </td>
    </tr>
    </tbody>
</table>
<script type="text/javascript">

    //定义函数
    function refreshTable(){

        $.getJSON("/callLog/json/findAll", function (data) {
            $.each(data, function (i, obj) {
                var str = "<tr><td>" + obj.caller + "</td>";
                str = str + "<td> " + obj.callerName + "</td>";
                str = str + "<td> " + obj.callee + "</td>";
                str = str + "<td> " + obj.calleeName + "</td>";
                str = str + "<td>"  + "</td>";
                str = str + "<td> " + obj.callTime + "</td>";
                str = str + "<td> " + obj.callDuration + "</td>";
                str = str + "</tr>";
                $("#t1 tbody").append(str);
            });
            $("#t1 tbody").append(" <td colspan=\"7\" class=\"last\">\n" +
                "        </td>");
        });
    }

    //        $(function(){
    //            setInterval(refreshTable, 5000);
    //        })
    //    $(document).ready(function(){
    //        refreshTable();
    //    }
    $('#btnChangeTable').click(function () {
        $("#t1 tbody").empty();
        refreshTable();
    });
    $('#btnCleanTable').click(function(){
        $("#t1 tbody").empty();
    });
    $('#btnChangeTable1').click(function () {
        $("#t1 tbody").empty();
        refreshTable();
    });
    $('#btnCleanTable1').click(function(){
        $("#t1 tbody").empty();
    });
    //refreshTable();
    console.log($('#btnChangeTable'));
</script>



</body>
</html>