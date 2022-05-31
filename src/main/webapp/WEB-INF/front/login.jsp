<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../static/head.jsp"/>
</head>
<body>
<div id="header" class="wrap">
    <div id="logo"><img src="<%=basePath %>images/logo3.jpeg" /></div>
    <div class="help">
        <c:if test="${sessionScope.user!=null}"><a href="cartPage.do" class="shopping">查看购物车</a></c:if>
        <c:if test="${sessionScope.user!=null}"><a
                href="userOrder.do?uid=${sessionScope.user.uid}">我的订单</a>&nbsp;用户:${sessionScope.user.uname}&nbsp;&nbsp;<a href="updateUserPage.do">更新个人信息</a><a href="updatePwdPage.do">修改密码</a><a href="logout.do">注销</a></c:if>
        <c:if test="${sessionScope.user==null}">
            <button type="button" class="btn btn-default" onclick="window.location.href='login.do'">登录</button>
            <button type="button" class="btn btn-default" onclick="window.location.href='reg.do'">注册</button>
            <button type="button" class="btn btn-default" onclick="window.location.href='backLoginPage.do'">管理员登录</button>
        </c:if>
    </div>
    <div class="navbar">
        <div class="searchBook">
            <form method="post" action="productList.do">
                查找书籍：<input type="text" class="text" name="key" placeholder="请输入商品关键字"/> <input class="btn btn-info"
                                                                                                type="submit"
                                                                                                name="submit"
                                                                                                value="搜索"/>
            </form>
            <form method="post" action="productList.do">
                价格区间：<input  type="text" class="text" name="min" placeholder="最低价" style="width: 20%"  /> <input  type="text" class="text" name="max" placeholder="最高价" style="width: 20%" />  <input class="btn btn-info" type="submit" name="submit" value="搜索" />
            </form>
        </div>
    </div>
</div>
<div id="childNav">
    <div class="wrap">
        <ul class="clearfix">
            <li><a href="index.do" >首页</a></li>
            <c:forEach items="${bts}" var="bt">
                <li><a href="productList.do?type=${bt}">${bt}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>
<div id="register" class="wrap">
    <div class="shadow">
        <div class="box">
            <h1>欢迎登录eShop</h1>
            <form id="loginForm">
                <table>
                    <tr>

                        <td class="field">用户名：</td>
                        <td><input class="text form-control" type="text" name="userName" id="userName"/></td>
                    </tr>
                    <tr>
                        <td class="field">登录密码：</td>
                        <td>
                            <input class="text form-control" type="password" name="passWord" id="passWord"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input class="btn btn-success" type="button" id="submit" value="登录"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="clear"></div>
</div>
<script src="../../js/login.js"></script>
</body>
</html>

