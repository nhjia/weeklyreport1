package cn.weeklyreport.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import users.Function;
import users.Users;

public class Verification extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Function function =new Function();
	private SimpleDateFormat formatter = new SimpleDateFormat("yyyy w");
	String date = formatter.format(new Date());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				resp.setContentType("text/html; charset=utf-8");
				req.setCharacterEncoding("utf-8");
				String method1 = req.getParameter("denglu");
				String method2 = req.getParameter("zhuce");
				String method3 = req.getParameter("manger");
				String name = req.getParameter("name");
				String password =req.getParameter("password");
				if(method1 != null) {
					if(function.finduser(name, password) == true) {	
						if(function.finduserentrytime(name, password, date) != true) {
							function.add(name, password);
						}
						HttpSession session = req.getSession();
						session.setAttribute("username",name);
						req.getRequestDispatcher("workplace.jsp").forward(req, resp);
					}
					else {
					resp.getWriter().write("�û��������������3��󷵻ص�¼����");
					resp.setHeader("refresh", "3;url=http://localhost:8888/weeklyreport1/");
					}
				}
				if (method2 != null){
					if(function.findusername(name) == true) {
						resp.getWriter().write("�û����Ѿ���ע�����3��󷵻�ע�����");
						resp.setHeader("refresh", "3;url=http://localhost:8888/weeklyreport1/");
					}
					else {
					function.add(name, password);
					function.addname(name);
					resp.getWriter().write("ע��ɹ�");
					}
				}
				if(method3 != null) {
					if(name.equalsIgnoreCase("����") && function.finduser(name, password) == true) {
						req.getRequestDispatcher("manger.jsp").forward(req, resp);
					}
					else {
						resp.getWriter().write("����Ա�˺Ż����������3��󷵻ص�¼����");
						resp.setHeader("refresh", "3;url=http://localhost:8888/weeklyreport1/");
					}
				}

			
	}
}
