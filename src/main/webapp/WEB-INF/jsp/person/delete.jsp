
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
<title>Aquent Test Crud App - Delete Contact</title>


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
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>

	<div class="callout large primary">
		<div class="row column text-center">
			<h1>Delete Contact</h1>
		</div>
	</div>
	<div class="row" id="content">
		<div class="medium-8 columns">

			<div class="blog-post">
				<h4>You are about to delete the contact: ${person.firstName}
					${person.lastName}</h4>
				<h4>Are you sure?</h4>
				<br>


				<form action="${pageContext.request.contextPath}/person/delete"
					method="post">
					<input type="hidden" name="personId" value="${person.personId}" />
					<input class="button" type="submit" name="command" value="Cancel" />
					<input class="alert button" type="submit" name="command"
						value="Delete" />
				</form>


				<p></p>
				<div class="callout">
					<ul class="menu simple">
						<li></li>
						<li></li>
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



