<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.jobDAO" %>
<%@ page import="com.entity.jobs" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User : View Jobs</title>
<%@ include file="all_component/all_css.jsp" %>
<style type="text/css">
   body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}
.card {
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: box-shadow 0.3s ease-in-out;
    margin-bottom:30px;
}

.card:hover {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.card-body {
    padding: 20px;
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
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.btn-success:hover {
    background-color: #45a049;
}

    @media (min-width: 768px) {
        .col-md-10 {
            max-width: 720px;
        }
    }
</style>
</head>
<body>
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@ include file="all_component/navbar.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="text-center text-primary">
                <h1>All Jobs</h1>
            </div>
            <c:if test="${not empty succMsg}">
                <div class="alert alert-success" role="alert">${succMsg}</div>
                <c:remove var="succMsg" />
            </c:if>
            <div class="card mt-2">
                <div class="card-body">
                    <form class="form-inline" action="more_view.jsp" method="get">
                       <div class="form-group row">
						<div class="col-md-6">
                            <label>Location</label> <br> <select name="location"
								class="custom-select" id="inlineFormCustomSelectPref">
								<option selected value="lo" >Choose</option>

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
                       
                        
                       <br>
                        <button class="btn btn-success">Submit</button>
                    </form>
                </div>
            </div>

            <%
                jobDAO dao = new jobDAO(DBConnect.getConn());
                List<jobs> list = dao.getAllJobs();
                for (jobs j : list) {
            %>
            <div class="card mt-2">
                <div class="card-body">
                    <div class="text-center text-primary mb-3">
                        <i class="fas fa-laptop fa-3x"></i>
                    </div>
                    <h5 class="card-title"><%= j.getTitle() %></h5>
                    <p class="card-text">
                        <%= j.getDescription().length() > 0 && j.getDescription().length() < 120 
                            ? j.getDescription() 
                            : j.getDescription().substring(0, 120) + "..." %>
                    </p>
                    <br>
                    <div class="row">
                        <div class="col-md-4 mb-2">
                            <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly>
                        </div>
                        <div class="col-md-4 mb-2">
                            <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory() %>" readonly>
                        </div>
                        <div class="col-md-4 mb-2">
                            <input type="text" class="form-control form-control-sm" value="Status: <%= j.getStatus() %>" readonly>
                        </div>
                    </div>
                    <h6 class="mt-3">Publish Date: <%= j.getPdate().toString() %></h6>
                    <div class="text-center mt-3">
                        <a href="one_view.jsp?id=<%= j.getId() %>" class="btn btn-success text-white">View More</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>

<%@ include file="all_component/footer.jsp" %>

</body>
</html>
