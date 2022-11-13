

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

import java.text.ParseException;
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;


/**
 * Servlet implementation class BookServlet
 */
@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Entering the program");
		HttpSession mysession = request.getSession();
		String name = (String) mysession.getAttribute("name");
		String email = (String) mysession.getAttribute("email");
		
		
		PrintWriter pw = response.getWriter();
		
		String ci = request.getParameter("checkin");
	   	String co = request.getParameter("checkout");	   	
		String roomtype = request.getParameter("room-type");
		int rooms = 0;
		int rate = 0;
		int cost = 0;
		
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/paradize","root","Aravind@2001");
			
			if(roomtype.equals("Type-A"))
			{
				rooms = Integer.parseInt(request.getParameter("num_book-1"));
			    rate = 1000;
			    cost = rate*rooms;
			    
			}
			else if(roomtype.equals("Type-B"))
			{
				    rooms = Integer.parseInt(request.getParameter("num_book-2"));
				    rate = 1500;
				    cost = rate*rooms;
				    
			}
			else if(roomtype.equals("Type-C"))
			{
				rooms = Integer.parseInt(request.getParameter("num_book-3"));
				 rate = 1700;
			     cost = rate*rooms;
			     
			}
		    System.out.println("Entering prepare 1");
		    PreparedStatement ps_sum1 = con.prepareStatement("select sum(room_num) from customer_bookings where (? between checkin and checkout) and (checkout != ?) and (room_type = 'Type-A')");
			ps_sum1.setString(1,ci);
			ps_sum1.setString(2,ci);
			
			PreparedStatement ps_sum2 = con.prepareStatement("select sum(room_num) from customer_bookings where (? between checkin and checkout) and (checkout != ?) and (room_type = 'Type-A')");
			ps_sum2.setString(1,co);
			ps_sum2.setString(2,co);
			
			ResultSet rs1 = ps_sum1.executeQuery();
			ResultSet rs2 = ps_sum2.executeQuery();
			
			System.out.println("Entering if else rs1 and rs2");
			
			if(rs1.next() && rs2.next())
			{
				int count1 = rs1.getInt(1);
				int count2 = rs2.getInt(1);
				
				System.out.println("In the condition");
				
				
				if((10-count1) >= rooms && (10-count2) >= rooms)
				{
					PreparedStatement ps = con.prepareStatement("insert into customer_bookings (name, email, checkin, checkout, room_type, room_num, rate, cost) values (?,?,?,?,?,?,?,?)");
					ps.setString(1, name);
					ps.setString(2, email);
					ps.setString(3, ci);
					ps.setString(4, co);
					ps.setString(5, roomtype);
					ps.setInt(6, rooms);
					ps.setInt(7, rate);
					ps.setInt(8, cost);
					
					int rc = ps.executeUpdate();
					
					if(rc>0)
					{
						request.setAttribute("status","success");
						RequestDispatcher rd = request.getRequestDispatcher("book.jsp");
						rd.forward(request, response);
					}
				}
				else {
					request.setAttribute("status","failed");
					RequestDispatcher rd = request.getRequestDispatcher("book.jsp");
					rd.forward(request, response);
				}
				
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
