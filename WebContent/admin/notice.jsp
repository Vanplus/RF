<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="mingrisoft.*"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>RF有限公司</title>
<link rel="stylesheet" href="css/amazeui.min.css" />
<link rel="stylesheet" href="css/admin.css" />
<script src="js/main.js"></script>
<script src="js/notice.js"></script>
</head>
<body style="background-color:#CDDBE8;">
	<header class="am-topbar admin-header" style="background-color:#2167A9;height:60px">
		<div class="am-topbar-brand" style="color:white;font-size:20px">
			<img src="img/logo0.png" width="50px"/><strong>&nbsp;&nbsp;RF科技有限公司</strong> <small>后台管理</small>
		</div>
		<div class="am-collapse am-topbar-collapse"  id="topbar-collapse">
			<ul
				class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
				<li class="am-dropdown" ><a class="am-dropdown-toggle" style="color:white"
					href="login.jsp"> 退出 </a></li>
			</ul>
		</div>
	</header>

	<div class="am-cf admin-main" style="height:760px;background:#CDDBE8;">
		<!-- 注释：左侧菜单 -->
		<div class="admin-sidebar am-offcanvas" style="background-color:#859FCD;margin:10px 10px" id="admin-offcanvas">
			<div class="am-offcanvas-bar admin-offcanvas-bar" style="height:200px">
				<ul class="am-list admin-sidebar-list" >
					<li style="background-color:#859FCD;"><a href="news.jsp" style="color:white"title="新闻管理">
					<img src="img/title1.png" width="25px"/> 新闻管理</a></li>
					<li style="background-color:#859FCD;"><a href="notice.jsp" style="color:white" title="公告管理">
					<img src="img/title2.png" width="25px"/>  公告管理</a></li>
					<li style="background-color:#859FCD;"><a href="adminUser.jsp" style="color:white" title="管理员管理">
					<img src="img/title3.png" width="25px"/> 管理员管理</a></li>
				</ul>
				
			</div>
		</div>
		

		<!-- 注释：公告列表 -->
		<div class="admin-content" style="margin:10px 10px">

			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong>后台管理</strong>/ <strong>公告管理</strong>
				</div>
			</div>

			<div class="am-g">
				<div class="am-u-sm-12 am-u-md-6">
					<div class="am-btn-toolbar">
						<div class="am-btn-group am-btn-group-xs">
							<button type="button" class="am-btn am-btn-warning"
								data-am-modal="{target: '#new-popup'}">
								<span class="am-icon-plus"></span> 添加公告
							</button>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="am-g" style="height: 300px">
				<div class="am-u-sm-12">
					<form class="am-form">
						<table class="am-table am-table-striped am-table-hover table-main">
							<thead>
								<tr>
									<th class="table-id">序号</th>

									<th class="table-title">公告标题</th>
									<th class="table-title">创建人</th>
									<th class="table-author ">创建时间</th>

									<th class="table-author ">操作</th>
								</tr>
							</thead>
							<tbody>
								<%
										request.setCharacterEncoding("UTF-8"); 
									    Notice notice = new Notice();
										String pageNum = request.getParameter("intPage");
										String toPage = request.getContextPath() + request.getServletPath()+ "?";
										String sOK = notice.ListNotice(toPage, pageNum);
										if (sOK.equals("No")) {
											out.println("数据服务器出现错误！");
										} else {
											out.println(sOK);
										}
									%>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			
		</div>
	</div>

	<footer>
		<hr>
		<p style="text-align: center;color:#2167A9" class="am-padding-left">2019 RF科技有限公司</p>
	</footer>

	<div class="am-popup" id="new-popup">
		<div class="am-popup-inner">
			<div class="am-popup-hd">
				<h4 class="am-popup-title">添加公告</h4>
				<span data-am-modal-close class="am-close">&times;</span>
			</div>

			<div class="am-popup-bd">
				<form action="noticeAdd.jsp" method="post" class="am-form"
					id="new-msg">
					<fieldset>
						<div class="am-form-group">
							<label for="doc-vld-ta-2-1"> 公告标题： </label> <input
								name="NoticeTitle" type="text" maxlength="32"
								placeholder="请输入公告标题" data-validation-message="不能为空" required />
						</div>
						<div class="am-form-group">
							<label for="doc-vld-ta-2-1"> 公告内容： </label>
							<textarea name="NoticeContent" cols="30" rows="10"
								placeholder="请输入公告内容。段落间请用#分隔。" data-validation-message="不能为空"
								required></textarea>
						</div>

						<input name="Action" type="hidden" value="Add">

						<button class="am-btn am-btn-secondary" type="submit">提交
						</button>
						<button onclick='javascript:$("#new-popup").modal("close");'
							class="am-btn am-btn-secondary" type="button">关闭</button>
					</fieldset>
				</form>
			</div>

		</div>
	</div>

	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
		<div class="am-modal-dialog">
			<div class="am-modal-bd">确定要删除当前主题吗？</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>

	<div class="am-popup" id="edit-popup">
		<div class="am-popup-inner">
			<div class="am-popup-hd">
				<h4 class="am-popup-title">修改公告</h4>
				<span data-am-modal-close class="am-close">&times;</span>
			</div>

			<div class="am-popup-bd">
				<form action="noticeEdit.jsp" method="post" class="am-form"
					id="edit-msg">
					<fieldset>
						<div class="am-form-group">
							<label for="doc-vld-ta-2-1"> 公告标题： </label> <input
								id="upd_NewsTitle" name="upd_NewsTitle" type="text"
								maxlength="32" placeholder="请输入新闻标题"
								data-validation-message="不能为空" required />
						</div>
						
						<div class="am-form-group">
							<label for="doc-vld-ta-2-1"> 公告内容： </label>
							<textarea id="upd_NewsContent" name="upd_NewsContent" cols="30"
								rows="10" placeholder="请输入新闻内容" data-validation-message="不能为空"
								required></textarea>
						</div>

						<input name="Action" type="hidden" value="Edit"> <input
							id="noticeId" name="noticeId" type="hidden" value="">

						<button class="am-btn am-btn-secondary" type="submit">提交
						</button>
						<button onclick='javascript:$("#edit-popup").modal("close");'
							class="am-btn am-btn-secondary" type="button">关闭</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>
