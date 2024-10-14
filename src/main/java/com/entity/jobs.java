package com.entity;

public class jobs {
	private int id;
    private String title;
    private String description;
    private String category;
    private String location;
    private String pdate;
    private String status;
    
	public jobs() {
		super();
		// TODO Auto-generated constructor stub
	}


	public jobs(String title, String description, String category, String location, String pdate , String status) {
		super();
		this.title = title;
		this.description = description;
		this.category = category;
		this.location = location;
		this.pdate = pdate;
		this.status = status;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getPdate() {
		return pdate;
	}


	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		// TODO Auto-generated method stub
		this.status = status;
	}
    
    
    
}
