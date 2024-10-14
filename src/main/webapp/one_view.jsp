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
<title>User : Single Jobs</title>
<%@ include file="all_component/all_css.jsp" %>
<style>
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
}

.card:hover {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.card-body {
    padding: 20px;
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
<body style="background-color:#f0f1f2;">

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@ include file="all_component/navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-12">
        
        <% 
int id=Integer.parseInt(request.getParameter("id"));
jobDAO dao=new jobDAO(DBConnect.getConn()); 
jobs j=dao.getJobById(id); %>
        <div class="card mt-5">
                <div class="card-body">
        
           <div class="text-center text-primary mb-3">
                        <i class="fas fa-laptop fa-3x"></i>
                    </div>
            
            <h5 class="card-title"><%=j.getTitle() %></h5>
                    <p class="card-text"><%=j.getDescription() %></p>
                    
                    <div class="row">
                        <div class="col-md-4 mb-2">
                            <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly>
                        </div>
                        <div class="col-md-4 mb-2">
                            <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory() %>" readonly>
                        </div>
                        
                    </div>
                    <h6 class="mt-3">Publish Date: <%= j.getPdate().toString() %></h6>
                    
                </div>
            </div>
            
        </div>
    </div>
</div>
<br>
<div class="footer">
<%@include file="all_component/footer.jsp" %>
</div>

</body>
</html>
