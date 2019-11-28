<%@ page contentType="text/html; charset=utf-8" language="java" %>	
<%@ page import="mingrisoft.*"%>							
<%
	request.setCharacterEncoding("utf-8");	 				//设置编码格式为utf-8
	News News1 = new News();						//创建News实例News1
	String NewsID = request.getParameter("newsId");				//获取newsId的值
	String Action = request.getParameter("Action");				//获取Action的值
	if (Action!=null && Action.equals("Edit"))				//根据Action的值进行逻辑判断
	{
		String [] s = new String[2];					//创建字符串数组
		s[0] = request.getParameter("upd_NewsTitle");			//获取upd_NewsTitle的值
		s[1] = request.getParameter("upd_NewsContent");			//获取upd_NewsContent的值
		String sOK = News1.EditNews(s,NewsID);				//调用数据库的接口方法，修改数据
		if (sOK.equals("Yes")){
	//sOK等于Yes，说明修改成功，跳转到news.jsp页面，提示修改新闻成功
	out.println("<script>alert('修改新闻成功!');location.href='news.jsp';</script>");
			return;
		}
		else {
	//否则，说明修改失败，跳转到news.jsp页面，提示修改新闻失败
	out.println("<script>alert('修改新闻失败!');location.href='news.jsp';</script>");
			return;
		}
	}
%>
