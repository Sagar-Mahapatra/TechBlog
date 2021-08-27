<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>

<!-- adding Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- adding Bootstrap CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- adding External CSS file	 -->
<link href="CSS\Style.css" rel="stylesheet">


</head>
<body>

	<%@include file="NavBar.jsp"%>

	<div class="container">

		<div class="row justify-content-center">

			<div class="col-5 bg-info">
				<div class="card text-center">
					<div class="card-header bg-info display-5 text-light">
						<i class="fa fa-user text-warning display-2"></i><br>
						Register Here
					</div>
					<div class="card-body">
						<form action="RegisterServlet" method="POST" id="regForm">
							<div class="form-group">
								<label for="inputName">Full Name</label> <input type="text"
									class="form-control" id="inputName" placeholder="Full Name"
									name="inputName" required="required">
							</div>
							<div class="form-group">
								<label for="inputEmail">Email</label> <input type="email"
									class="form-control" id="inputEmail" placeholder="Email"
									name="inputEmail" required="required">
							</div>
							<div class="form-group">
								<label for="inputPassword">Password</label> <input
									type="password" class="form-control" id="inputPassword"
									placeholder="Password" required="required" name="inputPassword">
							</div>
							<div class="form-group">
								<label for="inputCity">City</label> <input type="text"
									class="form-control" id="inputCity" name="inputCity">
							</div>
							<div class="form-group">
								<label for="inputState">State</label> <select id="inputState"
									class="form-control" name="inputState">
									<option selected value="Odisha">Odisha</option>
									<option value="Delhi">Delhi</option>
								</select>
							</div>

							<div class="form-group">
								<label for="inputZip">Zip</label> <input type="number"
									class="form-control" id="inputZip" name="inputZip">
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Example file input</label>
								<input type="file" class="form-control-file"
									id="exampleFormControlFile1" name="photo">
							</div>
							<button type="submit" class="btn btn-primary">Sign Up</button>

						</form>
					</div>
					<div class="card-footer text-muted">2 days ago</div>
				</div>


			</div>

		</div>
	</div>





	<!-- adding bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>