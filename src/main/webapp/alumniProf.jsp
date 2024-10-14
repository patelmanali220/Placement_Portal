<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import ="com.servlet.RegisterServlet" %>
	<%@ page import ="com.servlet.LoginServlet" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Alumni Registration</title>
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

.footer {
    margin-top: auto;
    background-color: #333;
    color: white;
    text-align: center;
    padding: 10px 0;
}

@media ( min-width : 768px) {
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
	<%@include file="all_component/navbar.jsp"%>

	<div class="card-container">
		<div class="card">
			<div class="card-body">
				<div class="text-center text-success">
					<div class="imgcontainer">
						<img src="all_component/img/user.png" alt="Avatar" class="avatar">
					</div>

					<c:if test="${not empty succMsg}">
						<div class="alert alert-success" role="alert">${ succMsg }</div>
                         <c:remove var="succMsg"/>
					</c:if>

					<h1>Alumni Registration</h1>
				</div>
				  <form action="alumni_Post" method="post">
                    <!-- Personal Information -->
                    <h5>Personal Information</h5>
                    <div class="form-group">
                        <label for="fullName">Name</label>
                        <input type="text" class="form-control" id="fullName" name="name" value="${userobj.name }" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="email">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" value="${userobj.qualification }" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="phone">Phone Number</label>
                            <input type="text" class="form-control" id="phone" name="phone" required>
                        </div>
                         <div class="form-group col-md-6">
                            <label for="linkedin">LinkedIn</label>
                            <input type="url" class="form-control" id="Plinkedin" name="linkdin">
                        </div>
                    </div>

                    <!-- Educational Background -->
                    <h5>Educational Background</h5>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="degree">Degree(s) Earned</label>
                            <input type="text" class="form-control" id="degree" name="degree" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="major">Technical Skills</label>
                            <input type="text" class="form-control" id="major" name="field" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="graduationYear">Graduation Year</label>
                        <input type="text" class="form-control" id="graduationYear" name="grad_yr" required>
                    </div>

                    <!-- Current Professional Information -->
                    <h5>Current Professional Information</h5>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="employer">Company Name</label>
                            <input type="text" class="form-control" id="employer" name="employer"  required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="jobTitle">Job Title</label>
                            <input type="text" class="form-control" id="jobTitle" name="jobtitle"   required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="companyWebsite">Company Website</label>
                            <input type="url" class="form-control" id="companyWebsite" name="companyweb">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="linkedin">Company LinkedIn Page</label>
                            <input type="url" class="form-control" id="Clinkedin" name="comlinkdin">
                        </div>
                    </div>
                    
                      <!-- Resume Upload
                    <div class="form-group">
                        <label for="resume">Upload Resume</label>
                        <input type="file" class="form-control-file" id="resume" name="resume" accept=".pdf,.doc,.docx" >
                    </div> -->

                    <!-- Description -->
                    <h5>Additional Information</h5>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" id="description" rows="4" name="description" required></textarea>
                    </div>

                    <!-- Submit Button -->
                    <button class="btn btn-success">Submit</button>
                </form>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>

</body>
</html>
