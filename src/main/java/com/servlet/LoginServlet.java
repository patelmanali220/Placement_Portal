package com.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;

import com.DAO.UserDAO;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	 
	try {
		
		String em= req.getParameter("email");
		String ps=req.getParameter("password");
		User u= new User();
		HttpSession session = req.getSession();
		
		if("admin22@gmail.com".equals(em) && "admin@22".equals(ps))
		{
			session.setAttribute("userobj", u);
			u.setRole("admin");
			resp.sendRedirect("admin.jsp");
		}
		
	else {
			
			UserDAO dao= new UserDAO(DBConnect.getConn());
			User user= dao.login(em, ps);
		
				if(user != null) {
					session.setAttribute("userobj", user);
					resp.sendRedirect("home.jsp");
				}else {
					session.setAttribute("succMsg", "Invalid Email & Password");
					resp.sendRedirect("login.jsp");
				}
		}
	
		
	}
	catch (Exception e) {
		
		e.printStackTrace();
	}
	
	}
	
}
