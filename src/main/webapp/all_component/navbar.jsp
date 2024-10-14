<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<%@ page import ="com.servlet.LoginServlet" %>
<%@ page import ="com.entity.User" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><span class="w">Wel</span><span>come</span></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a href="Index.html" class="nav-link active"
					aria-current="page" >Home</a></li>
				
				<c:if test="${userobj.role eq 'admin' }">
			   <li class="nav-item"><a class="nav-link active" href="addjob.jsp">Job
						Post</a></li>

				<li class="nav-item"><a class="nav-link active" href="view_job.jsp">Job
						View</a></li>
				</c:if>	
				
	<c:if test="${userobj.role eq 'user' }">	
				  <li class="nav-item"><a class="nav-link active" href="training.jsp">
						LearnHub</a></li>
						<li class="nav-item"><a class="nav-link active" href="alumniProf.jsp">
						Alumni Registration</a></li>
						<li class="nav-item"><a class="nav-link active" href="alumniView.jsp">
						Connect</a></li>
			    </c:if>
			</ul>
			<form class="form-inline my-2 my-lg-0">
			
			<c:if test="${userobj.role eq 'admin' }">
			   <a href="#" class="btn btn-light mr-1"><i
					class="fa-solid fa-user"></i> Admin</a> 
					<a href="logout" class="btn btn-light mr-1"><i
					class="fa-solid fa-right-to-bracket"></i> Log out</a>
				</c:if>	
				<c:if test="${userobj.role eq 'user' }">	
				<a href="#" class="btn btn-light mr-1"  data-bs-toggle="modal" data-bs-target="#exampleModal"><i
					class="fa-solid fa-user"></i> ${userobj.name } </a>	
					<a href="logout" class="btn btn-light mr-1"><i
					class="fa-solid fa-right-to-bracket"></i> Log out</a>
			    </c:if>
				
			<c:if test="${ empty userobj}">
				<a href="login.jsp" class="btn btn-light mr-1"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a> <a
					href="Signup.jsp" class="btn btn-light"><i
					class="fa-solid fa-user"></i> Signup</a>
			</c:if>		
			</form>
		</div>
	</div>
</nav>

<!-- Button trigger modal 
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>-->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
      <div class="card">
			<div class="card-body">
				<div class="text-center text-primary">
					<div class="imgcontainer">
						<img src="all_component/img/user.png" alt="Avatar" class="avatar">
					</div>
        
        <table class="table" >
        
        <tbody>
        
        <tr>
         <th scope="row">Name</th>
          <th>${userobj.name }</th>
        </tr>
        
            <tr>
         <th scope="row">Email</th>
          <th>${userobj.qualification}</th>
        </tr>
        
         <tr>
         <th scope="row">Qualification</th>
          <th>${userobj.password}</th>
        </tr>
        
     
        
        </tbody>
        
        </table>
         </div>
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