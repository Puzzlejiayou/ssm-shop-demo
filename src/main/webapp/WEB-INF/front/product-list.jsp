<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<c:if test="${sessionScope.user!=null}"><a href="userOrder.do?uid=${sessionScope.user.uid}">我的订单</a>&nbsp;用户:${sessionScope.user.uname}&nbsp;&nbsp;<a href="updateUserPage.do">更新个人信息</a><a href="updatePwdPage.do">修改密码</a><a href="logout.do">注销</a></c:if>
		<c:if test="${sessionScope.user==null}">
			<button type="button" class="btn btn-default" onclick="window.location.href='login.do'">登录</button>
			<button type="button" class="btn btn-default" onclick="window.location.href='reg.do'">注册</button>
			<button type="button" class="btn btn-default" onclick="window.location.href='backLoginPage.do'">管理员登录</button>
		</c:if>
	</div>
	<div class="navbar">
		<div class="searchBook">
			<form method="post" action="productList.do">
				查找书籍：<input  type="text" class="text" name="key" placeholder="请输入商品关键字"  /> <input class="btn btn-info" type="submit" name="submit" value="搜索" />
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
			<li><a href="productList.do?type=${bt}" >${bt}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<div id="main" class="wrap">
	<div class="lefter">
		<div class="box">
			<h2>图书分类</h2>
			<c:forEach items="${bts}" var="bt">
			<dl>
				<dd><a href="productList.do?type=${bt}" >${bt}</a></dd>
			</dl>
			</c:forEach>
		</div>
		<div class="spacer"></div>
		<div class="last-view">

		</div>
	</div>
	<div class="main">
		<div class="product-list">
			<h2>全部商品</h2>
			<div class="clear"></div>
			<ul class="product clearfix">
				<c:forEach items="${books}" var="book">
				<li>
					<dl>
						<dt><a href="bookView.do?bid=${book.bid}" target="_blank"><img src="<%=basePath %>images/product/${book.image}" /></a></dt>
						<dd class="title"><a href="bookView.do?bid=${book.bid}" target="_blank">${book.bname}</a></dd>
						<dd class="price">￥${book.pirce}</dd>
					</dl>
				</li>
				</c:forEach>
			</ul>
			<div class="clear"></div>
			<div class="pager">
					<ul class="clearfix">
						<c:choose>
							<c:when test="${pageInfo.hasPreviousPage}">
								<li><a href="productList.do?pageNum=1">首页</a></li>
								<li><a href="productList.do?pageNum=${pageInfo.prePage }">上一页</a></li>
							</c:when>
							<c:otherwise>
								<li><span>首页</span></li>
								<li><span>上一页</span></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="index" begin="1" end="${pageInfo.pages }">

							<li
								<c:if test="${index==pageInfo.pageNum}">class="current"</c:if>><a
								href="productList.do?pageNum=${index }">${index }</a></li>
						</c:forEach>

						<c:choose>
							<c:when test="${pageInfo.hasNextPage}">
								<li><a href="productList.do?pageNum=${pageInfo.nextPage }">下一页</a></li>
								<li><a href="productList.do?pageNum=${pageInfo.pages }">尾页</a></li>
							</c:when>
							<c:otherwise>
								<li><span>下一页</span></li>
								<li><span>尾页</span></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
</body>
</html>
