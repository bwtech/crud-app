<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aquent Test Crud App - Client Detail</title>


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
					<h3>
						Cient Detail
						<c:choose>
							<c:when test="${client.successfulUpdatePerformed}">
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
								<td>Company Name:</td>
								<td><strong>${client.companyName}</strong></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>Web Address:</td>
								<td><strong><a href="http://${client.webURI}">${client.webURI}<a /></strong></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>Phone Number:</td>
								<td><strong>${client.phoneNumber}</strong></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>Street Address:</td>
								<td><strong>${client.streetAddress}</strong></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>City:</td>
								<td><strong>${client.city}</strong></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>State:</td>
								<td><strong>${client.state}</strong></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>Zip Code:</td>
								<td><strong>${client.zipCode}</strong></td>
								<td></td>
								<td></td>
							</tr>


						</tbody>
					</table>
					<br /> <strong>Contacts associated with this client</strong>
					<c:choose>
						<c:when test="${fn:length(client.contacts) gt 0}">
							<table>
								<thead>
									<tr>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Email Address</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${client.contacts}" var="person">
										<tr>
											<td>${person.firstName}</td>
											<td>${person.lastName}</td>
											<td>${person.emailAddress}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<p>No contacts associated with this client.</p>
						</c:otherwise>
					</c:choose>







					</p>
					<div class="callout">
						<ul class="menu simple">
							<center>
								<li><a
									href="${pageContext.request.contextPath}/client/edit/${client.clientId}">Edit
										Client</a></li> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;
								<li><a
									href="${pageContext.request.contextPath}/client/delete/${client.clientId}">Delete
										Client</a></li>
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
						<li><a
							href="${pageContext.request.contextPath}/client/create">Create</a></li>

					</ul>
					<h4>Contacts</h4>
					<ul>
						<li><a href="${pageContext.request.contextPath}/person/list">View
								All</a></li>
						<li><a
							href="${pageContext.request.contextPath}/person/create">Create</a></li>
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

		<script src="${foundation_js_Main}"></script>
		<script src="${app_js_main}"></script>
		<script src="${jQueryValidation}"></script>
</body>
</html>




















