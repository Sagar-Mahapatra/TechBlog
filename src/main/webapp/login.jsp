<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.MyFirstAdvJavaProject.helper.Message"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LogIn Page</title>

<!-- adding Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- adding Bootstrap CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- 	adding External CSS -->
<link href="CSS/Style.css" rel="stylesheet">

<style type="text/css">
#login-body {
	clip-path: polygon(0% 0%, 100% 0%, 100% 75%, 84% 81%, 75% 100%, 62% 94%, 0 94%);
}
</style>

</head>
<body>

	<!-- adding NavBar  -->
	<%@include file="NavBar.jsp"%>


	<!-- adding form inside card -->
	<div class="container py-5 bg-info" id="login-body">
		<div class="row justify-content-center">
			<div class="col-md-4">


				<!-- displaying error message  -->

				<%
				Message msg = (Message) session.getAttribute("msg");

				if (msg != null) {
				%>
				<div class="alert <%=msg.getCssClass()%>">
					<h5><%=msg.getMsg()%></h5>
				</div>

				<%
				session.removeAttribute("msg");
				}
				%>

				<div class="card">
					<div class="card-header bg-primary text-light text-center">
						<p class="fa fa-handshake-o" aria-hidden="true"></p>
						LogIn Form
					</div>
					<div class="card-body">
						<form action="LogInServlet" method="POST" id="loginForm">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="email" required="required"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password" required="required">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Check me out</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
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