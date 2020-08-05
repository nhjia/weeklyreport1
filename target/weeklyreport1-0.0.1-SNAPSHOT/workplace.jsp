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
<title>成员周报编辑</title>
</head>
<body>
<%
	Date date1 = new Date();
	session.setAttribute("finished0", "");
	session.setAttribute("finished1", "");
	session.setAttribute("finished2", "");
	session.setAttribute("finished3", "");
	session.setAttribute("finished4", "");
	session.setAttribute("thisdate0", "");
	session.setAttribute("thisdate1", "");
	session.setAttribute("thisdate2", "");
	session.setAttribute("thisdate3", "");
	session.setAttribute("thisdate4", "");
	session.setAttribute("thistask0", "");
	session.setAttribute("thistask1", "");
	session.setAttribute("thistask2", "");
	session.setAttribute("thistask3", "");
	session.setAttribute("thistask4", "");	
	session.setAttribute("prevtask0", "");
	session.setAttribute("prevtask1", "");
	session.setAttribute("prevtask2", "");
	session.setAttribute("prevtask3", "");
	session.setAttribute("prevtask4", "");	
	session.setAttribute("prevdate0", "");
	session.setAttribute("prevdate1", "");
	session.setAttribute("prevdate2", "");
	session.setAttribute("prevdate3", "");
	session.setAttribute("prevdate4", "");
	session.setAttribute("summary", "");
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy w");
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet result = null;
	Usersdata user1 = new Usersdata();
	int i=0;
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/weeklyreport?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=GMT%2B8";
	String user = "root";
	String password = "jnh182516";
	connection = DriverManager.getConnection(url, user, password);
	String sql = "select * from users2 where USER_NAME=? ORDER BY USER_ID DESC";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1,session.getAttribute("username").toString());
	result =preparedStatement.executeQuery();
	session.setAttribute("date1",formatter.format(date1));
	while(result.next()) {
		String entrydate = result.getString(4);
		if(user1.sameweek(date1,formatter.parse(entrydate)) == true){
			session.setAttribute("finished0",result.getString(6));
			session.setAttribute("finished1",result.getString(7));
			session.setAttribute("finished2",result.getString(8));
			session.setAttribute("finished3",result.getString(9));
			session.setAttribute("finished4",result.getString(10));
			session.setAttribute("thisdate0",result.getString(16));
			session.setAttribute("thisdate1",result.getString(17));
			session.setAttribute("thisdate2",result.getString(18));
			session.setAttribute("thisdate3",result.getString(19));
			session.setAttribute("thisdate4",result.getString(20));
			session.setAttribute("thistask0",result.getString(11));
			session.setAttribute("thistask1",result.getString(12));
			session.setAttribute("thistask2",result.getString(13));
			session.setAttribute("thistask3",result.getString(14));
			session.setAttribute("thistask4",result.getString(15));	
			session.setAttribute("summary",result.getString(21));
		}else{
			session.setAttribute("prevtask0",result.getString(11));
			session.setAttribute("prevtask1",result.getString(12));
			session.setAttribute("prevtask2",result.getString(13));
			session.setAttribute("prevtask3",result.getString(14));
			session.setAttribute("prevtask4",result.getString(15));	
			session.setAttribute("prevdate0",result.getString(16));
			session.setAttribute("prevdate1",result.getString(17));
			session.setAttribute("prevdate2",result.getString(18));
			session.setAttribute("prevdate3",result.getString(19));
			session.setAttribute("prevdate4",result.getString(20));
			break;
		}
	}
	}catch (ClassNotFoundException e) {
		 e.printStackTrace();
	} catch (SQLException e){
		 e.printStackTrace();
	} finally {
		try {
			connection.close();
			preparedStatement.close();
			result.close();
		} catch (SQLException e){
			 e.printStackTrace();
		}
	}
%>
	<h1  style="text-align:center">欢迎登录！<%=session.getAttribute("username")%></h1>
	<h3 style="text-align:center"><img src="redball.gif">
	填写进度</h3>
	<form method=post action="Update" style="text-align:center">
	<table align=center border=1>
	<tr>
	<th align=center colspan=2>上周预定完成事项
	<th align=center rowspan=2>本周完成事项
	<th align=center colspan=2>下周预定完成事项
	<th align=center rowspan=2>综合说明
	<tr>
	<th align=center>工作描述<th align=center>预定完成日期
	<th align=center>工作描述<th align=center>预定完成日期
	<% for(int m =0; m<= 4;m++){%>
	<tr>
	<td><%=session.getAttribute("prevtask"+m)%>&nbsp;
	<td><%=session.getAttribute("prevdate"+m)%>&nbsp;
	<td><textarea name=<%=("finished"+m)%> cols=20 rows=3 wrap="virtual"><%=session.getAttribute("finished"+m)%></textarea>
	<td><textarea name=<%=("thistask"+m)%> cols=20 rows=3 wrap="virtual"><%=session.getAttribute("thistask"+m)%></textarea>
	<td><textarea name=<%=("thisdate"+m)%> cols=15 rows=3 wrap="virtual"><%=session.getAttribute("thisdate"+m)%></textarea>
	<% if(m == 0){%>
	<td rowspan=5><textarea name="summary" cols=20 rows=18 wrap="virtual"><%=session.getAttribute("summary")%></textarea>
	<%}%>
	<%}%>
	</table>
	<input type=submit value="送出表单" name="submit">
	<input type=reset  value="恢复原值" name="reset">
	</form>
	<hr>
	<h3 style="text-align:center">1.请务必在每星期日填写完毕。过了星期日，系统自动跳到下一周，就无法再填写本周的进度了。</h3><br>
	<h3 style="text-align:center">2.请务必每一栏都要填写，尤其是「本周预定完成事项」，一定要填入相关的「预定完成时间」。</h3><br>
	<hr>
	<h3  style="text-align:center"><img src="redball.gif">前几周资料列表</h3>
<%session.setAttribute("membername",session.getAttribute("username")); %>
<ul  style="text-align:center">
<li  style="text-align:center;list-style-type:none;">每周填写之资料：
	<a href="listEachweek.jsp?weekDiff=0">本周</a>、
	<a target=_blank href="listEachweek.jsp?weekDiff=-7">前一周</a>、
	<a target=_blank href="listEachweek.jsp?weekDiff=-14">前两周</a>、
	<a target=_blank href="listEachweek.jsp?weekDiff=-21">前三周</a>、
	<a target=_blank href="listEachweek.jsp?weekDiff=-28">前四周</a><br>
</li>
</ul>
</body>
</html>