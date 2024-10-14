<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import ="com.servlet.LoginServlet" %>
<%@ page import ="com.entity.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar Example</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .bg-custom {
            background-color: #343a40;
        }

        .navbar-brand span.w {
            color: #17a2b8;
        }

        .navbar-brand span {
            color: #ffffff;
        }

        .navbar-nav .nav-link {
            color: #ffffff !important;
        }

        .navbar-nav .nav-link:hover {
            color: #17a2b8 !important;
        }

        .btn-light {
            background-color: #ffffff;
            color: #343a40;
        }

        .btn-light:hover {
            background-color: #f8f9fa;
            color: #343a40;
        }

        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
        }

        .modal-content {
            border-radius: 15px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><span class="w">Wel</span><span>come</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a href="Index.html" class="nav-link active" aria-current="page">Home</a></li>

                <c:if test="${userobj.role eq 'admin' }">
                    <li class="nav-item"><a class="nav-link active" href="addjob.jsp">Job Post</a></li>
                    <li class="nav-item"><a class="nav-link active" href="view_job.jsp">Job View</a></li>
                </c:if>

                <c:if test="${userobj.role eq 'user' }">
                    <li class="nav-item"><a class="nav-link active" href="#">Training</a></li>
                    <li class="nav-item"><a class="nav-link active" href="alumniProf.jsp">Alumni Registration</a></li>
                    <li class="nav-item"><a class="nav-link active" href="alumniView.jsp">Connect</a></li>
                </c:if>
            </ul>
            <form class="d-flex">
                <c:if test="${userobj.role eq 'admin' }">
                    <a href="#" class="btn btn-light me-2"><i class="fas fa-user"></i> Admin</a>
                    <a href="logout" class="btn btn-light"><i class="fas fa-sign-out-alt"></i> Log out</a>
                </c:if>
                <c:if test="${userobj.role eq 'user' }">
                    <a href="#" class="btn btn-light me-2" data-bs-toggle="modal" data-bs-target="#profileModal"><i class="fas fa-user"></i> ${userobj.name}</a>
                    <a href="logout" class="btn btn-light"><i class="fas fa-sign-out-alt"></i> Log out</a>
                </c:if>
                <c:if test="${empty userobj}">
                    <a href="login.jsp" class="btn btn-light me-2"><i class="fas fa-sign-in-alt"></i> Login</a>
                    <a href="Signup.jsp" class="btn btn-light"><i class="fas fa-user-plus"></i> Signup</a>
                </c:if>
            </form>
        </div>
    </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="profileModalLabel">Profile</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="imgcontainer">
                            <img src="all_component/img/user.png" alt="Avatar" class="avatar">
                        </div>
                        <table class="table mt-3">
                            <tbody>
                                <tr>
                                    <th scope="row">Name</th>
                                    <td>${userobj.name}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Email</th>
                                    <td>${userobj.email}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Qualification</th>
                                    <td>${userobj.qualification}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <a href="editProfile.jsp" class="btn btn-success text-white">Edit</a>
            </div>
        </div>
    </div>
</div>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>

</body>
</html>
