package com.xadmin.hotelmanagement.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xadmin.hotelmanagement.bean.Hotel;
import com.xadmin.hotelmanagement.dao.HotelDAO;

/**
 * Servlet implementation class HotelServlet
 */
@WebServlet("/")
public class HotelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HotelDAO hotelDao;   
    public String email_id;
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		hotelDao = new HotelDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    String action = request.getServletPath();
	    HttpSession mysession = request.getSession();
		String email_id =(String) mysession.getAttribute("mail");
		
	    
	    switch(action)
	    {
	    case "/list":
	    	listUser(request, response);
	    }
	}

    private void listUser( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	
    	try {
    		List<Hotel> listUser = hotelDao.select();
    		request.setAttribute("listUser", listUser);
    		RequestDispatcher rd = request.getRequestDispatcher("update_rooms.jsp");
    		rd.forward(request, response);
    	}catch (Exception e)
    	{
    		e.printStackTrace();
    	}
    }
	
	

}
