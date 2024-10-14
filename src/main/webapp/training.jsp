<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import ="com.servlet.RegisterServlet" %>
	<%@ page import ="com.servlet.LoginServlet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Training</title>
    <%@include file="all_component/all_css.jsp"%>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .header {
            background-color: #4CAF50;
            color: white;
            padding: 10px 0;
            text-align: center;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        }
        .container {
            display: flex;
            flex-direction: row;
            overflow: hidden;
        }
        .sidebar {
            width: 20%;
            background-color: #333;
            padding: 15px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            height: 100vh;
            overflow-y: auto;
            transition: width 0.3s ease;
        }
        .sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 10px 0;
            margin-bottom: 10px;
            transition: background-color 0.3s ease;
        }
        .sidebar a:hover {
            background-color: #575757;
        }
        .main-content {
            width: 80%;
            padding: 20px;
            overflow-y: auto;
            height: 100vh;
            transition: width 0.3s ease;
        }
        .section {
            margin-bottom: 30px;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }
        .section:hover {
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }
        .section h2 {
            color: #4CAF50;
            font-size: 24px;
            margin-bottom: 10px;
        }
        .section p {
            color: #555;
            font-size: 16px;
            line-height: 1.6;
        }
        .course-links a {
            display: block;
            color: #4CAF50;
            text-decoration: none;
            margin-bottom: 5px;
            transition: color 0.3s ease;
        }
        .course-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<%@include file="all_component/navbar.jsp"%>
    <div class="header">
        <h1>LearnHub</h1>
    </div>
    <div class="container">
        <div class="sidebar">
            <a href="#course-tutorial">Online Course and Tutorial</a>
            <a href="#mock-interviews">Mock Interviews</a>
            <a href="#resume-building">Resume Building</a>
            <a href="#aptitude-test-practice">Aptitude Test Practice</a>
            <a href="#coding-practice">Coding Practice</a>
            <a href="#interview-questions">Interview Questions</a>
        </div>
        <div class="main-content">
            <div class="section" id="course-tutorial">
                <h2>Online Course and Tutorial</h2>
                <p>Here are some popular online platforms where you can find a wide range of courses.</p>
                <div class="course-links">
                    <a href="https://www.w3schools.com/" target="_blank">W3Schools</a>
                    <a href="https://www.tutorialspoint.com/" target="_blank">Tutorialspoint</a>
                    <a href="https://www.geeksforgeeks.org/" target="_blank">GeeksforGeeks</a>
                    <a href="https://www.javatpoint.com/" target="_blank">Javatpoint</a>
                </div>
            </div>
            <div class="section" id="mock-interviews">
                <h2>Mock Interviews</h2>
                <p>Practice mock interviews to prepare for your next job interview.</p>
                  <div class="course-links">
                   <a href="https://remasto.com/?gad_source=1&gclid=CjwKCAjwps-zBhAiEiwALwsVYTXY9i8eGeWsU6FOn4gZbfzKO6THwAt6PBcyXOfQqtXeW4bZlSQYgBoC4N4QAvD_BwE" target="_blank">Remasto</a>
                    <a href="https://practiceinterview.online/" target="_blank">Practiceinterview</a>
                    <a href="https://myinterviewpractice.com/" target="_blank">Myinterviewpractice</a>
                    <a href="https://interviewing.io/" target="_blank">Interviewing</a>
                    <a href="https://www.pramp.com/#/" target="_blank">Pramp</a>
                    
                </div>
            </div>
            <div class="section" id="resume-building">
                <h2>Resume Building</h2>
                <div class="course-links">
                <p>Get tips and templates for building a strong resume.</p>
                <a href="https://www.indeed.com/career-advice/resumes-cover-letters/website-for-resume-templates" target="_blank">Tips</a>
                    <a href="https://www.canva.com/create/resumes/" target="_blank">Templates</a>
                </div>
            </div>
            <div class="section" id="aptitude-test-practice">
                <h2>Aptitude Test Practice</h2>
                <p>Practice aptitude tests to improve your problem-solving skills.</p>
                  <div class="course-links">
                    
                    <a href="https://www.indiabix.com/" target="_blank">indiabix</a>
                    <a href="https://prepinsta.com/" target="_blank">PrepInsta</a>
                
                </div>
            </div>
  
   <div class="section" id="coding-practice">
                <h2>Coding Practice</h2>
                <p>Engage in coding practice to sharpen your programming skills.</p>
                   <div class="course-links">
                    <a href="https://www.codechef.com/practice" target="_blank">CodeChef</a>
                    <a href="https://www.hackerearth.com/practice/" target="_blank">HackerEarth</a>
                    <a href="https://leetcode.com/" target="_blank">LeetCode</a>
                    <a href="https://www.hackerrank.com/" target="_blank">HackerRank</a>
                </div>
            </div>
  
            <div class="section" id="interview-questions">
                <h2>Interview Questions</h2>
                <p>Access interview questions.</p>
                  <div class="course-links">
                    
                    <a href="https://in.indeed.com/career-advice/interviewing/top-interview-questions-and-answers" target="_blank">ClickHere</a>
                    
                
                </div>
            </div>
        </div>
    </div>
</body>
</html>
