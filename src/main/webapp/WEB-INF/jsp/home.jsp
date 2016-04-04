<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!doctype html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aquent Test Crud App</title>
    
    
	<spring:url value="/resources/css/foundation.css" var="mainCss" />
	<spring:url value="/resources/css/app.css" var="appCss" />    
	
    <spring:url value="/resources/js/vendor/jquery.js" var="jqueryMain" />
	<spring:url value="/resources/js/vendor/what-input.js" var="what-inputMain" /> 
    <spring:url value="/resources/js/vendor/foundation.js" var="foundation_js_Main" />
	<spring:url value="/resources/js/app.js" var="app_js_main" /> 
	
	<spring:url value="/resources/jqueryvalidation/jquery.validate.js" var="jQueryValidation" /> 
	

    <link href="${mainCss}" rel="stylesheet" />
    <link href="${appCss}" rel="stylesheet" />
    
    

  </head>
  <body>
  
  
<div class="top-bar">
<div class="top-bar-left">
<ul class="menu">
<li class="menu-text">Aquent</li>
</ul>
</div>
<div class="top-bar-right">
<ul class="menu">
<li></li>
<li></li>
<li></li>
<li></li>
</ul>
</div>
</div>
 
<div class="callout large primary">
<div class="row column text-center">
<h1>Aquent Test Crud App</h1>
</div>
</div>
<div class="row" id="content">
<div class="medium-8 columns">

<div class="blog-post">
<h3>Aquent Test Crud App Landing Page</h3>

<p>This is a simple demo CRUD app. Use the menus on the right to get started.<br><br>
The specification implied that there is a zero, one-to-many relationship between clients and contacts and a zero, one to one relationship between contacts and clients.
These relationships are reflected in the app. A contact will only be associated with at most one client. It is possible to have clients that are not associated with any 
contacts and vice versa.
<br><br>
I have completed the stories in the specification, however I'm hedging a little here and letting you know that the javascript validation seems to work best in Chrome.
<br><br>
I want to thank you for the opportunity and also tell you how much I enjoyed starting down the path of learning Spring. I haven't had the chance to use it before 
and I gave myself a crash course for this assignment. I'm going to incorporate it into my programming tool kit. 
<br><br>
Due to the obvious time constraints, this app is very simple. In a perfect world I would:

<br>* Change up the DB schema to allow for the complications of people and companies sharing addresses.
<br>* Configure a DB connection pool in the Tomcat settings as opposed to the one I configured in the application-beans.xml file.
<br>* Spend much more time on the front, making it look and act nice and also scalable for real world data. I used Foundation for the styling. That's another piece of kit I haven't had the opportunity to use.
I enjoyed playing around with it.
<br>* Add the glaringly missing unit tests as this started to turn into a real app.
<br><br>
Technologies used to develop the test app:
<br>* MySQL for the development database. The in-memory hsqldb is configured as well. Move some commet tags around in the application-beans.xml file to switch 
between the two. A script to set up a MySQL database is included in the webapp/resources directory.
<br>* Tomcat 8 (should work just fine on Tomcat 7).
<br>* Spring MVC and Spring JdbcTemplates.
<br>* JRebel (this one is a life saver).
<br>* Foundation for the styling.
<br>* jQuery and the Validation plugin from http://jqueryvalidation.org/.
<br>* The jsp pages use a combination of Java JSP tags and Spring form tags
<br><br>
I want to thank you again for your time and the opportunity. This was fun for me. Getting to program and learn some new things is not a bad way to go when it comes to a job interview.
<br><br>
I appreciate you consideration and I look forward to hearing from you.
<br><br>
</p>
<div class="callout">
<ul class="menu simple">
<li>Author: Brian Wallace</li>
</ul>
</div>
</div>










</div>
<div class="medium-3 columns" data-sticky-container>
<div class="sticky" data-sticky data-anchor="content">
<h4>Clients</h4>
<ul>
<li><a href="${pageContext.request.contextPath}/client/list">View</a></li>
<li><a href="${pageContext.request.contextPath}/client/create">Create</a></li>
</ul>
<h4>Contacts</h4>
<ul>
<li><a href="${pageContext.request.contextPath}/person/list">View</a></li>
<li><a href="${pageContext.request.contextPath}/person/create">Create</a></li>
</ul>
</div>
</div>
</div>




<script>
      $(document).foundation();
    </script>
 
    
	<script src="${jqueryMain}"></script>

    <script src="${foundation_js_Main}"></script>
    <script src="${app_js_main}"></script>
    <script src="${jQueryValidation}"></script>
    

    
  </body>
</html>
