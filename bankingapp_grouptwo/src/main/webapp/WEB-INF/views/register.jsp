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
<title>Register</title>
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
					<h3 style="text-align: center; margin-top: 20px;">Register for
						an Account</h3>
					<h4 style="color: Red">${message}</h4>
				</div>
				<form:form id="register_form" action="register" method="post"
					modelAttribute="user">
					<div class="form-group">

						<label for="email"> Email address </label><span
							style="color: Red;"> *</span>
						<form:input path="email" type="email" class="form-control"
							id="email" />
					</div>
					<div class="form-group">

						<label for="password"> Password </label><span style="color: Red;">
							*</span>
						<form:input path="password" type="password" class="form-control"
							id="password" />
					</div>
					<div class="form-group">

						<label for="password_confirm"> Confirm Password </label><span
							style="color: Red;"> *</span> <input type="password"
							class="form-control" id="password_confirm" />
					</div>
					<div class="form-group">

						<label for="first_name"> First Name </label><span
							style="color: Red;"> *</span>
						<form:input path="firstName" type="text" class="form-control"
							id="first_name" />
					</div>
					<div class="form-group">

						<label for="last_name"> Last Name </label><span
							style="color: Red;"> *</span>
						<form:input path="lastName" type="text" class="form-control"
							id="last_name" />
					</div>
					<div style="text-align: center; margin-bottom: 80px;">
						<form:button id="register" style="width:150;" type="submit"
							class="btn btn-primary">
					Register
                </form:button>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(
				function() {

					$("#register_form").submit(
							function(event) {

								var email = $("#email").val().trim();
								var isValid = true;

								if (email == "") {

									$("#email").prev().text(
											" *This field is required.");
									isValid = false;

								} else {

									$("#email").prev().text("");

								}

								$("#email").val(email);

								var password = $("#password").val();
								var passwordConfirm = $("#password_confirm")
										.val();

								if (password == "") {

									$("#password").prev().text(
											" *This field is required.");
									isValid = false;

								} else {

									$("#password").prev().text("");

								}

								if (passwordConfirm == "") {

									$("#password_confirm").prev().text(
											" *This field is required.");
									isValid = false;

								} else if (!(passwordConfirm == password)) {

									$("#password_confirm").prev().text(
											" *Password does not match.");
									isValid = false;

								} else {

									$("#password_confirm").prev().text("");

								}

								var firstName = $("#first_name").val();
								var lastName = $("#last_name").val();

								if (firstName == "") {

									$("#first_name").prev().text(
											" *This field is required.");
									isValid = false;

								} else {

									$("#first_name").prev().text("");

								}

								if (lastName == "") {

									$("#last_name").prev().text(
											" *This field is required.");
									isValid = false;

								} else {

									$("#last_name").prev().text("");

								}

								if (isValid == false) {

									event.preventDefault();

								}

							});

				});
	</script>

</body>

<footer>
	<p>Group Two</p>
	<p>Matt Dyrndahl 300234287, Nithil Chigullapally 300288453, Miguel
		Ballesteros 300299091, Ryan Burns 300239653</p>
</footer>

</html>