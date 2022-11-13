

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.mail.*;    
import javax.mail.internet.*;    


/**
 * Servlet implementation class ForgotServlet
 */
@WebServlet("/ForgotServlet")
public class ForgotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotServlet() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter pw = response.getWriter();
	    HttpSession mysession = request.getSession();
		String mail = request.getParameter("txtmail");	
		
		int otpvalue = 0;
		
		
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/paradize","root","Aravind@2001");
			 
			 
			 
			 PreparedStatement ps = con.prepareStatement("select email from login where email=?");
			 ps.setString(1, mail);
			 ResultSet rs = ps.executeQuery();
			 
			 if(rs.next())
			 {
				 
				 		
				 Random rand = new Random();				 
				 otpvalue = rand.nextInt(123456);
				 
				 String to = mail;
				 
				 Properties props = new Properties();
				 props.put("mail.smtp.host", "smtp.gmail.com");
				 props.put("mail.smtp.port", "465");
				 props.put("mail.smtp.auth", "true");
				 //props.put("mail.smtp.starttls.enable", "true");
				 //props.put("mail.smtp.starttls.required", "true");
				 props.put("mail.smtp.ssl.protocols", "TLSv1.2");
				 props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		         
		         Session session = Session.getDefaultInstance(props,    
		                 new javax.mail.Authenticator() {    
		                 protected PasswordAuthentication getPasswordAuthentication() {    
		                 return new PasswordAuthentication("aravindchukli@gmail.com","vyhqvljjgwlgvzwh");  
		                 }    
		                });    
				try {
					
					MimeMessage message = new MimeMessage(session);
					message.addRecipient(Message.RecipientType.TO,new InternetAddress(to)); 
					message.setSubject("Hello");
					message.setText("your otp is: "+otpvalue);
					
					Transport.send(message);
					
					request.setAttribute("status","success");
					mysession.setAttribute("otpvalue",otpvalue);
					mysession.setAttribute("mail", mail);
					RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
					rd.forward(request,response); 
					

				} catch (MessagingException e)
				{
					throw new RuntimeException(e);
				}
				 
			 }
			 else
			 {
				 request.setAttribute("status","failed");
				 RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
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
