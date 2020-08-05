package cn.weeklyreport.servlet;

import java.io.IOException;
import java.util.Formatter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import users.Usersdata;

public class Update extends HttpServlet{
	Usersdata user = new Usersdata();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		HttpSession session = req.getSession();
		req.setCharacterEncoding("utf-8");
		String method1 = req.getParameter("submit");
		String method2 = req.getParameter("reset");
		String name = session.getAttribute("username").toString();
		String date = session.getAttribute("date1").toString();
		String finshed0 = req.getParameter("finished0");
		String finshed1 = req.getParameter("finished1");
		String finshed2 = req.getParameter("finished2");
		String finshed3 = req.getParameter("finished3");
		String finshed4 = req.getParameter("finished4");
		String thistask0 = req.getParameter("thistask0");
		String thistask1 = req.getParameter("thistask1");
		String thistask2 = req.getParameter("thistask2");
		String thistask3 = req.getParameter("thistask3");
		String thistask4 = req.getParameter("thistask4");
		String thisdate0 = req.getParameter("thisdate0");
		String thisdate1 = req.getParameter("thisdate1");
		String thisdate2 = req.getParameter("thisdate2");
		String summary = req.getParameter("summary");
		String thisdate3 = req.getParameter("thisdate3");
		String thisdate4 = req.getParameter("thisdate4");
		if(method1 !=null) {		
			user.update(name, date,finshed0,finshed1,finshed2,finshed3,finshed4,thistask0,thistask1,thistask2,thistask3,
					thistask4, summary,thisdate0,thisdate1,thisdate2,thisdate3,thisdate4);
			resp.getWriter().write("更新成功,2秒后跳转");
			resp.setHeader("refresh", "2;url=http://localhost:8888/weeklyreport1/workplace.jsp");
		}
	}
}
