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

#pic {
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
						<li class="nav-item"><a class="nav-link" href="budget">Budget</a>
						</li>
						<li class="nav-item"><a class="nav-link active"
							href="settings">Settings</a></li>
						<li class="nav-item"><a class="nav-link" href="logoutAccount">Logout</a>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<p class="lead text-center">----- On this page you will be able to
			see your profile including your log in details and adjust any
			settings you would like -----</p>

		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4" id="pic">
					<img alt="Profile Picture"
						src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxITEQ0QBxERDRIOERUTGBITDhcVFxEXGBUYGRURFhUYHSggGBslJxUVITEhJSkrLjIwFx8zOjUsQygtLisBCgoKBQUFDgUFDisZExkrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrK//AABEIAOEA4QMBIgACEQEDEQH/xAAcAAEAAgMBAQEAAAAAAAAAAAAAAQcFBggEAwL/xABEEAABAwICBgUIBwUJAQAAAAABAAIDBBEFEgYHITFBURNhcYGRFCIyQlJykrEjNGKCoaLBJVOywsMVM0Nzg5Oj0fAk/8QAFAEBAAAAAAAAAAAAAAAAAAAAAP/EABQRAQAAAAAAAAAAAAAAAAAAAAD/2gAMAwEAAhEDEQA/ALxREQEREBERAUKUQQilQgIpXwrKyOJhkrZGQsbvfI8MaO0nYg+6hVhpprBpSOjwyolzsOaOopASY3WILZGShsc0ZvtGY87AtBWrxa2cSaAD5LJb1n07rnrOWQDwCC91Ko2LW/Xg/SxUbhyEUrT49Kfks3huuVpIGK0jmj2oZQ/8jw3+IoLXULE4BpJS1jS7CZmylou5novZ7zHbQOvcsughSiIChSiAoUqEBSoUoIRSiCFKIgIiICIiAiIgIiICIvnPM1jXvncGMY0uc5xsGtAuXE8AEGE020kbQUr53jO8kMjjvbO8g2B6gAXHqaVzzjWMT1UhmxWV0z9tr+iwH1WN3NHZ33WwaxtMBiE0Yo2uZT02YMzbDIXEXlLeAIaLA7QL3tcgaigIiICIiD7UlVJE9ktG90MkZu17HWc09v6bjuV46ttPPLc1PiQDKqNubM0WbO0EAvA9VwuLjdtuOIbRC9uDYrLSzR1GHODJI72JaHAgggtIO8EEoOpkWu6C6SivpWzkCORjjHIwbmvABu2+3KQWkdtttlsSAiIgIiICIiCFKIgIiICIiAiIgIiICIiAq8114m6OiighNvK5g12212MGYjvOQdlxxVhqsde0X/zUL/ZqCy/vRuNvyIKaREQEREBERAREQWhqKqiJ6+G+x8UcluRY4tJ/5B4BXEqb1Ew3qK9/sQxt+N7j/TVyoCIiCFKIgKFKIIRSiCERSgIoUoCIiAiIgIihBK0LXTBmw3N+6qIneOZn863xaNrgroRh01PUSNZLPkdEw3u/o5Y3PtbcLbLnmgoZERAREQEREBERBb+oeD6PEZPakiZ8LXH+orUVXajq6EQVNOZG+UPndN0e3N0YZEzNyO2/iFaCCUUIglFCIJRQiCUUIgKVClBCKUQEREBERAREQFTOvVh8ooHHc6GQDtDxf+IK5lWuvLD81LS1DRc08xaTybK3afiZGO9BSyIiAiIgIiICIiDd9TjCcTjLfVglceyzR83BX4qe1FYfeSuqXDYxjIWnrcc7x+SPxVwoChSiAiIgIiICIiCFKIgIiICIiAiIgIiICxmkuENq6WopZjlEzLB1r5HAgsfbjZwae5ZNEHMWkmjs9DK2HFAzM9mcGNxc0jMW7CQNvm7rcQsSrl15YVmp6WrYL+TyGN3U2W1nHsc1o++qaQEREBERAXuwXCpaqeOmw8AySZrZnWHmtLjc8NjT+C8Ks3UdhZdPV1bx5sMYhaeBc8hzrdYDW/GgsPQHR3yGjjglLXSucZJXN9EvdbYCd4ADW32Xy32XWxoiAiIgIiICIiAiIghSoUoIRFKCFKIggqURAUKUQQiIg8OO4Yypp6imqPRnjLL29E+q8dYNiOxcw1lK+KSWGpFnwvdG4A3Ac0kOseIuF1auW9IZc1ZXv9urnd4yuP6oPAiIgIiIBK6S0EwHyKhggkAEhBkl65H7XC/G2xt+TQua5RdrhzB+S6uo5c8cT/bY13iAUH2UoiCEUoghApRBCIpQQilEEKVClAREQEREBERAREQERfKqqGRsdJVObGxgLnPe4Na0DeSTsAQfRxttPBcnOlLyXu3vJd4m/wCq6VwLH4q+OrOF5ujikdAJS22d3RtcXtaduUZxvtfbs5854nhctNK+nxFhjki2EcCOD2n1mm2w/wDRQeVERAREQF03ofNnw/DXne6kgJ7ejbdc0U0D5HsjpWukfI4NaxouXE8AF0NTVP8AZmFUrsUaX+SxwskEdnFuZzWEt9oNL/AINpReTC8ShqI2zYdI2aN+5zTftBG8EcQdoXrQEREBERAREQEREBERARQpQEReaur4oWGSvljgYPXkkDG9lyg9KLTcU1nYbED0czqp3swRl1/vusz8VpeL64Z3XGD08cA9uVxkcevK2wae9yC5lr+Maa0FNcVtTHnH+HGekeOotZct77KgsX0mram4xOqllad7A7IwjkY2Wae8LEgckFt4vrkbtGC0pd9uocAO3o2E3H3gq+0j0qq60j+1JbsabiJgyRtPPL6x63EkLCogvTUmy2HPI9aqkP5WD9FntMNE4K+LJVjJIy5jmA86M8vtMPFvHqIBGD1Kn9mnqqZB+DT+q3woOX9IMDno5nQYk3K4bWuG1sjeD2HiPxHFY1dOaTaOwV0JgxFt+LXjY+J3B7DwPVuO4rn3SrRmegm6KvGZrrmOZo8yVo4jk4cW7x1ixIYVenDaCWeWODD2GWSQ2a0fiSdwA3knYF9sEwearmZBhjOke7uaxvF73eq0c+4XJAV/6FaHw0EWWH6WaQDpJyLF59lo9Vg4Dxug8mgWg0VAzpJrTVTxZ0ttjAd8UV9zeZ3nwA9Wsll8LxAHhFfwc0j5LZlresY/svEb/uT8wgoLAseqaOTpMJldET6Td7Hjk9h2Ht3i5sQrBwjXG8WGNUrX8307sp/23m35gqsRB0Xg+sDDqiwiqWwvPqT/AERueALvNcewlbO11wC3aDtuOK5NWQwnG6mmP7KqJacey1/mdpjN2nvCDqNQqSwnW9VssMUiiqwLec28T+skgFp7A0LdcJ1qYfLYVLpKNx4Sxkj42ZgB22Qbyi8WGYvT1DS7DJoqgDeY5A7L1EDce1e1AREQQiKUBERBhtLcfZQ0stTUDMW+axl7dI8+iy/DiSeABPBc6Y3jM9XKZsVkMrzew3NjB9SNvqt/8STtW+68cVzVFLSMOyCMyuHAvkNm36wGn/cVZoCIiAiIgIiILu1GyXoKgezWPHjFEf1ViqrNRFUOhxCH1myskt1PZlv/AMfyVpoPy422nYBx5Ki9Z2m4rHeS4YQaaF9zJb+/eLjM08GC5tzvfkrW07wiarop6fDZehkfY2vYSgb4XHeGu5jvuCQecKmnfG98dU10b43FrmOFi0jeCEGy6v8AS52HzuMoz089hK0C7ha+WRvG4udnEE9VuhKSqZKxktI5skcjQ5r2m4cDuIK5TA3AbSTYAcSdwHMq/dVWAVNJSOGKPcOmcHtpzupwd+3g517lu4W5l1w3VaprSly4VXnmI2/FNG39Vta0XXNUhuGPY42M80TAOZa7pD+EZQUMiIgIiICIiD70FbJDI2agkdDIzc9hsR1dY6jcHiugtXmlgr6YumDWVEBDJWt3EkebK0cGusdnAhw22uedlueqXFegxGJjzZlWx0J27M3pRntu3KPfKDoBERBCKUQEULCabYl5PQV0zTlc2FzWnk9/mR/i5qDn3SvE/Ka2tqAbiWZ2U82N8yM/C1qxSAcuCICIiAiIgIiINy1TYt0GIxNkNmVbTAduzMbOjPbdoaPfXQK5Ojkc1zXwnK5jg5rhva4G7XDsIBXT+jeLNqqWmqYtnTRhxAPou3PZ3EOHcgyS5z1jY62rr5pKYN6OECFjgBeQMJvITvIJJt1Acyrm1jYm6nw2tlpjZ5a2NpBsW9I9sZcOsB5PcucgOSDJaN4r5LVU1SWiQQvBLS0G7SLOy33OsTY87LpymnbIxklO4PZI0Pa4bnNcLhw6iCuUVeupfEnS4e6Oc38lndE0325C1r2g9he4DqAQb8qX134tnqKakjOynYZH+/JsaD1hrb/6iuOpnaxj5JyGsjaXucdzWtFyT4Ll7G8TdU1NTUzXBqJC+x3tbuYzuaGjuQeJERAREQEREBfSnqHRvjlp9j4ntkaeTmODmnxAXzRB1Xh1Y2aKGan2smjbI09Tmhw+a9C0nVDiPS4bExxu6le+E9gOZg7mvaO5bqgIpRBCrnXhX5aOngabGonuRzZG0k/mdGrHVJa8azNW0sI3QU+bvkebjwjb4oK5REQEREBERAREQFbOo/HPrNBMd308dzw2NlaO/I632nKplkNH8WdS1NNVQXJgeHFo9dp2PZ3tLh3hBc2umfLhuX97URN8Mz/5FRKuHXZWNkosONO4PZNP0rSNzm9C6zh3SDxVPICt3UPP5mJR+y+F/wAQeP6YVRKzdRUtqivZ7cMbvheR/Og2XXLjnQ0baaI2krXZTzETbGQ9/mt7HHkqNWy6w8d8sr55IjeKL6GPkWsJu8e84uN+RHJa0gIiICIiAiIgIiILS1FV9pa6mcfTYyZo90lrz+ePwVwLnrVVWdHilJwEwkiPYWFw/Mxi6GQQpREBUvrP0Rr5KyorKaHymF4YGiI5nsa2NoIdHbMTcOPm5t6uhEHJrmkEteC1zTYtIsWnkQdxULp/GdHaSqFsVp45jawcW2e0fZkFnN7itCxnU7C67sGqHwH2JW9I3sDhZw78yCnUW14tq6xKC5NP5S0etTu6TwZYPPwrV5o3McWVDXRvG9r2lrh2tO0IPwiIgIiICIiDK4hjb5aSgpZrnyJ04B5sk6MsH3bSDsyrFIiAsto9jb6Q1b6a4fPSPp2kH0C98ZMnaA11uuyxKIAHJERAREQEREBFLRchrNrnbA0bSeoDitjwnQTEaixgpXxNPrz/AEQHXZ3nEdjSg1tCeatrB9Tg2OxyqJ3Xjp22HZ0jxtH3Qt9wPRGipLHDaeNrx/iOGeTr+kfcjsGxBTmhGhuIPqKSpigMEcM8chfNePM1rwXBrSMzrgG2yxvvV/oiCFKhEBSiICIiAvNXYfFM3JXxRzt9mSNrx4OC9KINNxLVjhstyyF1M4+tDK5tuxhuwfCtYr9TI34bWEfZmgDifvsIt8KtlEFCVuqrEmXMDYKnkI57E90gaB4rB1mh+IRfWKKo+5F0v4x5l0siDlGqp3x/W2Ph/wAxhZ/EAvkHDgQe9dZkc146jCad/wBZp4ZPehY75hByyi6Xk0Ow4+lQUndSxj5BfF2guGnfRQdzLfJBzci6QboLho3UUHey/wA19Y9DMOG6gpD20zHfMIOaS4cSv3TxuebUzXSnkxpcfALqKnwSlj+rU1PH7lOxvyC9rWgbG7ByCDmak0Vr5fq9FUnrdA5g+J4AWcotV2Jyf3kUVN/m1Df6edX8pQVDQamn7DiVY1o4tihJ8HuI/hWzYbqrw6OxnZLVEcZZiB8MeUEdoK3hQg8WHYRTwC2GwQ04O/o4mtv1kgbV7URARSiCEREBEUoIUoiCEREEoiICIiAiIgIURBBREQSiIghERAKlEQFBUoghSiICIiCEREBERB//2Q=="
						class="rounded-circle" />
					<div class="row">
						<div class="col-md-12">
							<h2>${loggedUser.firstName} ${loggedUser.lastName}</h2>
							<p>Welcome! ${message}</p>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<form:form action="updateProfile" cssClass="form-horizontal"
						method="post" modelAttribute="profile">
						<div class="form-group">

							<label for="firstName"> First Name: </label>
							<form:input path="firstName" class="form-control"
								value="${loggedUser.firstName}" />
						</div>
						<div class="form-group">

							<label for="lastName"> Last Name: </label>
							<form:input path="lastName" class="form-control"
								value="${loggedUser.lastName}" />
						</div>
						<div class="form-group">

							<label for="dob"> Date of Birth (YYYY-MM-DD): </label> <br>
							<form:input path="dob" class="form-control"
								value="${loggedUser.dob}" />
						</div>
						<div class="form-group">

							<label for="city"> City: </label>
							<form:input path="city" class="form-control"
								value="${loggedUser.city}" />
						</div>
						<div class="form-group">

							<label for="email"> Email address: </label>
							<form:input path="email" class="form-control"
								value="${loggedUser.email}" />
						</div>

						<div class="form-group">

							<label for="picture"> Change Profile Image: </label> <input
								type="file" class="form-control-file" id="picture" />
						</div>

						<div class="form-group">
							<!-- Button -->
							<div class="col-md-12">
								<form:button class="btn btn-lg btn-outline-primary btn-block">Submit Changes</form:button>
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