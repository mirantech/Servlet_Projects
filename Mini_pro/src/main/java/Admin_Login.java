import java.io.IOException;
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
 * Servlet implementation class Admin_Login
 */
@WebServlet("/Admin_Login")
public class Admin_Login extends HttpServlet {
	public void doPost(HttpServletRequest rq,HttpServletResponse rs) throws ServletException, IOException {
		String purpose=rq.getParameter("purpose");
		
		if(purpose.equals("L")) {
		String id=rq.getParameter("id");
		String pwd=rq.getParameter("pwd");
		
		  if (id.equals("VSBEC") && pwd.equals("vsb@123")) {
              HttpSession session = rq.getSession();
              session.setMaxInactiveInterval(60*10); // Set session timeout to 10 seconds
              RequestDispatcher res = rq.getRequestDispatcher("MarksEnter.jsp	");
              res.forward(rq, rs);
          } else {
              rs.sendRedirect("Admin.html?error=true");
          }
      }
		System.out.println("After staff enter data");
		
		if(purpose.equals("I")) {
			System.out.println("Enter to the insert");
			String Stu_id=rq.getParameter("Stu_id");
			Connection cn;
			try {
				cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
				System.out.println("after connection");
				String student="select Roll_No from student where Roll_No=?;";
				PreparedStatement ps=cn.prepareStatement(student);
				ps.setString(1, Stu_id);
				ResultSet result=ps.executeQuery();
				
			    if (result.next()) {
			        // Student exists, now check if marks exist for the student
			        String marksCheckQuery = "SELECT Roll_No FROM marks WHERE Roll_No = ?";
			        PreparedStatement ps1 = cn.prepareStatement(marksCheckQuery);
			        ps1.setString(1, Stu_id);
			        ResultSet result2 = ps1.executeQuery();

			        int tam = Integer.parseInt(rq.getParameter("tam"));
			        int eng = Integer.parseInt(rq.getParameter("eng"));
			        int mat = Integer.parseInt(rq.getParameter("mat"));
			        int sci = Integer.parseInt(rq.getParameter("sci"));
			        int SS = Integer.parseInt(rq.getParameter("ss"));

			        if (result2.next()) {
			            // Marks exist, update the record
			            String updateQuery = "UPDATE marks SET Tamil = ?, English = ?, Math = ?, Science = ?, Social = ? WHERE Roll_No = ?";
			            PreparedStatement ps2 = cn.prepareStatement(updateQuery);
			            ps2.setInt(1, tam);
			            ps2.setInt(2, eng);
			            ps2.setInt(3, mat);
			            ps2.setInt(4, sci);
			            ps2.setInt(5, SS);
			            ps2.setString(6, Stu_id);
			            int rowsUpdated = ps2.executeUpdate();
			            if (rowsUpdated > 0) {
			                System.out.println("Updated successfully");
			                rs.sendRedirect("Logout.jsp");
			            } else {
			                System.out.println("Update failed");
			            }
			        } else {
			            // Marks do not exist, insert the record
			            String insertQuery = "INSERT INTO marks (Roll_No, Tamil, English, Math, Science, Social) VALUES (?, ?, ?, ?, ?, ?)";
			            PreparedStatement ps3 = cn.prepareStatement(insertQuery);
			            ps3.setString(1, Stu_id);
			            ps3.setInt(2, tam);
			            ps3.setInt(3, eng);
			            ps3.setInt(4, mat);
			            ps3.setInt(5, sci);
			            ps3.setInt(6, SS);
			            int rowsInserted = ps3.executeUpdate();
			            if (rowsInserted > 0) {
			                System.out.println("Inserted successfully");
			                rs.sendRedirect("Logout.jsp");
			            } else {
			                System.out.println("Insert failed");
			            }
			        }
			    } else {
			        System.out.println("Student does not exist");
			    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}
