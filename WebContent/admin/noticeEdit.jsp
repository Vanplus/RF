<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="mingrisoft.*"%>
<%
	request.setCharacterEncoding("utf-8"); 				//设置编码方式为utf-8
	Notice notice = new Notice();
	String[] sa = null;
	String id = request.getParameter("noticeId");
	String Action = request.getParameter("Action");
	if (Action != null && Action.equals("Edit")) {
		String[] s = new String[2];
		s[0] = request.getParameter("upd_NewsTitle");
		s[1] = request.getParameter("upd_NewsContent");

		String sOK = notice.EditNotice(s, id);
		if (sOK.equals("Yes")) {
			out.println("<script>alert('修改公告成功!');location.href='notice.jsp';</script>");
			return;
		} else {
			out.println("<script>alert('修改公告失败!');location.href='notice.jsp';</script>");
			return;
		}
	}
%>
