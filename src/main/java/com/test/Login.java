package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
		String psd = request.getParameter("Password");
		
		try {
			if(checkAccount(name, psd)){
				System.out.println(name + " Login in.");
				
				request.getSession().setAttribute("name", name);
				/*
				 * 这样直接跳转，在加载css资源的时候，会加上IP，需要把这些静态资源放到服务器
				 */
				request.getRequestDispatcher("static/jsp/homepage.jsp").forward(request, response);
			}else{
				request.getSession().setAttribute("name", "");
				
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
				
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	
	private boolean checkAccount(String name, String password) throws SQLException, ClassNotFoundException{
		final String URL = "jdbc:mysql://localhost:3306/platform?serverTimezone=UTC";
		final String user = "root";
		final String psd = "root";
		
		 //1.加载驱动程序
        Class.forName("com.mysql.jdbc.Driver");
        //2. 获得数据库连接
        Connection conn = DriverManager.getConnection(URL, user, psd);
        
      //3.操作数据库，实现增删改查
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT name, password FROM account");
		
        while(rs.next()){
        	if(name.equals(rs.getString("name")) && password.equals(rs.getString("password"))){
        		 return true;
        	}
        }
        
		return false;
	}

}
