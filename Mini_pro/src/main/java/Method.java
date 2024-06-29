
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Method {
	public static boolean check(String uname,String pwd) {
		try {
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			String str="select * from login where email=? and pwd=?;";
			PreparedStatement ps=cn.prepareStatement(str);
			ps.setString(1, uname);   //this 1 is represent the ? (1st phaseholder)
			ps.setString(2, pwd);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				//return true;
				if((rs.getString(1).equals(uname))&&(rs.getString(2).equals(pwd))) { //work in if also but no need
					return true;    		// bcz if (where query need to staisty of given input so if wrok no data in while loop
				}                  		// if ture means it eill give crt value to while so directly written true
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
}
