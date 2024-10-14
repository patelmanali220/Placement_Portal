package com.entity;

public class Alumni {
	
		private int id;
	    private String name;
	    private String email;
	    private String phone;
	    private String linkdin;
	    private String degree;
	    private String field;
	    private String grad_yr;
	    private String employer;
	    private String jobtitle;
	    private String companyweb;
	    private String comlinkdin;
	    //private String resume;
	    private String description;
	    
  
	    
		public Alumni() {
			super();
			// TODO Auto-generated constructor stub
		}
		
		public Alumni(String name, String email, String phone, String linkdin, String degree, String field,
				String grad_yr, String employer, String jobtitle, String companyweb, String comlinkdin, //String resume,
				String description) {
			super();
			
			this.name = name;
			this.email = email;
			this.phone = phone;
			this.linkdin = linkdin;
			this.degree = degree;
			this.field = field;
			this.grad_yr = grad_yr;
			this.employer = employer;
			this.jobtitle = jobtitle;
			this.companyweb = companyweb;
			this.comlinkdin = comlinkdin;
			//this.resume = resume;
			this.description = description;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getLinkdin() {
			return linkdin;
		}
		public void setLinkdin(String linkdin) {
			this.linkdin = linkdin;
		}
		public String getDegree() {
			return degree;
		}
		public void setDegree(String degree) {
			this.degree = degree;
		}
		public String getField() {
			return field;
		}
		public void setField(String field) {
			this.field = field;
		}
		public String getGrad_yr() {
			return grad_yr;
		}
		public void setGrad_yr(String grad_yr) {
			this.grad_yr = grad_yr;
		}
		public String getEmployer() {
			return employer;
		}
		public void setEmployer(String employer) {
			this.employer = employer;
		}
		public String getJobtitle() {
			return jobtitle;
		}
		public void setJobtitle(String jobtitle) {
			this.jobtitle = jobtitle;
		}
		public String getCompanyweb() {
			return companyweb;
		}
		public void setCompanyweb(String companyweb) {
			this.companyweb = companyweb;
		}
		public String getComlinkdin() {
			return comlinkdin;
		}
		public void setComlinkdin(String comlinkdin) {
			this.comlinkdin = comlinkdin;
		}
		/*public String getResume() {
			return resume;
		}
		public void setResume(String resume) {
			this.resume = resume;
		}*/
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
	    
		

}
