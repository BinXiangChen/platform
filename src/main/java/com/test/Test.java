package com.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.data.envdata;

public class Test {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		List<envdata> envdata_old = new ArrayList<envdata>();
		envdata_old = getEnvData();
//		request.getSession().setAttribute("envdatanow", envdata_old);
		
	}

	
	private static List<envdata> getEnvData() throws ClassNotFoundException, SQLException{
		final String URL = "jdbc:mysql://localhost:3306/platform?serverTimezone=UTC";
		final String user = "root";
		final String psd = "root";
		List<envdata> envdata1 = new ArrayList<envdata>();
		
		 //1.加载驱动程序
        Class.forName("com.mysql.jdbc.Driver");
        //2. 获得数据库连接
        Connection conn = DriverManager.getConnection(URL, user, psd);
        
      //3.操作数据库，实现增删改查
        Statement stmt = conn.createStatement();
        String variable = "1";
		String owner = "2";
		String env = "3";
		String value = "4";
		int rs = stmt.executeUpdate("insert into dataenv(variable, owner, env, value) values ("
        		+ variable +","+ owner+ "," + env + "," + value 
        		+ ") ");
        
		return envdata1;
	}
}
