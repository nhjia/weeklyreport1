<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>周报登录系统</title>
</head>
<body>
<h1 style="text-align:center">周报系统</h1>
<form action="Verification" method=post style="text-align:center">
		姓名：<input type="text" required="true" name="name"><br>
		密码：<input type="password"  required= "true" name="password"><br>
		&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<input type="submit" value="登录"  name="denglu">
		<input type="submit" value="注册" name="zhuce">
		<input type="submit" value="管理员登录"  name="manger">
	</form>
	<h3 style="text-align:center">*提示：管理员账号需后台更改<br>
	默认管理员账号：李四<br>
	管理员密码：123</h3>
</body>
</html>