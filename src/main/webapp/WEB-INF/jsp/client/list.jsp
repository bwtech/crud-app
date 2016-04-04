<%-- 
    Document   : list
    Created on : Apr 3, 2016
    Author     : BWallace
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aquent Test Crud App - Clients</title>


<spring:url value="/resources/css/foundation.css" var="mainCss" />
<spring:url value="/resources/css/app.css" var="appCss" />

<spring:url value="/resources/js/vendor/jquery.js" var="jqueryMain" />
<spring:url value="/resources/js/vendor/what-input.js"
	var="what-inputMain" />
<spring:url value="/resources/js/vendor/foundation.js"
	var="foundation_js_Main" />
<spring:url value="/resources/js/app.js" var="app_js_main" />

<spring:url value="/resources/jqueryvalidation/jquery.validate.js"
	var="jQueryValidation" />


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
				<li><a href="${pageContext.request.contextPath}/">Home</a></li>
				<li><a href="#"></a></li>
				<li><a href="#"></a></li>
				<li><a href="#"></a></li>
			</ul>
		</div>
	</div>

	<div class="callout large primary">
		<div class="row column text-center">
			<h1>Clients</h1>
		</div>
	</div>
	<div class="row" id="content">
		<div class="medium-8 columns">

			<div class="blog-post">
				<h3>Client List</h3>
				<p>

					<c:choose>
						<c:when test="${fn:length(clients) gt 0}">
							<table>
								<thead>
									<tr>
										<th>Company Name</th>
										<th>Web Site</th>
										<th>Phone Number</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${clients}" var="client">
										<tr>
											<td>${client.companyName}</td>
											<td><a href="http://${client.webURI}">${client.webURI}</a>&nbsp;
												&nbsp;&nbsp;</td>
											<td>${client.phoneNumber}</td>
											<td><a
												href="${pageContext.request.contextPath}/client/detail/${client.clientId}">Details</a>
												&nbsp; &nbsp;&nbsp;&nbsp; <a
												href="${pageContext.request.contextPath}/client/edit/${client.clientId}">Edit</a>
												&nbsp; &nbsp;&nbsp;&nbsp; <a
												href="${pageContext.request.contextPath}/client/delete/${client.clientId}">Delete</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<p>No results found.</p>
						</c:otherwise>
					</c:choose>

				</p>

			</div>










		</div>
		<div class="medium-3 columns" data-sticky-container>
			<div class="sticky" data-sticky data-anchor="content">
				<h4>Clients</h4>
				<ul>
					<li><a href="${pageContext.request.contextPath}/client/list">View
							All</a></li>
					<li><a href="${pageContext.request.contextPath}/client/create">Create</a></li>
				</ul>
				<h4>Contacts</h4>
				<ul>
					<li><a href="${pageContext.request.contextPath}/person/list">View
							All</a></li>
					<li><a href="${pageContext.request.contextPath}/person/create">Create</a></li>
				</ul>
			</div>
		</div>
	</div>



	<script>
      $(document).foundation();
    </script>


	<script src="${jqueryMain}"></script>
	<script src="${what-inputMain}"></script>
	<script src="${foundation_js_Main}"></script>
	<script src="${app_js_main}"></script>
	<script src="${jQueryValidation}"></script>



</body>
</html>



