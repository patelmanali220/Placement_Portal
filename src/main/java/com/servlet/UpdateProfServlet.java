package com.servlet;

import java.io.IOException;

import com.DAO.UserDAO;
import com.DAO.jobDAO;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateProfServlet extends HttpServlet {
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
    	int id = Integer.parseInt(req.getParameter("id"));
    	String name = req.getParameter("name");
		String qua = req.getParameter("qua");
		String email = req.getParameter("email");
		String ps = req.getParameter("ps");
		
		UserDAO dao = new UserDAO(DBConnect.getConn());
		
		
		
		User u = new User();
		
		
		u.setName(name);
		u.setEmail(email);
		u.setPassword(ps);
		u.setQualification(qua);
		
		
		u.setId(id);
		
		
		boolean f=dao.UpdateUser(u);
		HttpSession session= req.getSession();
		
		
		
		if (f) {
			session.setAttribute("succMsg", "Profile update Successfully...");
			resp.sendRedirect("home.jsp");
		}else {
		
			session.setAttribute("succMsg", "Something went wrong...");
			resp.sendRedirect("home.jsp");
		}
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
		
		
		
		
	}
}
