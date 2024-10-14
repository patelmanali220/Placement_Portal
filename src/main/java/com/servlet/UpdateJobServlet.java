package com.servlet;

import java.io.IOException;

import javax.print.attribute.standard.JobSheets;
import javax.servlet.annotation.WebServlet;

import com.DAO.jobDAO;
import com.DB.DBConnect;
import com.entity.jobs;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



public class UpdateJobServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
    	int id = Integer.parseInt(req.getParameter("id"));
    	String title = req.getParameter("title");
		String location = req.getParameter("location");
		String category = req.getParameter("category");
		String status = req.getParameter("status");
		String desc = req.getParameter("desc");
		
		jobs j= new jobs();
		j.setId(id);
		j.setTitle(title);
		j.setDescription(desc);
		j.setLocation(location);
		j.setCategory(category);
		j.setStatus(status);
		
		HttpSession session= req.getSession();
		
		jobDAO dao = new jobDAO(DBConnect.getConn());
		boolean f=dao.updateJob(j);
		
		if (f) {
			session.setAttribute("succMsg", "Job update Successfully...");
			resp.sendRedirect("view_job.jsp");
		}else {
		
			session.setAttribute("succMsg", "Something went wrong...");
			resp.sendRedirect("view_job.jsp");
		}
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
		
		
		
		
	}

}
