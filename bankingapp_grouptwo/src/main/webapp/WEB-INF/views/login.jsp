<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>

<style>
footer {
	display: block;
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	margin-top: 50px; text-align : center;
	background-color: black;
	color: white;
	text-align: center;
}
</style>
<meta charset="ISO-8859-1">
<title>User Login</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

</head>
<body>

	<div style="height: 700px; width: 500px; margin: auto">
		<div class="row">
			<div class="col-md-12">
				<div
					style="margin-top: 40px; margin-bottom: 20px; text-align: center;">

					<img src="<c:url value="/resources/img/logo.png" />" width="80px"
						height="80px">

					<h3 style="text-align: center; margin-top: 20px;">Mood
						Transaction Tracker</h3>

					<h4 style="color: Red">${message}</h4>
				</div>
				<form:form action="login" method="post" modelAttribute="loginInfo">
					<div class="form-group">

						<label for="email"> Email address </label>
						<form:input path="email" type="email" class="form-control"
							id="email" />
					</div>
					<div class="form-group">

						<label for="password"> Password </label>
						<form:input path="password" type="password" class="form-control"
							id="password" />
					</div>
					<div style="text-align: center;">
						<form:button style="width:150" type="submit"
							class="btn btn-primary">
					Login
                </form:button>
						<button onclick="window.location.href = 'register';" id="register"
							style="width: 150" type="button" class="btn btn-primary">
							Register</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	
</body>

<footer>
	<p>Group Two</p>
	<p>Matt Dyrndahl 300234287, Nithil Chigullapally 300288453, Miguel
		Ballesteros 300299091, Ryan Burns 300239653</p>
</footer>

</html>