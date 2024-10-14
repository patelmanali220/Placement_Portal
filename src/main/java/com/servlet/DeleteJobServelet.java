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



public class DeleteJobServelet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			jobDAO dao= new jobDAO(DBConnect.getConn());
			boolean f=dao.deleteJobs(id);
		
			HttpSession session= req.getSession();
			
			
			if (f) {
				session.setAttribute("succMsg", "Job Delete Successfully...");
				resp.sendRedirect("view_job.jsp");
			}else {
			
				session.setAttribute("succMsg", "Something went wrong...");
				resp.sendRedirect("view_job.jsp");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	
	
}
