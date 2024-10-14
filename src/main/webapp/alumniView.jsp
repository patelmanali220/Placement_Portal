<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.AlumniDAO" %>
<%@ page import="com.entity.Alumni" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Alumni Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <%@ include file="all_component/all_css.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-XXX" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .card {
            margin: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            overflow: hidden;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }
        .card-header {
            background: linear-gradient(135deg, #007bff, #0056b3);
            color: white;
            font-size: 1.25em;
            border-radius: 15px 15px 0 0;
            padding: 15px;
            text-align: center;
        }
        .card-body {
            padding: 20px;
            background-color: #f9f9f9;
        }
        .container {
            margin-top: 20px;
        }
        .filter-icon {
            cursor: pointer;
            font-size: 1.5em;
        }
        .filter-form {
            display: none;
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #f8f9fa;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .filter-form.show {
            display: block;
        }
        .card-text i {
            margin-right: 10px;
        }
        .card-text {
            font-size: 1.1em;
        }
        .card-title {
            font-size: 1.5em;
            margin-bottom: 15px;
        }
          .connect-btn {
            background: linear-gradient(135deg, #28a745, #218838);
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 50px;
            transition: background 0.3s;
        }
        .connect-btn:hover {
            background: linear-gradient(135deg, #218838, #1e7e34);
        }
        .read-more-btn {
            background: linear-gradient(135deg, #ffc107, #e0a800);
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 50px;
            transition: background 0.3s;
        }
        .read-more-btn:hover {
            background: linear-gradient(135deg, #e0a800, #c49100);
        }
        .more-details {
            display: none;
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
<body style="background-color:#e9ecef">

<%@ include file="all_component/navbar.jsp" %>
<div class="text-center text-primary mb-4">
    <h1>Build Connections</h1>
    <p>Discover and connect with our esteemed alumni.</p>
</div>
<div class="container">
    <!-- Filter Icon -->
    <div class="text-end mb-3">
        <i class="fas fa-filter filter-icon" id="filterToggle" title="Filter Alumni"></i>
    </div>
    <!-- Filter Form -->
    <div class="filter-form" id="filterForm">
        <form action="alumniview.jsp" method="get" class="row g-3">
            <div class="col-md-4">
                <label for="name" class="form-label">Name</label>
                <input type="text" id="name" name="name" class="form-control">
            </div>
            <div class="col-md-4">
                <label for="jobtitle" class="form-label">Job Title</label>
                <input type="text" id="jobtitle" name="jobtitle" class="form-control">
            </div>
            <div class="col-md-4">
                <label for="employer" class="form-label">Company Name</label>
                <input type="text" id="employer" name="employer" class="form-control">
            </div>
            <div class="col-12 text-end">
                <button type="submit" class="btn btn-primary">Filter</button>
                <span class="ms-2"><i class="fas fa-times filter-icon" id="filterClose" title="Close Filter"></i></span>
            </div>
        </form>
    </div>

    <%  
        String name = request.getParameter("name");
        String jobtitle = request.getParameter("jobtitle");
        String employer = request.getParameter("employer");
        
        AlumniDAO dao = new AlumniDAO(DBConnect.getConn());
        List<Alumni> list = null;

        if((name == null || name.isEmpty()) && (jobtitle == null || jobtitle.isEmpty()) && (employer == null || employer.isEmpty())){
            list = dao.getAllAlumni();
        } else {
            list = dao.getFilteredAlumni(name, jobtitle, employer);
        }
    %>

    <% if(list.isEmpty()) { %>
        <h4 class="text-center text-danger">No Alumni Found</h4>
    <% } else { %>
        <div class="row">
            <% for(Alumni a : list) { %>
                <!-- Alumni Detail Cards -->
                <div class="col-md-6 col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <i class="fas fa-user-graduate"></i> Alumni Details
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-user"></i> <%= a.getName() %></h5>
                            <p class="card-text"><i class="fas fa-envelope"></i> <strong>Email:</strong> <%= a.getEmail() %></p>
                            <p class="card-text"><i class="fas fa-id-badge"></i> <strong>Job Title:</strong> <%= a.getJobtitle() %></p>
                            <p class="card-text"><i class="fas fa-briefcase"></i> <strong>Skills:</strong> <%= a.getField() %></p>
                             
                          <%-- <p class="card-text"><i class="fas fa-id-badge"></i> <strong>Job Title:</strong> <%= a.getJobtitle() %></p>
                            <p class="card-text"><i class="fas fa-globe"></i> <strong>Company Website:</strong> <a href="<%= a.getCompanyweb() %>" target="_blank"><%= a.getCompanyweb() %></a></p>
                            <p class="card-text"><i class="fab fa-linkedin"></i> <strong>Company LinkedIn:</strong> <a href="<%= a.getComlinkdin() %>" target="_blank"><%= a.getComlinkdin() %></a></p>
                            <p class="card-text"><i class="fas fa-info-circle"></i> <strong>Description:</strong> <%= a.getDescription() %></p>--%>  
                             <div class="text-center mt-4">
                                <a class="btn read-more-btn" href="one_alumniview.jsp?id=<%= a.getId() %>" ><i class="fas fa-plus"></i> Read More</a>
                                <a href="<%= a.getLinkdin() %>"class="btn connect-btn" target="_blank"><i class="fas fa-paper-plane"></i> Connect</a>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    <% } %>
</div>

<!-- Bootstrap and Font Awesome JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js" integrity="sha512-XXX" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const filterToggle = document.getElementById('filterToggle');
        const filterForm = document.getElementById('filterForm');
        const filterClose = document.getElementById('filterClose');

        filterToggle.addEventListener('click', function() {
            filterForm.classList.toggle('show');
        });

        filterClose.addEventListener('click', function() {
            filterForm.classList.remove('show');
        });
    });
</script>
<div class="footer">
<%@include file="all_component/footer.jsp" %>
</div>
</body>
</html>