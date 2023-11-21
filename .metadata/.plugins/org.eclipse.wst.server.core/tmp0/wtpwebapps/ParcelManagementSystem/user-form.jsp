<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Parcel Management System</title>
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
</style>
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-sm bg-custom navbar-dark sticky-top">
		<div>
			<a href="dashboard.jsp" class="navbar-brand">Parcel Management
				System</a>
		</div>

		<ul class="navbar-nav">
			<li class="nav-item"><a
				href="<%=request.getContextPath()%>/list" class="nav-link">Parcel</a>
			</li>
		</ul>

		<ul class="navbar-nav">
			<li class="nav-item"><a
				href="<%=request.getContextPath()%>/available" class="nav-link">Available</a>
			</li>
		</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card custom-card">
			<div class="card-body">
				<c:if test="${parcel != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${parcel == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2 class="text-center">
						<c:if test="${parcel != null}">
            			Edit Parcel
            		</c:if>
						<c:if test="${parcel == null}">
            			Add New Parcel
            		</c:if>
					</h2>
				</caption>

				<c:if test="${parcel != null}">
					<input type="hidden" name="id"
						value="<c:out value='${parcel.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Name</label> <input type="text"
						value="<c:out value='${parcel.name}' />" class="form-control"
						name="name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Phone Number</label> <input type="text"
						value="<c:out value='${parcel.noPhone}' />" class="form-control"
						name="noPhone" required="required">
				</fieldset>

				<button type="submit" class="btn btn-block btn-lg custom-button">Save</button>
				</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>