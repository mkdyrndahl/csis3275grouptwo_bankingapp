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
<title>Add Transaction</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

</head>
<body>
	<div class="container">
		<div class="col-md-12">
			<h2 style="margin-top: 40px" class="text-center">Add Transaction</h2>
			<div class="panel panel-info">
				<div class="panel-body">
					<form:form action="addTransaction" cssClass="form-horizontal"
						method="post" modelAttribute="transaction">

						<div class="form-group">
							<label for="desc" class="col-md-12 control-label">Description: </label>
							<div class="col-md-12">
								<form:input path="description" cssClass="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="date" class="col-md-12 control-label">Date: </label>
							<div class="col-md-12">
								<form:input path="paymentDate" cssClass="form-control" />
							</div>
						</div>
						<div class="form-group" >
							<label for="myList" class="col-md-12 control-label">Category: </label>
							<form:select path="category" id="myList">
								<option value="none" selected disabled hidden=>Select a Category</option>
								<option value="Food">Food</option>
								<option value="Health">Health</option>
								<option value="Entertainment">Entertainment</option>
								<option value="College">College</option>
								<option value="Nightlife">Nightlife</option>
							</form:select>
						</div>
						<div class="form-group">
							<label for="amount" class="col-md-12 control-label">Amount: </label>
							<div class="col-md-12">
								<form:input path="amount" cssClass="form-control" />
							</div>
						</div>
						<div class="form-group">
							<!-- Button -->
							<div class="col-md-12">
								<form:button class="btn btn-lg btn-outline-primary btn-block">Add Transaction</form:button>
							</div>
						</div>

					</form:form>
				</div>
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