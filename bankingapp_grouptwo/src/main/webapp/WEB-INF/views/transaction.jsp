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

html {
	overflow-y: scroll;
}

#desc, #myList {
	width: 100%;
}

#date {
	width: 100%;
	text-align: center;
}

#amt {
	width: 97%;
	text-align: center;
}

.btn-group {
	width: 100%;
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
						<li class="nav-item"><a class="nav-link active"
							href="transaction">Transactions</a></li>
						<li class="nav-item"><a class="nav-link" href="overview">Overview</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="budget">Budget</a>
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
			add any transactions made including their date and price and
			determine if it was a wise choice or not -----</p>
		<table id="table" class="table table-bordered">
			<thead>
				<tr>
					<th class="text-center">#</th>
					<th class="text-center">Transaction Description</th>
					<th class="text-center">Payment Date</th>
					<th class="text-center">Mood Rating</th>
					<th class="text-center">Category</th>
					<th class="text-center">Amount</th>
					<th class="text-center">Delete Entry</th>
				</tr>
			</thead>
			<tbody>

				<form:form action="deleteTransaction" cssClass="form-horizontal"
					method="post" modelAttribute="transaction"
					id="deleteTransactionForm">
					<form:hidden path="index" cssClass="form-control" />
				</form:form>

				<form:form action="updateTransaction" cssClass="form-horizontal"
					method="post" modelAttribute="transaction" id="transactionForm">
					<form:hidden path="description" cssClass="form-control" />
					<form:hidden path="mood" cssClass="form-control" />

					<c:forEach var="transaction" items="${transactions}">
						<tr style="background-color: ${transaction.color}">
							<td>${transaction.index}</td>
							<td>${transaction.description}</td>
							<td>${transaction.paymentDate}</td>
							<td>
								<div class="btn-group btn-group-sm" role="group">
									<button
										onclick="document.getElementById('description').value='${transaction.description}';document.getElementById('mood').value='Poor';document.getElementById('transactionForm').submit();"
										class="btn btn-secondary red" type="button"
										style="background-color: Red;">Poor Choice</button>
									<button
										onclick="document.getElementById('description').value='${transaction.description}';document.getElementById('mood').value='Neutral';document.getElementById('transactionForm').submit();"
										class="btn btn-secondary gray" type="button"
										style="background-color: #606060;">Neutral Choice</button>
									<button
										onclick="document.getElementById('description').value='${transaction.description}';document.getElementById('mood').value='Good';document.getElementById('transactionForm').submit();"
										class="btn btn-secondary green" type="button"
										style="background-color: Green;">Good Choice</button>
								</div>
							</td>
							<td>${transaction.category}</td>
							<td>$ ${transaction.amount}</td>
							<td>
								<button type="button"
									class="btn btn-md btn-outline-danger btn-block" id="del"
									onclick="document.getElementById('index').value='${transaction.index}';document.getElementById('deleteTransactionForm').submit();">
									Delete Transaction</button>
							</td>
						</tr>
					</c:forEach>
				</form:form>
			</tbody>
		</table>

		<div style="text-align: center;">
			<button type="button"
				class="btn btn-lg btn-outline-primary btn-block"
				onclick="window.location.href = 'addTransaction';">Add
				Transaction</button>

		</div>
	</div>

	<script type='text/javascript'>
		let table = document.getElementById("table")
		function tableIndex() {
			console.log(table.rows.length)
			let rowNumber = table.rows.length
			return rowNumber
		}
		$(document).ready(function() {

			$(document).on("click", ".red", function() {
				$(this).closest('tr').css("background-color", "red");
			});
			$(document).on("click", ".gray", function() {
				$(this).closest('tr').css("background-color", "Gray");
			});
			$(document).on("click", ".green", function() {
				$(this).closest('tr').css("background-color", "Green");
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
