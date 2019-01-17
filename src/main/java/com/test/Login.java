package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
    }

	/**
	 * 登录
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("Username");
		
		System.out.println(name + " Login in.");
		
		if("chenbinxiang".equals(name)){
			/*
			 * 这样直接跳转，在加载css资源的时候，会加上IP，需要把这些静态资源放到服务器
			 */
			request.getRequestDispatcher("static/jsp/homepage.jsp").forward(request, response);
		}else{
			request.getSession().setAttribute("loginStatus", "false");
			
			/*
			 * 返回json
			 */
			/*
			String jsonStr = "{loginStatus:false,message:\"用户名密码错误.\"}";
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println(jsonStr);
			out.flush();
			out.close();
			*/
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
