<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection" %>
<%@ page import ="com.servlet.LoginServlet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp" %>
<style type="text/css">
.back-img {
    background: url("all_component/img/home1.jpg");
    width: 100%;
    height: 100vh;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
}
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>



<div class="container-fluid back-img">
 <div class="container-fluid">
<div class="text-center">
<h1 class="tex" >
<i class="fa-solid fa-business-time"></i> JOBS
</h1>
</div>
</div>
</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>