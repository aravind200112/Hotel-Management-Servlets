import java.beans.Statement;
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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		 
		// response.setContentType("text/html");
		 PrintWriter pw = response.getWriter();
		 HttpSession mysession = request.getSession();
		 
		 try {
			 
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/paradize","root","Aravind@2001");
			 String n = request.getParameter("txtname");
			 String p = request.getParameter("txtpwd");
			 
			 PreparedStatement ps = con.prepareStatement("select name, email from login where email=? and password=?");
			 ps.setString(1, n);
			 ps.setString(2, p);
			 ResultSet rs = ps.executeQuery();
		 	 
			 if(rs.next())
			 {
				    
				    request.setAttribute("status","success");
				    String name = rs.getString("name");
				    String email = rs.getString("email");
				    request.setAttribute("user", name);
					 
				    
				    mysession.setAttribute("name",name);
				    mysession.setAttribute("email", email);
				    RequestDispatcher rd = request.getRequestDispatcher("user_dash.jsp");
					rd.forward(request,response);
					
			 }
			  
			 else {
				    request.setAttribute("status","failed");
				    
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					rd.forward(request,response);
					
					
				 
			 }
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

}
