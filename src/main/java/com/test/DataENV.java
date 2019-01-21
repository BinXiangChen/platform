package com.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.data.envdata;


/**
 * Servlet implementation class DataENV
 */
@WebServlet(description = "环境数据", urlPatterns = { "/DataENV" })
public class DataENV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataENV() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		List<envdata> envdata_old = new ArrayList<envdata>();
		
		/**
		 * 显示环境变量
		 */
		envdata_old = getEnvData();
		request.getSession().setAttribute("envdatanow", envdata_old);
		
		/**
		 * 添加 环境变量
		 */
		String isSetEnv = (String) request.getSession().getAttribute("isAddEnv");
		
		if("true".equals(isSetEnv)){
			request.getSession().setAttribute("isAddEnv", "");
			
			String variable = request.getParameter("variable");
			String env = request.getParameter("env");
			String value = request.getParameter("value");
			String owner = (String) request.getSession().getAttribute("name");
			
			envdata temp = new envdata();
			temp.setVariable(variable);
			temp.setEnv(env);
			temp.setOwner(owner);
			temp.setValue(value);
			
			addDataEnv(temp);
		}
		
		/**
		 * 编辑 环境变量
		 */
		String idEditEnv = (String) request.getSession().getAttribute("isEditEnv");
		if("true".equals(idEditEnv)){
			request.getSession().setAttribute("isEditEnv", "");
			
			String variable = request.getParameter("variable");
        	String owner = (String) request.getSession().getAttribute("name");
        	String env = request.getParameter("env");
        	String id = (String) request.getSession().getAttribute("editId");
        	String value = request.getParameter("value");
        	
        	envdata temp = new envdata();
        	temp.setId(id);
        	temp.setVariable(variable);
        	temp.setOwner(owner);
        	temp.setEnv(env);
        	temp.setValue(value);
        	
//        	System.out.println(variable + owner + env + id + value );
        	
        	editDataEnv(temp);
		}
		
		/**
		 * 删除 环境变量
		 */
		String isDelEnv = (String) request.getSession().getAttribute("isDelEnv");
		if("true".equals(isDelEnv)){
			request.getSession().setAttribute("isDelEnv", "");
			
			String id = request.getParameter("id");
			
			System.out.println("id =" + id);
			
			delDataEnv(id);
		}
		
		
		try {
			request.getRequestDispatcher("static/jsp/dataENV.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	private static List<envdata> getEnvData(){
		final String URL = "jdbc:mysql://localhost:3306/platform?serverTimezone=UTC";
		final String user = "root";
		final String psd = "root";
		List<envdata> envdata1 = new ArrayList<envdata>();
		
		
        try {
        	 //1.加载驱动程序
			Class.forName("com.mysql.jdbc.Driver");
			
			//2. 获得数据库连接
	        Connection conn = DriverManager.getConnection(URL, user, psd);
	        
	        //3.操作数据库，实现增删改查
	        Statement stmt = conn.createStatement();
	        String sql = "SELECT * FROM dataenv";
	        System.out.println(sql);
	        ResultSet rs = stmt.executeQuery(sql);
			
	        while(rs.next()){
	        	envdata env_temp = new envdata();
	        	env_temp.setId(rs.getString("id"));
	        	env_temp.setVariable(rs.getString("variable"));
	        	env_temp.setOwner(rs.getString("owner"));
	        	env_temp.setEnv(rs.getString("env"));
	        	env_temp.setValue(rs.getString("value"));
	        	
	        	
	        	envdata1.add(env_temp);
	        }
	        
	        return envdata1;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return null;
	}
	
	private void addDataEnv(envdata temp){
		final String URL = "jdbc:mysql://localhost:3306/platform?serverTimezone=UTC&characterEncoding=UTF-8";
		final String user = "root";
		final String psd = "root";
		
		
        try {
			Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = DriverManager.getConnection(URL, user, psd);
	        
	        Statement stmt = conn.createStatement();
	        
	        String variable = temp.getVariable();
			String env = temp.getEnv();
			String value = temp.getValue();
			String owner = temp.getOwner();
			
			/**
			 * 注意 SQL中 字符串 必须加上 引号，不然会出错
			 */
			String sql = "insert into dataenv(variable, owner, env, value) values ("
	        		+"\""+ variable +"\"" +","
					+"\""+ owner+"\""+ "," 
	        		+"\""+ env+"\"" + ","
	        		+"\""+ value +"\""
	        		+ ") ";
	        System.out.println(sql);
	        
			int rs = stmt.executeUpdate(sql);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
	}
	
	private void editDataEnv(envdata temp){
		final String URL = "jdbc:mysql://localhost:3306/platform?serverTimezone=UTC&characterEncoding=UTF-8";
		final String user = "root";
		final String psd = "root";
		
		 try {
			Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = DriverManager.getConnection(URL, user, psd);
	        
	        Statement stmt = conn.createStatement();
	        
	        String id = temp.getId();
	        String variable = temp.getVariable();
			String env = temp.getEnv();
			String owner = temp.getOwner();
			String value = temp.getValue();
			
			/**
			 * 修改
			 */
			String sql = "update dataenv set "
					+ "variable = \""+ variable +"\"" +","
					+"owner = \""+ owner+"\""+ "," 
	        		+"env = \""+ env+"\"" + ","
	        		+"value = \""+ value +"\""
	        		+ " where id = "+id+" ";
			
	        System.out.println(sql);
	        
			int rs = stmt.executeUpdate(sql);
			
		 }catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	private void delDataEnv(String id){
		final String URL = "jdbc:mysql://localhost:3306/platform?serverTimezone=UTC&characterEncoding=UTF-8";
		final String user = "root";
		final String psd = "root";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(URL, user, psd);
		        
			Statement stmt = conn.createStatement();
			        
			String sql = "delete from dataenv"
			       + " where id = " + id;
			
			System.out.println(sql);
		        
			boolean rs = stmt.execute(sql);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	   
	}
}
