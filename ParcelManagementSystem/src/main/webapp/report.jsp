<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parcel Report</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body {
	background-image: url("images/bg.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
	background-color: #f8f9fa;
}

.navbar {
	background-color: #343a40;
	transition: background-color 0.3s ease;
}

.navbar:hover {
	background-color: #800000;
}

.navbar-brand {
	font-weight: bold;
	color: #fff;
	transition: color 0.3s ease;
}

.navbar-brand:hover {
	color: #ffc107;
}

.navbar-nav .nav-link {
	color: #fff;
	transition: color 0.3s ease;
}

.navbar-nav .nav-link:hover {
	color: #ffc107;
}

.navbar-toggler-icon {
	background-color: #fff;
	transition: background-color 0.3s ease;
}

.navbar-toggler:hover .navbar-toggler-icon {
	background-color: #ffc107;
}

.bg-custom {
	background-color: #B22222; /* Replace with your custom color */
}

.container {
	margin-top: 20px;
}

.custom-card {
	background-color: #FFFAFA;
	border: 2px solid #ccc;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.8);
}

.custom-button {
	background-color: #B22222; /* Replace with your desired color */
	color: #FFFFFF; /* Replace with your desired text color */
	/* Add any additional styling properties as needed */
}

.custom-table {
	border-collapse: collapse;
	width: 100%;
	max-width: 600px;
	margin: 0 auto;
	background-color: #f8f9fa;
	font-family: Arial, sans-serif;
	border: 3px solid #dee2e6;
}

.custom-table thead {
	background-color: #343a40;
	color: #ffffff;
}

.custom-table th, .custom-table td {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: left;
}

.custom-table tbody tr:nth-child(even) {
	background-color: #f2f2f2;
}

.custom-table tbody tr:hover {
	background-color: #e9ecef;
}

.custom-table b {
	font-weight: bold;
}
</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-sm bg-custom navbar-dark sticky-top">
			<div>
				<a href="dashboard.jsp" class="navbar-brand">Parcel Management
					System</a>
			</div>

			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/list" class="nav-link">Parcel</a>
				</li>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/available" class="nav-link">Available</a>
				</li>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/report" class="nav-link"
					style="color: black;"><strong>Parcel Report</strong></a></li>
			</ul>

			<ul class="navbar-nav">
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/logout" class="nav-link">Log
						Out</a></li>
			</ul>
		</nav>
	</header>

	<br>

	<div class="container">
		<div class="card custom-card">
			<div class="card-body">
				<h2 class="text-center">Parcel Report</h2>
				<form action="<%=request.getContextPath()%>/report" method="GET">
					<div class="form-group">
						<label for="available">Enter Date:</label> <input type="date"
							id="available" name="available" class="form-control" required>
					</div>
					<div class="text-center mb-3">
						<button type="submit" class="btn btn-lg custom-button">Count</button>
					</div>
				</form>
				<br>
				<%-- Display the count of parcels for the specified date if available --%>
				<c:if test="${not empty countAllDateIn}">
					<table class="custom-table">
						<thead>
							<tr>
								<th>Count Type</th>
								<th>Count Value</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>All Parcel for Date:</td>
								<td><b><c:out value="${param.available}" /></b></td>
							</tr>
							<tr>
								<td>Available parcels for Date:</td>
								<td><b><c:out value="${countInDateIn}" /></b></td>
							</tr>
							<tr>
								<td>Parcel Check out for Date:</td>
								<td><b><c:out value="${countOutDateIn}" /></b></td>
							</tr>
							<tr>
								<td>Profit:</td>
								<td><b>RM <c:out value="${total}" /></b></td>
							</tr>
						</tbody>
					</table>

				</c:if>
			</div>
		</div>
	</div>

</body>
</html>