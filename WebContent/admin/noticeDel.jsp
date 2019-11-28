<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="mingrisoft.*"%>
<%
	Notice notice = new Notice();
	String IP = request.getRemoteAddr(); //得到客户端Ip地址
	String AdminName = (String) session.getAttribute("AdminName");
	String NewsID = request.getParameter("NewsID");

	if (notice.DelNotice(NewsID))
		out.print("<script>alert('删除公告成功!');location.href='notice.jsp';</script>");
	else {
		out.print("<script>alert('删除公告失败!');location.href='notice.jsp';</script>");
	}
%>
