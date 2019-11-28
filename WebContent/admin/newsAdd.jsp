<%@ page contentType="text/html; charset=utf-8" language="java" %>	
	<%@ page import="mingrisoft.*"%>									
	
	<%
		request.setCharacterEncoding("utf-8");	 			
		News news1 = new News();
		String Action = request.getParameter("Action");
		
		if (Action!=null && Action.equals("Add"))
		{
			String [] s = new String[2];                   	 	//创建字符串数组
			s[0] = request.getParameter("NewsTitle");	    	//获取新闻标题	
			s[1] = request.getParameter("NewsContent"); 		//获取新闻内容
			String result = news1.AddNews(s);	            	//将新闻记录数据提交给后台
			if (result.equals("Yes"))	{			//根据返回的结果判断页面走向
			//新闻添加成功则跳转到news.jsp页面
			out.print("<script>alert('添加新闻成功!');location.href='news.jsp';</script>");
			return;										
			}
			else {
			//新闻添加失败,仍跳转到news.jsp ,然后通知用户添加新闻失败
			out.print("<script>alert('添加新闻失败!');location.href='news.jsp';</script>");
			return;
			}
		}
	%>
