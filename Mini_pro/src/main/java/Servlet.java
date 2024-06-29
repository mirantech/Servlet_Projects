
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet{
	public void doPost(HttpServletRequest rq,HttpServletResponse res) throws ServletException, IOException{
		String u_name=rq.getParameter("id");
		String pwd=rq.getParameter("pwd");
		
		try {
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			String str="select * from login where email=? and pwd=?;";
			PreparedStatement ps=cn.prepareStatement(str);
			ps.setString(1, u_name);   //this 1 is represent the ? (1st phaseholder)
			ps.setString(2, pwd);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next()){ 
				int tam=rs.getInt(3);
				int math=rs.getInt(4);
				//return true;
					HttpSession htp=rq.getSession();
					htp.setAttribute("u_name",tam);
					HttpSession htp1=rq.getSession();
					htp.setAttribute("u_name1",math);
					RequestDispatcher rs1=rq.getRequestDispatcher("NewFile.jsp");
					rs1.forward(rq, res);
				}
			else {
				RequestDispatcher rd=rq.getRequestDispatcher("login.html");
				rd.include(rq, res);
				rd=rq.getRequestDispatcher("wrong.html");
				rd.include(rq, res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
