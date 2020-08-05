<%@page import="java.util.Date"%>
<%@page import="users.Usersdata"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成员周报汇总</title>
</head>
<body>
	<h1 style="text-align:center">成员工作周报汇总</h1>
	<hr>
	<h3><img src="redball.gif">填写进度</h3>
<script type="text/javascript">
function submitForm(){
//获取form表单对象
var form = document.getElementById("myform");
form.submit();//form表单提交
}
</script>
<form id="myform" action="Informationchose" method=post style="text-align:center">
<select name="person" onChange="submitForm()">
<option>==成员选择== </option>
<%
Connection connection = null;
PreparedStatement preparedStatement = null;
ResultSet result = null;
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/weeklyreport?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=GMT%2B8";
	String user = "root";
	String password = "jnh182516";
	connection = DriverManager.getConnection(url, user, password);
	String sql = "select * from users1";
	preparedStatement = connection.prepareStatement(sql);
	result =preparedStatement.executeQuery();
	while(result.next()) {
		String  name = result.getString(2);
%>
	<option	value=<%=name%>><%=name%></option>
<%
	}
	}catch (ClassNotFoundException e) {
		 e.printStackTrace();
	} catch (SQLException e){
		 e.printStackTrace();
	}finally {
		try {
			connection.close();
			preparedStatement.close();
			result.close();
		} catch (SQLException e){
			 e.printStackTrace();
		}
	}
%>
</select>
</form>
<ol>
<li><b>请务必在每星期日前填写完毕。过了星期日午夜，系统自动跳到下一周，就无法再填写本周的进度了。</b>
<li><b>请务必每一栏都要填写，尤其是「本周预定完成事项」，一定要填入相关的「预定完成时间」。</b>
</ol>
<hr>
<h3><img src="redball.gif">
资料列表</h3>
<ul>
<li>成员姓名：<%=session.getAttribute("membername") %>
<li>历史资料：<a target=_blank href="listpersonAlldate.jsp?"><%=session.getAttribute("membername") %></a>
<li>每周填写之资料：
	<a target=_blank href="listEachweek.jsp?weekDiff=0">本周</a>、
	<a target=_blank href="listEachweek.jsp?weekDiff=-7">前一周</a>、
	<a target=_blank href="listEachweek.jsp?weekDiff=-14">前两周</a>、
	<a target=_blank href="listEachweek.jsp?weekDiff=-21">前三周</a>、
	<a target=_blank href="listEachweek.jsp?weekDiff=-28">前四周</a><br>
<li><a target=_blank href="listAllPersonLastRecord.jsp">每个人的最後一笔资料</a>
</ul>
<hr>
<h3><img src="redball.gif">
管理员使用说明</h3>
<ol>
<li>选择成员名字继而选择查询对象；
<li>根据成员选择他的个人记录以及前几周的记录
<li>最后一项为每个人的最后一笔资料
</ol>
</body>
</html>