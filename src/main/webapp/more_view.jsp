<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
    
  .footer {
    margin-top: auto;
    background-color: #333;
    color: white;
    text-align: center;
    padding: 10px 0;
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
           
            <%  
               String location = request.getParameter("location");
               String category = request.getParameter("category");
               String msg = "";
               
               jobDAO dao = new jobDAO(DBConnect.getConn());
               List<jobs> list = null;
               
               if("lo".equals(location) && "cat".equals(category)){
               list = new ArrayList<jobs>();
               msg = "Job Not Available";
               } else if("lo".equals(location) || "cat".equals(category)){
               list = dao.getJobsORLocationORCate(category, location);
               } else{
            	   list = dao.getJobsAndLocationAndCate(category, location);
               }
              
               if(list.isEmpty()){
            	   %>
            	   <h4 class="text-center text-danger" >Job Not Available </h4>
               <% 
               }
               if(list != null){
            	   
               for(jobs j : list){
            %>
            <div class="card mt-2">
                <div class="card-body">
                    <div class="text-center text-primary mb-3">
                        <i class="fas fa-laptop fa-3x"></i>
                    </div>
                    
                     <h5 class="card-title"><%=j.getTitle() %></h5>
                     
                     <% if (j.getDescription().length() > 0 && j.getDescription().length() <120) {
                    		 %>
						  <p class="card-text"><%=j.getDescription() %>.</p>
						<% 
						} else {
							%>
						<p><%= j.getDescription().substring(0,120)%>...
						
						</p>
						<% 
						}  
						%>
                   
                    
                    
                  
                    
                    <div class="row">
                        <div class="col-md-4 mb-2">
                            <input type="text" class="form-control form-control-sm" value="Location:<%=j.getLocation() %>" readonly>
                        </div>
                        <div class="col-md-4 mb-2">
                            <input type="text" class="form-control form-control-sm" value="Category:<%=j.getCategory() %>" readonly>
                        </div>
                        
                    </div>

                    <h6 class="mt-3">Publish Date: <%=j.getPdate() %></h6>

                   <div class="text-center mt-3">
                        <a href="one_view.jsp?id=<%= j.getId() %>" class="btn btn-success text-white">View More</a>
                    </div>
                </div>
            </div>
           <%
            } 
            }
               else {
            %>
            <h4 class="text-center text-danger"><%=msg %></h4>
            <%
            }
               %>
        </div>
    </div>
</div>

</body>
</html>
