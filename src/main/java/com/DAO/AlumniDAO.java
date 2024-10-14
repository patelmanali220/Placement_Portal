package com.DAO;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import com.entity.Alumni;
import com.entity.jobs;
import com.mysql.cj.protocol.Resultset;

public class AlumniDAO {
	private Connection conn;

	public AlumniDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean alumniPost(Alumni a) {
		
		boolean f=false;
		
		try {
			String sql="insert into Alumni(name,email,phone,linkdin,degree,field,grad_yr,employer,jobtitle,companyweb,comlinkdin,description) values (?,?,?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, a.getName());
			ps.setString(2, a.getEmail());
			ps.setString(3, a.getPhone());
			ps.setString(4, a.getLinkdin());
			ps.setString(5, a.getDegree());
			ps.setString(6, a.getField());
			ps.setString(7, a.getGrad_yr());
			ps.setString(8, a.getEmployer());
			ps.setString(9, a.getJobtitle());
			ps.setString(10, a.getCompanyweb());
			ps.setString(11, a.getComlinkdin());
			//ps.setString(12, a.getResume());
			ps.setString(12, a.getDescription());
			
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f= true;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	 return f;	
		
		
	}
	
	public List<Alumni> getAllAlumni(){
		List<Alumni> list=new ArrayList<Alumni>();
		Alumni a = null;
		
		try {
			String sql = "select *from Alumni order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
			    a = new Alumni();
				a.setId(rs.getInt(1));
			    a.setName(rs.getString(2));
				a.setEmail(rs.getString(3));
				
				a.setLinkdin(rs.getString(5));
	
				a.setField(rs.getString(7));

			    a.setEmployer(rs.getString(9));
				a.setJobtitle(rs.getString(10));
			    a.setCompanyweb(rs.getString(11));
				a.setComlinkdin(rs.getString(12));
				//a.setResume(resume);
				a.setDescription(rs.getString(13));
				
				
				list.add(a);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Alumni getAlumniById(int id){
		
		Alumni a = null;
		
		try {
			String sql = "select *from Alumni where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				 a = new Alumni();
					a.setId(rs.getInt(1));
				    a.setName(rs.getString(2));
					a.setEmail(rs.getString(3));
					
					a.setLinkdin(rs.getString(5));
		
					a.setField(rs.getString(7));

				    a.setEmployer(rs.getString(9));
					a.setJobtitle(rs.getString(10));
				    a.setCompanyweb(rs.getString(11));
					a.setComlinkdin(rs.getString(12));
					//a.setResume(resume);
					a.setDescription(rs.getString(13));
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}
	
	 public List<Alumni> getFilteredAlumni(String name, String jobtitle, String employer) {
	        List<Alumni> list = new ArrayList<>();
	        try {
	            String query = "SELECT * FROM alumni WHERE name LIKE ? OR jobtitle LIKE ? OR employer LIKE ?";
	            PreparedStatement pstmt = conn.prepareStatement(query);
	            pstmt.setString(1, "%" + name + "%");
	            pstmt.setString(2, "%" + jobtitle + "%");
	            pstmt.setString(3, "%" + employer + "%");
	            ResultSet rs = pstmt.executeQuery();

	            while (rs.next()) {
	                Alumni alumni = new Alumni();
	                alumni.setId(rs.getInt("id"));
	                alumni.setName(rs.getString("name"));
	                alumni.setEmail(rs.getString("email"));
	                alumni.setLinkdin(rs.getString("linkdin"));
	                alumni.setField(rs.getString("field"));
	                alumni.setEmployer(rs.getString("employer"));
	                alumni.setJobtitle(rs.getString("jobtitle"));
	                alumni.setCompanyweb(rs.getString("companyweb"));
	                alumni.setComlinkdin(rs.getString("comlinkdin"));
	                alumni.setDescription(rs.getString("description"));

	                list.add(alumni);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return list;
	    }

		
		
	 
}
