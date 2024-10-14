<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<%@ page import ="com.servlet.LoginServlet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
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
  <h1>Login</h1>
</div>
                   <c:if test="${not empty succMsg}">
						<div class="alert alert-success" role="alert">${ succMsg }</div>
                         <c:remove var="succMsg"/>
					</c:if>
	<form action="Login" method="post">
  <div class="mb-3">
    <label for="Email1" class="form-label">Email address</label>
    <input type="email" class="form-control" name="email" id="Email1" aria-describedby="emailHelp" required>
   
  </div>
  <div class="mb-3">
    <label for="Password1" class="form-label" >Password</label>
    <input type="password" class="form-control" name="password" id="Password1" required>
  </div>
  <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Remember</label>
  </div>
  <button type="submit" class="btn btn-custom">Login</button>
</form>
</div>
</div>
</div>
</div>
</div>

</body>
</html>