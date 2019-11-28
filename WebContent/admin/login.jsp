<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="mingrisoft.*"%>
<%
	request.setCharacterEncoding("utf-8");						//设置编码方式为utf-8
	String Action = request.getParameter("Action");             //判断是否单击“登录”按钮
	if(Action!=null && Action.equals("Login")){					//通过Action的值进行逻辑判断
		String User = request.getParameter("User");     	    //获取登录用户名
		String Pwd = request.getParameter("Pwd");               //获取登录密码
		out.println("<script>alert('"+User+"');</script>");
		out.println("<script>alert('"+Pwd+"');</script>");
		Login login = new Login();                     			//新建登录类Login
		boolean isOK=login.LoginCheck(User,Pwd);       	 		//调用方法LoginCheck	
		if(isOK){
		//如果isOK=true,说明验证成功		
		out.println("<SCRIPT LANGUAGE='JavaScript'>alert('登录成功！');location.href='news.jsp';</SCRIPT>");
		}else{
		//如果isOK=false,说明验证失败，失败仍留在login.jsp页面
		out.println("<SCRIPT LANGUAGE='JavaScript'>alert('登录失败！');location.href='login.jsp';</SCRIPT>");
			}
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>后台登录-RF科技有限公司</title>
<!--注释：引入样式-->
<link rel="stylesheet" href="css/amazeui.min.css" />
<!--注释：引入特效-->
<script src="js/main.js"></script>
</head>
<!--注释：引入背景图-->
<body style="background: url(img/login-bg.png) no-repeat">
	<!--注释：公司标题图片-->
	<div class="header" style="text-align: center; margin-top: 100px">
		<div class="am-g">
			<!--注释：引入logo样式-->
			<img src="img/loginTitle1.png" />
		</div>
	</div>
	<!--注释：登录框-->
	<div class="am-g" style="margin-top: 20px">
		<div class="am-u-lg-6  am-u-md-10  am-u-sm-centered"
		style="background: url(img/loginForm.png) no-repeat; height: 479px; width: 695px">
			<!--注释：登录表单-->
			<form action="login.jsp" method="post" class="am-form login-form"
				style="padding: 50px 0px 0px 120px; width: 550px"
				onSubmit="return LoginCheck()">
				<!--注释：用户名和密码的表单样式-->
				<label for="name"> 用户名: </label> <input type="text" name="User"
					id="User" value=""> <br> <label for="ps"> 密码:</label>
				<input type="password" name="Pwd" id="Pwd" value=""> <br>
				<!--注释：登录按钮-->
				<div class="am-cf">
					<input name="Action" type="hidden" value="Login"> <input
						type="submit" value="登 录" id="save"
						style="width: 100%; border-radius: 0.5em;"
						class="am-btn am-btn-primary am-btn-sm am-round">
				</div>
			</form>
		</div>
	</div>
</body>
</html>
