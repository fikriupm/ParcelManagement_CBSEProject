<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Log Masuk Pelajar Penjagaan Parcel</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/kolej.png" alt="sing up image">
						</figure>
						<a href="registration.jsp" class="signup-image-link">Create an
							account</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Log in</h2>
						<form method="post" action="login" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="matric"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="matric" id="matric"
									placeholder="Your Matric Number" required="required"/>
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass"
									placeholder="Password" required="required"/>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						<div class="social-login">
							<span class="social-label">Go to our website</span>
							<ul class="socials">
								<li><a href="https://www.facebook.com/UniPutraMalaysia/?locale=ms_MY"><i
										class="display-flex-center zmdi zmdi-facebook"></i></a></li>
								<li><a href="https://twitter.com/uputramalaysia?lang=en"><i
										class="display-flex-center zmdi zmdi-twitter"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status == "failed"){
		swal("Sorry","Wrong Username or Password","error");
	}
	if(status == "invalidMatric"){
		swal("Sorry","Please Enter Valid Matric","error");
	}
	if(status == "invalidUpwd"){
		swal("Sorry","Please Enter Password","error");
	}
</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>