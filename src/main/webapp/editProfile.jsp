<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<%@ page import ="com.servlet.RegisterServlet" %>
<%@ page import ="com.servlet.LoginServlet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="all_component/all_css.jsp" %>

</head>
<body style="background-color:#f0f1f2">
  <c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
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

  <h1>Edit Profile</h1>
</div>
                    <c:if test="${not empty succMsg}">
						<div class="alert alert-success" role="alert">${ succMsg }</div>
                         <c:remove var="succMsg"/>
					</c:if>
	<form action="update_profile" method="post" >
	<input type="hidden" name="id" value="${userobj.id }">
	  <div class="mb-3">
    <label for="Name" class="form-label">Enter Full Name</label>
    <input type="text" class="form-control" id="Name" name="name" value="${userobj.name }" >
  </div>
    <div class="mb-3">
    <label for="Qualification" class="form-label">Enter Qualification</label>
    <input type="text" class="form-control" id="Qualification" name="qua" value="${userobj.password }">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" id="Email1" aria-describedby="emailHelp" name="email" autocomplete="off" placeholder="Email" value="${userobj.qualification }">
   
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="Password1" name="ps" autocomplete="off" placeholder="password" value="${userobj.email }">
  </div>
  
  <button type="submit" class="btn btn-primary badge-pill btn-block">Update</button>
</form>
</div>
</div>
</div>
</div>
</div>

</body>
</html>