package com.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DB.DBConnect;
import com.entity.User;


public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String qua = req.getParameter("qua");
		String email = req.getParameter("email");
		String ps = req.getParameter("ps");
		
		UserDAO dao= new UserDAO(DBConnect.getConn());
		
		User u= new User(name, email, ps, qua, "User");
		boolean f = dao.addUser(u);
		
		HttpSession session=req.getSession();
	
		if (f) {
			session.setAttribute("succMsg", "Job Post Successfully...");
			resp.sendRedirect("Signup.jsp");
		}else {
		
			session.setAttribute("succMsg", "Something went wrong...");
			resp.sendRedirect("Signup.jsp");
		}
		
	}

}
