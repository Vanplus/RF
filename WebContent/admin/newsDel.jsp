<%@ page contentType="text/html; charset=utf-8" language="java"%><!--编码格式为utf-8-->
<%@ page import="mingrisoft.*"%>
<%
		News News1 = new News();							// 创建News实例New1
		String NewsID = request.getParameter("NewsID");    				//获取新闻记录唯一主键
		if (News1.DelNews(NewsID))							//将数据提交给后台，获取返回值
			//若结果值为true，则跳转news.jsp页面 ，提示删除新闻成功
			out.print("<script>alert('删除新闻成功!');location.href='news.jsp';</script>");
		else {
			//若结果值为flase，则跳转news.jsp页面 ，提示删除新闻失败
			out.print("<script>alert('删除新闻失败!');location.href='news.jsp';</script>");
		}
	%>
