	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<%@ page import="mingrisoft.*"%>
	
	<!DOCTYPE html>
	<html>
	<!--注释：头部-->
	<head>
	<meta charset="UTF-8">
	<!--注释：网站标题-->
	<title>明日科技有限公司</title>
	<!--注释：引入网站的样式-->
	<link type="text/css" href="css/style.css" rel="stylesheet">
	<!--注释：引入网站的特效-->
	<script type=" text/JavaScript" src="js/fwslider.js"></script>
	</head>
	<!--注释：头部结束-->
	<!--注释：身体-->
	<body>
		<div class="bgStyle">
			<div class="header">
				<!--注释：引入logo图片-->
				<div class="logo">
					<a href="index.jsp"><img src="img/logo1.png" alt=""> </a>
				</div>
				<div class="pull-icon"><a id="pull"></a></div>
				<!--注释：生成菜单布局-->
				<div class="cssmenu">
					<ul>
						<li><a href="index.html">首页</a></li>
						<li><a href="about.html">公司简介</a></li>
						<li><a href="noticeFrontList.jsp">公告</a></li>
						<li><a href="newsFrontList.jsp">新闻</a></li>
						<li><a href="product.html">产品介绍</a></li>
						<li class="last"><a href="contact.html">联系我们</a></li>
					</ul>
				</div>
				<!--清除浮动-->
				<div class="clear"></div>
			</div>
		</div>
		<!--注释：顶部banner图片-->
		<div class="second_banner">
			<img src="img/news.jpg">
		</div>
			
			
			
			<div class="container">
			<div class="left">
				<div class="menu_plan">
					<div class="menu_title">
						公司动态<br> <span>news of company</span>
					</div>
					<ul id="tab">
						<li><a href="#">公司新闻</a></li>
					</ul>
				</div>
			</div>
			<div class="right">
				<div class="location">
					<span>当前位置：<a href="JavaScript:void(0)" id="a"><a href="#">公司新闻</a></a></span>
					<div class="brief" id="b">
						<a href="#">公司新闻</a>
					</div>
				</div>
				<div style="font-size: 14px; margin-top: 53px; line-height: 36px;">
					<div id="tab_con">
						<div id="tab_con_2" class="dis-n" style="display: none;">
							<div class="content_main">
		<%
		request.setCharacterEncoding("utf-8"); 					//设置编码格式utf-8
		News news = new News();							//创建新闻类News实例news
		String newsId = request.getParameter("newsId");				//获取newsId的值
		//获取分页跳转的页面URL
		String sPage = request.getContextPath() + request.getServletPath()+ "?";	
		String sOK = news.FrontNewsDetail(newsId);				//调用数据库接口方法，获取详情数据
		if (sOK.equals("No")) {							//根据sOK的值进行逻辑判断
			out.println("数据服务器出现错误！");				//出现异常，打印异常信息
		} else {					
			out.println(sOK);						//成功的话，页面输出新闻详情数据
			}
		%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
			





		<div class="bottom">
			<div class="footer">
				<div class="address">
					Copyright 2019 RF科技有限公司
		<!-- <script	src="http://s139.cnzz.com/stat.php?id=844254&amp;web_id=844254&amp;show=pic2"
						language="JavaScript" charset="gb2312"></script>
				<br> 吉ICP备10002740号-2 &nbsp;&nbsp;吉公网安备 22010202000132号 <br>
				<a href="http://www.mingrisoft.com">吉林省明日科技有限公司</a> 技术支持 <a
						href="../admin/login.jsp">后台</a> -->
				</div>
			</div>
		</div>
	</body>
	</html>
