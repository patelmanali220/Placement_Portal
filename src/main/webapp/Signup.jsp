<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<%@ page import ="com.servlet.RegisterServlet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<%@include file="all_component/all_css.jsp" %>

</head>
<body style="background-color:#f0f1f2">
<%@include file="all_component/navbar.jsp" %>
<div class="container-fluid">
<div class="row p-5">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<div class="text-center">
  
  <div class="imgcontainer">
    <img src="all_component/img/user.png" alt="Avatar" class="avatar">
  </div>

  <h1>Registration</h1>
</div>
                    <c:if test="${not empty succMsg}">
						<div class="alert alert-success" role="alert">${ succMsg }</div>
                         <c:remove var="succMsg"/>
					</c:if>
	<form action="add_user" method="post" >
	  <div class="mb-3">
    <label for="Name" class="form-label">Enter Full Name</label>
    <input type="text" class="form-control" id="Name" name="name" required>
  </div>
    <div class="mb-3">
    <label for="Qualification" class="form-label">Enter Qualification</label>
    <input type="text" class="form-control" id="Qualification" name="qua" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" id="Email1" aria-describedby="emailHelp" name="email" autocomplete="off" placeholder="Email" required>
   
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="Password1" name="ps" autocomplete="off" placeholder="password" required>
  </div>
  
  <button type="submit" class="btn btn-custom">Register</button>
</form>
</div>
</div>
</div>
</div>
</div>

</body>
</html>