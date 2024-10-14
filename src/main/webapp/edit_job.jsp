<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.DB.DBConnect"%>
<%@ page import ="com.entity.jobs" %>
<%@ page import ="com.DAO.jobDAO" %>
<%@ page import ="com.servlet.LoginServlet" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Jobs</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
body {
	background-color: #f0f1f2;
}

.card-container {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	padding: 20px;
}

.card {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	transition: transform 0.3s ease;
	width: 100%;
	max-width: 600px;
	margin-top: 50px; /* Adjust for navbar height */
	margin-bottom: 50px; /* Adjust for footer height */
}

.card:hover {
	transform: translateY(-5px);
}

.card-body {
	padding: 40px;
}

.text-center {
	margin-bottom: 30px;
}

.avatar {
	width: 150px;
	height: 150px;
	border-radius: 50%;
}

.form-group {
	margin-bottom: 20px;
}

.btn-success {
	width: 100%;
}

@media ( min-width : 768px) {
	.col-md-10 {
		max-width: 720px;
	}
}
</style>
</head>
<body>
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>

</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="card-container">
		<div class="card">
			<div class="card-body">
				<div class="text-center text-success">
					<div class="imgcontainer">
						<img src="all_component/img/user.png" alt="Avatar" class="avatar">
					</div>

			<% 
			int id=Integer.parseInt(request.getParameter("id"));
			jobDAO dao=new jobDAO(DBConnect.getConn()); 
			jobs j=dao.getJobById(id); %>
					<h1>Edit Jobs</h1>
				</div>
				<form action="update" method="post">
				
				<input type="hidden" value="<%=j.getId() %>" name="id">
					<div class="form-group">
						<label>Enter Title</label> <input type="text" class="form-control"
							name="title" required value="<%=j.getTitle() %>">
					</div>
					<div class="form-group row">
						<div class="col-md-6">
							<label>Location</label> <br> <select name="location"
								class="custom-select" id="inlineFormCustomSelectPref">
								<option selected value="location" >Choose</option>

								<option value="Andhra Pradesh">Andhra Pradesh</option>
								<option value="Arunachal Pradesh">Arunachal Pradesh</option>
								<option value="Assam">Assam</option>
								<option value="Banglore">Banglore</option>
								<option value="Bihar">Bihar</option>
								<option value="Bhubaneswar">Bhubaneswar</option>
								<option value="Chennai">Chennai</option>
								<option value="Delhi">Delhi</option>
								<option value="Gujarat">Gujarat</option>
								<option value="Haryana">Haryana</option>
								<option value="Himachal Pradesh">Himachal Pradesh</option>
								<option value="Jammu and Kashmir">Jammu and Kashmir</option>
								<option value="Goa">Goa</option>
								<option value="Jharkhand">Jharkhand</option>
								<option value="Karnataka">Karnataka</option>
								<option value="Kerala">Kerala</option>
								<option value="Madhya Pradesh">Madhya Pradesh</option>
								<option value="Maharashtra">Maharashtra</option>
								<option value="Odisha">Odisha</option>
								<option value="Punjab">Punjab</option>
								<option value="Rajasthan">Rajasthan</option>
								<option value="Tamil Nadu">Tamil Nadu</option>
								<option value="Telangana">Telangana</option>
								<option value="Tripura">Tripura</option>
								<option value="Uttarakhand">Uttarakhand</option>
								<option value="Uttar Pradesh">Uttar Pradesh</option>
								<!-- Options removed for brevity -->
							</select>
						</div>
						<br>
				    <div class="form-group row">
						<div class="col-md-6">
                            <label>Category</label> <br> <select name="category"
								class="custom-select" id="inlineFormCustomSelectPref">
								<option selected value="cat" >Choose</option>

								<option value="IT">IT</option>
								<option value="Finance and Accounting">Finance and Accounting</option>
							     <option value="Sales and Marketing">Sales and Marketing</option>
								<option value="Education and Training">Education and Training</option>
								<option value="Arts, Design, and Media">Arts, Design, and Media</option>
								<option value="Science and Research">Science and Research</option>
								<option value="Business and Management">Business and Management</option>
								<option value="Construction">Construction</option>
								<option value="Customer Service">Customer Service</option>
								<option value="Manufacturing and Production">Manufacturing and Production</option>
								<!-- Options removed for brevity -->
							</select>
						</div>
						
                        </div>
						<div class="col-md-6">
							<label>Status</label> <select class="form-control" name="status">
							    <option class="Active" value="<%=j.getStatus() %>"><%=j.getStatus() %></option>
								<option class="Active" value="Active">Active</option>
								<option class="Inactive" value="Inactive">Inactive</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label>Enter Description</label>
						<textarea required rows="6" name="desc" class="form-control"><%=j.getDescription() %></textarea>
					</div>
					<button class="btn btn-success">Update Job</button>
				</form>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>

</body>
</html>
