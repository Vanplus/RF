<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="mingrisoft.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	Notice notice = new Notice();
	String Action = request.getParameter("Action");

	if (Action != null && Action.equals("Add")) {
		String[] s = new String[2];
		s[0] = request.getParameter("NoticeTitle");
		s[1] = request.getParameter("NoticeContent");
		String sNews = notice.AddNotice(s);
		if (sNews.equals("Yes")) {
			out.print("<script>alert('添加公告成功!');location.href='notice.jsp';</script>");
			return;
		} else {
			out.print("<script>alert('添加公告失败!');location.href='notice.jsp';</script>");
			return;
		}
	}
%>