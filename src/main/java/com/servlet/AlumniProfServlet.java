package com.servlet;

import java.io.IOException;



import com.DAO.AlumniDAO;

import com.DB.DBConnect;
import com.entity.Alumni;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AlumniProfServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String linkdin = req.getParameter("linkdin");
			String degree = req.getParameter("degree");
			String field = req.getParameter("field");
			String grad_yr = req.getParameter("grad_yr");
			String employer = req.getParameter("employer");
			String jobtitle = req.getParameter("jobtitle");
			String companyweb = req.getParameter("companyweb");
			String comlinkdin = req.getParameter("comlinkdin");
			//String resume = req.getParameter("resume");
			String description = req.getParameter("description");
			
			
			
			Alumni a= new Alumni();
		    a.setName(name);
			a.setEmail(email);
			a.setPhone(phone);
			a.setLinkdin(linkdin);
			a.setDegree(degree);
			a.setField(field);
			a.setGrad_yr(grad_yr);
		    a.setEmployer(employer);
			a.setJobtitle(jobtitle);
		    a.setCompanyweb(companyweb);
			a.setComlinkdin(comlinkdin);
			//a.setResume(resume);
			a.setDescription(description);
			
			
			HttpSession session=req.getSession();
			
			AlumniDAO dao = new AlumniDAO(DBConnect.getConn());
			boolean f=dao.alumniPost(a);
			
			if (f) {
				session.setAttribute("succMsg", "Alumni Post Successfully...");
				resp.sendRedirect("alumniProf.jsp");
			}else {
			
				session.setAttribute("succMsg", "Something went wrong...");
				resp.sendRedirect("alumniProf.jsp");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	
}
