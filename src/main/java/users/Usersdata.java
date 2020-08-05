package users;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Formatter;



public class Usersdata {
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	public boolean sameweek(Date date1,Date date2) {
		Calendar day1 = Calendar.getInstance();
		Calendar day2 = Calendar.getInstance();
		day1.setTime(date1);
		day2.setTime(date2);
		if(day1.get(Calendar.WEEK_OF_YEAR) == day2.get(Calendar.WEEK_OF_YEAR)) {
			return true;
		}
		else {
			return false;
		}
	}
	public void update(String name,String date,String user_finshed0,String user_finshed1,String user_finshed2,String user_finshed3,
	String user_finshed4,String user_thistask0,String user_thistask1,String user_thistask2,String user_thistask3,
	String user_thistask4,String user_summary,String user_thisdate0,String user_thisdate1,String user_thisdate2,String user_thisdate3,
	String user_thisdate4) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/weeklyreport?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=GMT%2B8";
			String user = "root";
			String password = "jnh182516";
			connection = DriverManager.getConnection(url, user, password);
			String sql = "UPDATE USERS2 SET USER_FINSHED0=? , USER_FINSHED1=? , USER_FINSHED2=? , USER_FINSHED3=? , USER_FINSHED4=? "
					+ ", USER_THISTASK0=? , USER_THISTASK1=? , USER_THISTASK2=? , USER_THISTASK3=? , USER_THISTASK4=? "
					+ ", USER_THISDATE0=? , USER_THISDATE1=? , USER_THISDATE2=? , USER_THISDATE3=? , USER_THISDATE4=? "
					+ ", USER_SUMMARY=? WHERE USER_NAME=? AND USER_ENTRYDATE=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user_finshed0);
			preparedStatement.setString(2, user_finshed1);
			preparedStatement.setString(3,user_finshed2);
			preparedStatement.setString(4,user_finshed3);
			preparedStatement.setString(5,user_finshed4);
			preparedStatement.setString(6,user_thistask0);
			preparedStatement.setString(7,user_thistask1);
			preparedStatement.setString(8,user_thistask2);
			preparedStatement.setString(9,user_thistask3);
			preparedStatement.setString(10,user_thistask4);
			preparedStatement.setString(11,user_thisdate0);
			preparedStatement.setString(12,user_thisdate1);
			preparedStatement.setString(13,user_thisdate2);
			preparedStatement.setString(14,user_thisdate3);
			preparedStatement.setString(15,user_thisdate4);
			preparedStatement.setString(16,user_summary);
			preparedStatement.setString(17,name);
			preparedStatement.setString(18,date);
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
}
