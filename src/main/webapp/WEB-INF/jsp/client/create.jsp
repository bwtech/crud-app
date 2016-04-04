
<%-- 
    Document   : list
    Created on : Apr 3, 2016
    Author     : BWallace
--%>
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
<title>Aquent Test Crud App - Add a Client</title>


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

<script>
	$.validator.setDefaults({
		submitHandler: function() {
			alert("submitted!");
		}
	});

	$().ready(function() {

		// validate signup form on keyup and submit
		$("#editForm").validate({
			rules: {
				companyName: {
					required: true,
					minlength: 1,
					maxlength: 50
				},
				webURI: {
					required: true,
					minlength: 1,
					maxlength: 50
				},
				phoneNumber: {
					required: true,
					minlength: 1,
					maxlength: 50
				},
				streetAddress: {
					required: true,
					minlength: 1,
					maxlength: 50
				},
				city: {
					required: true,
					minlength: 1,
					maxlength: 50
				},
				state: {
					required: true,
					minlength: 2,
					maxlength: 2
				},
				zipCode: {
					required: true,
					minlength: 5,
					maxlength: 5
				}
			},
			messages: {
				companyName: {
					required: "Please enter a company name",
					minlength: "The company name must have at least 1 character",
					maxlength: "The company name can't have more than 50 characters"
				},
				webURI: {
					required: "Please enter a web address",
					minlength: "The web address must have at least 1 character",
                    maxlength: "The web address can't have more than 50 characters"
				},
				phoneNumber: {
					required: "Please enter an phone number",
					minlength: "The phone number must have at least 1 character",
                    maxlength: "The phone number can't have more than 50 characters"
				},
				streetAddress: {
					required: "Please enter a street address",
					minlength: "The  street address must have at least 1 character",
                    maxlength: "The street address can't have more than 50 characters"
				},
				city: {
					required: "Please enter a city",
					minlength: "The city name must have least at 1 character",
                    maxlength: "The city name can't have more than 50 characters"
				},
				state: {
					required: "Please enter a state",
					minlength: "The state must have only 2 characters",
                    maxlength: "The state must have only 2 characters"
				},
				zipCode: {
					required: "Please enter a zip code",
					minlength: "The zip code must have only 5 characters",
                    maxlength: "The zip code must have only 5 characters"
				}
			}
		});
	});
	</script>

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
				<h3>Add A Client</h3>
				<p>



					<c:if test="${fn:length(errors) gt 0}">
						<p>Please correct the following errors in your submission:</p>
						<ul>
							<c:forEach items="${errors}" var="error">
								<li>${error}</li>
							</c:forEach>
						</ul>
					</c:if>


					<form:form id="editForm"
						action="${pageContext.request.contextPath}/client/create"
						method="POST" modelAttribute="client">
						<form:hidden path="clientId" />

						<div class="row">
							<div class="medium-12 columns">
								<label for="companyName">Company Name:</label> <input
									id="companyName" type="text" name="companyName" placeholder=""
									value="${client.companyName}" minlength="2" maxlength="50"
									required />
							</div>
						</div>
						<div class="row">
							<div class="medium-12 columns">
								<label for="webURI">Website URI:</label> <input id="webURI"
									type="text" name="webURI" placeholder=""
									value="${client.webURI}" minlength="2" maxlength="50" required />
							</div>
						</div>
						<div class="row">
							<div class="medium-12 columns">
								<label for="phoneNumber">Phone Number:</label> <input
									id="phoneNumber" type="text" name="phoneNumber" placeholder=""
									value="${client.phoneNumber}" minlength="2" maxlength="50"
									required />
							</div>
						</div>
						<div class="row">
							<div class="medium-12 columns">
								<label for="streetAddress">Street Address:</label> <input
									id="streetAddress" type="text" name="streetAddress"
									placeholder="" value="${client.streetAddress}" minlength="2"
									maxlength="50" required />
							</div>
						</div>

						<div class="row">
							<div class="medium-7 columns">
								<label for="city">City:</label> <input id="city" type="text"
									name="city" placeholder="" value="${client.city}" minlength="2"
									maxlength="50" required />
							</div>
							<div class="medium-2 columns">
								<label for="state">State:</label> <input id="state" type="text"
									name="state" placeholder="" value="${client.state}"
									minlength="2" maxlength="2" required />
							</div>

							<div class="medium-3 columns">
								<label for="zipCode">Zip Code:</label> <input id="zipCode"
									type="text" name="zipCode" placeholder=""
									value="${client.zipCode}" minlength="5" maxlength="5" required />
							</div>


						</div>


						<div class="row">
							<div class="medium-12 columns">


								<c:choose>
									<c:when test="${fn:length(peopleNotAssociated) gt 0}">
										<label for="contactsToAdd">Select contacts to add to
											this client:</label>
										<form:select id="contactsToAdd" path="contactsToAdd"
											multiple="true" width="100">
											<form:options items="${peopleNotAssociated}"
												itemValue="personId" itemLabel="lastNameAndFirstName" />
										</form:select>
									</c:when>
									<c:otherwise>
										<p>There are no contacts avalable to add to this client.</p>
									</c:otherwise>
								</c:choose>




							</div>

						</div>




						<input class="button" type="submit" name="Submit" value="Submit" />
					</form:form>
					<script>
$("#editForm").validate();
</script>




				</p>
				<div class="callout">
					<ul class="menu simple">

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

	<script src="${foundation_js_Main}"></script>
	<script src="${app_js_main}"></script>
	<script src="${jQueryValidation}"></script>



</body>
</html>



