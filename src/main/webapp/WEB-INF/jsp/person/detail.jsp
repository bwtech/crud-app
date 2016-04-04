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
<title>Aquent Test Crud App - Contact Detail</title>


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
			<h1>Contacts</h1>
		</div>
	</div>
	<div class="row" id="content">
		<div class="medium-8 columns">

			<div class="blog-post">
				<h3>
					Contact Detail
					<c:choose>
						<c:when test="${person.successfulUpdatePerformed}">
          - Update Successful
            </c:when>
					</c:choose>
				</h3>
				<p>
				<table>
					<thead>
						<tr>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>First Name:</td>
							<td><strong>${person.firstName}</strong></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Last Name:</td>
							<td><strong>${person.lastName}</strong></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Email Address:</td>
							<td><strong>${person.emailAddress}</strong></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Street Address:</td>
							<td><strong>${person.streetAddress}</strong></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>City:</td>
							<td><strong>${person.city}</strong></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>State:</td>
							<td><strong>${person.state}</strong></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Zip Code:</td>
							<td><strong>${person.zipCode}</strong></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Client:</td>
							<td><strong><c:choose>
										<c:when test="${person.currentlyAssociatedWithAClient}">
          ${person.client.companyName}
            </c:when>
										<c:otherwise>
                Not associated with a client
            </c:otherwise>
									</c:choose>
									</h3></strong></td>
							<td></td>
							<td></td>
						</tr>

					</tbody>
				</table>




				</p>
				<div class="callout">
					<ul class="menu simple">
						<center>
							<li><a
								href="${pageContext.request.contextPath}/person/edit/${person.personId}">Edit
									Contact</a></li> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;
							<li><a
								href="${pageContext.request.contextPath}/person/delete/${person.personId}">Delete
									Contact</a></li>
						</center>
					</ul>
				</div>
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

	<!--  
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>

-->
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





