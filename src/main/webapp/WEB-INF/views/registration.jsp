<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>
<body>

	<!-- create navigation bar ( header) -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#" th:href="@{/}">Registration and
					Login Module</a>
			</div>
		</div>
	</nav>

<br>
<br>
	<!-- Create HTML registration form -->
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">

				<!-- success message -->
				<div th:if="${param.success}">
					<div class="alert alert-info">You've successfully registered
						to our awesome app!</div>
				</div>

				<h1>Registration</h1>

				<form:form action="registration" method="post" modelAttribute="users">
					<div class="form-group">
						<label class="control-label" for="fullName"> Full Name </label>
						<form:input id="fullName" class="form-control" path="fullName"
							/>
					</div>
					<div class="form-group">
						<label class="control-label" for="userName"> User Name </label>
						<form:input id="userName" class="form-control" path="userName"
							/>
					</div>
					<div class="form-group">
						<label class="control-label" for="password"> Password </label> <form:input
							id="password" class="form-control" type="password"
							path="password"  />
					</div>
					<div class="form-group">
						<label class="control-label" for="phone"> Phone </label>
						<form:input id="phone" class="form-control" path="phone"
							/>
					</div>
					<div class="form-group">
						<label class="control-label" for="images"> Images </label>
						<form:input id="images" class="form-control" path="images"
							/>
					</div>
					<div class="form-group">
						<label class="control-label" for="status"> Status </label>
						<form:input id="status" class="form-control" path="status"
							/>
					</div>

					

					

					<div class="form-group">
						<button type="submit" class="btn btn-success">Register</button>
						<span>Already registered? <a href="/" th:href="@{/login}">Login
								here</a></span>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>