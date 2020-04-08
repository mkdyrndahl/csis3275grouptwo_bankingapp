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

#piechart, #piechart2, #piechart3 {
	width: 50%;
	float: left;
}
</style>
<meta charset="ISO-8859-1">
<title>User Login</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

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
						<li class="nav-item"><a class="nav-link active"
							href="overview">Overview</a></li>
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
			see all of your transactions made and see which categories you are
			spending the most money in -----</p>

		<div  id="piechart"></div>
		<div  id="piechart2"></div>
	</div>

	<script type='text/javascript'>
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart2);
		
		function drawChart() {
		  var data = google.visualization.arrayToDataTable([
		  ['Category', 'Dollar Amount'],
		  ['Food', ${Food}],
		  ['Health', ${Health}],
		  ['Entertainment', ${Entertainment}],
		  ['Nightlife', ${Nightlife}],
		  ['College', ${College}]
		]);
		
		  var options = {'title':'Expense by Category', 'width':1700, 'height':1000};
		  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
		  chart.draw(data, options);
		}
		
		function drawChart2() {
			  var data2 = google.visualization.arrayToDataTable([
			  ['Mood', 'Dollar Amount'],
			  ['Poor', ${Poor}],
			  ['Neutral', ${Neutral}],
			  ['Good', ${Good}],
			  ['No Mood', ${Null}]
			]);
		
			  var options = {'title':'Expense by Mood', 'width':1700, 'height':1000};
			  var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
			  chart.draw(data2, options);
			}
		</script>
</body>

<footer>
	<p>Group Two</p>
	<p>Matt Dyrndahl 300234287, Nithil Chigullapally 300288453, Miguel
		Ballesteros 300299091, Ryan Burns 300239653</p>
</footer>

</html>