<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<meta charset="utf-8">
<title></title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<%@ page isELIgnored="false"%>

</head>

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h2 class="text-center">Mood Transaction Tracker</h2>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<ul class="nav nav-pills">
						<li class="nav-item"><a class="nav-link" href="transaction">Transactions</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="overview">Overview</a>
						</li>
						<li class="nav-item"><a class="nav-link active" href="budget">Budget</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="settings">Settings</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="logoutAccount">Logout</a>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<p class="lead text-center">----- On this page you will be able to
			set a budget for each category -----</p>

		<h3 class="text-center">Adjust Budgets</h3>

		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<form:form action="budget" cssClass="form-horizontal" method="post"
						modelAttribute="budget">
						<div class="form-group">
							<label for="foodBudget"> Food Budget: </label>
							<form:input path="foodBudget" class="form-control"
								value="${budget.foodBudget}" />
						</div>
						<div class="form-group">
							<label for="healthBudget"> Health Budget: </label>
							<form:input path="healthBudget" class="form-control"
								value="${budget.healthBudget}" />
						</div>
						<div class="form-group">
							<label for="entertainmentBudget"> Entertainment Budget: </label>
							<form:input path="entertainmentBudget" class="form-control"
								value="${budget.entertainmentBudget}" />
						</div>
						<div class="form-group">
							<label for="nightlifeBudget"> Nightlife Budget: </label>
							<form:input path="nightlifeBudget" class="form-control"
								value="${budget.nightlifeBudget}" />
						</div>
						<div class="form-group">
							<label for="collegeBudget"> College Budget: </label>
							<form:input path="collegeBudget" class="form-control"
								value="${budget.collegeBudget}" />
						</div>
						<div class="form-group">
							<form:button class="btn btn-lg btn-outline-primary btn-block">Submit Changes</form:button>
						</div>
					</form:form>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<span class="badge badge-primary">Food</span>
				<div class="progress">
					<div
						class="progress-bar progress-bar-striped progress-bar-animated"
						role="progressbar" style="width: ${foodP}%"
						aria-valuenow="${budget.foodBudget}" aria-valuemin="0"
						aria-valuemax="${total}">${foodP}%</div>
				</div>
				<span class="badge badge-danger">Health</span>
				<div class="progress">
					<div
						class="progress-bar progress-bar-striped bg-danger progress-bar-animated"
						role="progressbar" style="width:${healthP}%"
						aria-valuenow="${budget.healthBudget}" aria-valuemin="0"
						aria-valuemax="${total}">${healthP}%</div>
				</div>
				<span class="badge badge-warning" id="ent">Entertainment</span>
				<div class="progress">
					<div
						class="progress-bar progress-bar-striped bg-warning progress-bar-animated"
						role="progressbar" style="width: ${entertainmentP}%"
						aria-valuenow="${budget.entertainmentBudget}" aria-valuemin="0"
						aria-valuemax="${total}">${entertainmentP}%</div>
				</div>
				<span class="badge badge-success">Nightlife</span>
				<div class="progress">
					<div
						class="progress-bar progress-bar-striped bg-success progress-bar-animated"
						role="progressbar" style="width: ${nightlifeP}%"
						aria-valuenow="${budget.nightlifeBudget}" aria-valuemin="0"
						aria-valuemax="${total}">${nightlifeP}%</div>
				</div>
				<span class="badge badge-info" id="college">College</span>
				<div class="progress">
					<div
						class="progress-bar progress-bar-striped bg-info progress-bar-animated"
						role="progressbar" style="width: ${collegeP}%"
						aria-valuenow="${budget.collegeBudget}" aria-valuemin="0"
						aria-valuemax="${total}">${collegeP}%</div>
				</div>
				<span>Total: </span>
				<div class="progress">
					<div class="progress-bar progress-bar" role="progressbar"
						style="width: ${foodP}%" aria-valuenow="${budget.foodBudget}"
						aria-valuemin="0" aria-valuemax="${total}">${foodP}%</div>
					<div class="progress-bar progress-bar bg-danger" role="progressbar"
						style="width: ${healthP}%" aria-valuenow="${budget.healthBudget}"
						aria-valuemin="0" aria-valuemax="${total}">${healthP}%</div>
					<div class="progress-bar progress-bar bg-warning"
						role="progressbar" style="width: ${entertainmentP}%"
						aria-valuenow="${budget.entertainmentBudget}" aria-valuemin="0"
						aria-valuemax="${total}">${entertainmentP}%</div>
					<div class="progress-bar progress-bar bg-success"
						role="progressbar" style="width: ${nightlifeP}%"
						aria-valuenow="${budget.nightlifeBudget}" aria-valuemin="0"
						aria-valuemax="${total}">${nightlifeP}%</div>
					<div class="progress-bar progress-bar bg-info" role="progressbar"
						style="width: ${collegeP}%"
						aria-valuenow="${budget.collegeBudget}" aria-valuemin="0"
						aria-valuemax="${total}">${collegeP}%</div>
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