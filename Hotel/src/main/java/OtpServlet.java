

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OtpServlet
 */
@WebServlet("/OtpServlet")
public class OtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OtpServlet() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter pw = response.getWriter();
	    HttpSession mysession = request.getSession();
	    int otp_string = (int) mysession.getAttribute("otpvalue");
	    
	    
	    
	    int otp =  Integer.parseInt(request.getParameter("txtotp"));
	    if(otp_string == otp)
	    {
	    	
	    	RequestDispatcher rd = request.getRequestDispatcher("resetpass.jsp");
	    	rd.forward(request, response);
	    }
	    else {
	    	
	    	request.setAttribute("status","wrong");
	    	RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
	    	rd.forward(request, response);
	    }
	}

}
