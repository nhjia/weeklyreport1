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
<title>
<%=session.getAttribute("membername") %>的<%if(Integer.parseInt(request.getParameter("weekDiff")) == 0){%>
本周周报
<%}else if(Integer.parseInt(request.getParameter("weekDiff")) == -7){%>
前一周周报
<%}else if(Integer.parseInt(request.getParameter("weekDiff")) == -14){%>
前两周周报
<%}else if(Integer.parseInt(request.getParameter("weekDiff")) == -21){%>
前三周周报
<%}else if(Integer.parseInt(request.getParameter("weekDiff")) == -28){%>
前四周周报
<%}%>
</title>
</head>
<body>
<%
	Calendar c = Calendar.getInstance();
	c.setTime(new Date());
	c.add(Calendar.DATE,Integer.parseInt(request.getParameter("weekDiff")));
	Date date1 = c.getTime();
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
	preparedStatement.setString(1,session.getAttribute("membername").toString());
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
	<h1  style="text-align:center"><%=session.getAttribute("membername")%>
	的<%if(Integer.parseInt(request.getParameter("weekDiff")) == 0){%>
	本周周报
	<%}else if(Integer.parseInt(request.getParameter("weekDiff")) == -7){%>
	前一周周报
	<%}else if(Integer.parseInt(request.getParameter("weekDiff")) == -14){%>
	前两周周报
	<%}else if(Integer.parseInt(request.getParameter("weekDiff")) == -21){%>
	前三周周报
	<%}else if(Integer.parseInt(request.getParameter("weekDiff")) == -28){%>
	前四周周报
	<%}%>
	</h1>
	<h3 style="text-align:center"><img src="redball.gif">
	填写进度</h3>
	<form method=post action="Update" style="text-align:center">
	<table align=center border=1>
	<tr>
	<th align=center rowspan=2><%if(Integer.parseInt(request.getParameter("weekDiff")) == 0){%>
	本周完成事项
	<%}else if(Integer.parseInt(request.getParameter("weekDiff")) == -7){%>
	前一周完成事项
	<%}else if(Integer.parseInt(request.getParameter("weekDiff")) == -14){%>
	前两周完成事项
	<%}else if(Integer.parseInt(request.getParameter("weekDiff")) == -21){%>
	前三周完成事项
	<%}else if(Integer.parseInt(request.getParameter("weekDiff")) == -28){%>
	前四周完成事项
	<%}%>
	<th align=center colspan=2>下周预定完成事项
	<th align=center rowspan=2>综合说明
	<tr>
	<th align=center>工作描述<th align=center>预定完成日期
	<% for(int m =0; m<= 4;m++){%>
	<tr>
	<td><textarea name=<%=("finished"+m)%> cols=20 rows=3 wrap="virtual" readOnly="true"><%=session.getAttribute("finished"+m)%></textarea>
	<td><textarea name=<%=("thistask"+m)%> cols=20 rows=3 wrap="virtual" readOnly="true"><%=session.getAttribute("thistask"+m)%></textarea>
	<td><textarea name=<%=("thisdate"+m)%> cols=15 rows=3 wrap="virtual" readOnly="true"><%=session.getAttribute("thisdate"+m)%></textarea>
	<% if(m == 0){%>
	<td rowspan=5><textarea name="summary" cols=20 rows=18 wrap="virtual" readOnly="true"><%=session.getAttribute("summary")%></textarea>
	<%}%>
	<%}%>
	</table>
	</form>
</body>
</html>