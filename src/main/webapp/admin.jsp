<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import ="com.servlet.LoginServlet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="all_component/all_css.jsp" %>
<style>
    body, html {
        height: 100%;
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .back-img {
        background: url("all_component/img/ad1.jpg") no-repeat center center fixed;
        background-size: cover;
        height: 100vh;
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .overlay {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.5);
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .text-custom {
        font-size: 3rem;
        color: #fff;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
        z-index: 1;
    }
    .footer {
    margin-top: auto;
    background-color: #333;
    color: white;
    text-align: center;
    padding: 10px 0;
}
</style>
</head>
<body>
<c:if test="${userobj.role ne 'admin'}">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="all_component/navbar.jsp" %>
<div class="back-img">
    <div class="overlay">
        <h1 class="text-custom">Welcome Admin</h1>
    </div>
</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>
