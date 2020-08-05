package users;

import java.util.ArrayList;


import java.util.Date;
import java.util.Formatter;
import java.util.List;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Function {
	private SimpleDateFormat formatter = new SimpleDateFormat("yyyy w");
	Connection connection = null;
	PreparedStatement preparedStatement = null;
		
	public void add(String name,String password2) {
		String date = formatter.format(new Date());
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/weeklyreport?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=GMT%2B8";
			String user = "root";
			String password = "jnh182516";
			connection = DriverManager.getConnection(url, user, password);
			String sql = "insert into users2(USER_NAME,USER_PASSWORD,USER_ENTRYDATE) VALUES(?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, password2);
			preparedStatement.setString(3,date);
			preparedStatement.executeUpdate();
			}catch (ClassNotFoundException e) {
				 e.printStackTrace();
			} catch (SQLException e){
				 e.printStackTrace();
			} finally {
				try {
					connection.close();
					preparedStatement.close();
				} catch (SQLException e){
					 e.printStackTrace();
				}
			}
	}
	public void addname(String name) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/weeklyreport?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=GMT%2B8";
			String user = "root";
			String password = "jnh182516";
			connection = DriverManager.getConnection(url, user, password);
			String sql = "insert into users1(USER_NAME) VALUES(?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, name);
			preparedStatement.executeUpdate();
			}catch (ClassNotFoundException e) {
				 e.printStackTrace();
			} catch (SQLException e){
				 e.printStackTrace();
			} finally {
				try {
					connection.close();
					preparedStatement.close();
				} catch (SQLException e){
					 e.printStackTrace();
				}
			}
	}
public boolean finduser(String name2,String password2) {
		ResultSet result = null;
		int i =0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/weeklyreport?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=GMT%2B8";
			String user = "root";
			String password = "jnh182516";
			connection = DriverManager.getConnection(url, user, password);
			String sql = "select * from users2 where USER_NAME= ? and USER_PASSWORD= ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, name2);
			preparedStatement.setString(2, password2);
			result =preparedStatement.executeQuery();
			while(result.next()) {
				i++;
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
		if (i == 0)
			return false;
		else 
			return true;
	}
public boolean finduserentrytime(String name2,String password2,String entrydate) {
	ResultSet result = null;
	int i =0;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/weeklyreport?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=GMT%2B8";
		String user = "root";
		String password = "jnh182516";
		connection = DriverManager.getConnection(url, user, password);
		String sql = "select * from users2 where USER_NAME= ? and USER_PASSWORD= ? and USER_ENTRYDATE=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, name2);
		preparedStatement.setString(2, password2);
		preparedStatement.setString(3,entrydate);
		result =preparedStatement.executeQuery();
		while(result.next()) {
			i++;
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
	if (i == 0)
		return false;
	else 
		return true;
}
public boolean findusername(String name2) {
	ResultSet result = null;
	int i =0;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/weeklyreport?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=GMT%2B8";
		String user = "root";
		String password = "jnh182516";
		connection = DriverManager.getConnection(url, user, password);
		String sql = "select * from users2 where USER_NAME= ?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, name2);
		result =preparedStatement.executeQuery();
		while(result.next()) {
			i++;
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
	if (i == 0)
		return false;
	else 
		return true;
}
}
