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

#btnAdd {
	background-color: #008CBA;
	color: black;
	border: 2px solid #008CBA;
}

#btnAdd:hover {
	background-color: white;
	color: black;
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
				<h2 style="margin-top: 40px" class="text-center">Mood
					Transaction Tracker</h2>
				<h3 class="text-center">${message}</h3>
				<br> <br> <br>
				<div style="text-align: center;">
					<button onclick="window.location.href ='transaction';"
						style="width: 150" type="button" class="btn btn-primary">
						Show Transactions</button>
				</div>
			</div>
		</div>
	</div>
	
<script>

	$(document).ready(function() {
		
		window.location.href='transaction';
		
	});

</script>
</body>

<footer>
	<p>Group Two</p>
	<p>Matt Dyrndahl 300234287, Nithil Chigullapally 300288453, Miguel
		Ballesteros 300299091, Ryan Burns 300239653</p>
</footer>

</html>
