
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
public class Servlet extends HttpServlet {
    public void doPost(HttpServletRequest rq, HttpServletResponse res) throws ServletException, IOException {
        String u_name = rq.getParameter("id");
        String pwd = rq.getParameter("pwd");

        try {
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            String str = "SELECT student.Roll_no, student.Student_Name, marks.Tamil, marks.English, marks.Math, marks.Science, marks.Social " +
                         "FROM student " +
                         "RIGHT JOIN marks ON student.Roll_no = marks.Roll_no " +
                         "WHERE student.Roll_no = ? AND student.password = ?";

            PreparedStatement ps = cn.prepareStatement(str);
            ps.setString(1, u_name);
            ps.setString(2, pwd);
            
            HttpSession htp=rq.getSession();
    		htp.setAttribute("u_name", u_name);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                String Roll_No = rs.getString(1);
                String Name = rs.getString(2);
                int tam = rs.getInt(3);
                int eng = rs.getInt(4);
                int mat = rs.getInt(5);
                int sci = rs.getInt(6);
                int ss = rs.getInt(7);

                HttpSession session = rq.getSession();
                session.setAttribute("Roll_No", Roll_No);
                session.setAttribute("Name", Name);
                session.setAttribute("tam", tam);
                session.setAttribute("eng", eng);
                session.setAttribute("mat", mat);
                session.setAttribute("sci", sci);
                session.setAttribute("ss", ss);

                RequestDispatcher rd = rq.getRequestDispatcher("NewFile.jsp");
                rd.forward(rq, res);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
