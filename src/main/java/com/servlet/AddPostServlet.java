package com.servlet;

import java.io.IOException;



import com.DAO.jobDAO;
import com.DB.DBConnect;
import com.entity.jobs;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class AddPostServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String title = req.getParameter("title");
			String location = req.getParameter("location");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String desc = req.getParameter("desc");
			
			jobs j= new jobs();
			j.setTitle(title);
			j.setDescription(desc);
			j.setLocation(location);
			j.setStatus(status);
			j.setCategory(category);
			
			
			HttpSession session=req.getSession();
			
			jobDAO dao = new jobDAO(DBConnect.getConn());
			boolean f=dao.addJobs(j);
			
			if (f) {
				session.setAttribute("succMsg", "Job Post Successfully...");
				resp.sendRedirect("addjob.jsp");
			}else {
			
				session.setAttribute("succMsg", "Something went wrong...");
				resp.sendRedirect("addjob.jsp");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	
	
}
