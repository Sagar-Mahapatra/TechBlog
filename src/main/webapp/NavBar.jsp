<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NavBar</title>




</head>
<body>

	<nav
		class="navbar navbar-expand-lg navbar-dark bg-primary navbar-styling">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp" target="_blank">TechBlog</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp" target="_blank"><i
							class="fa fa-home"></i> Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#"><i
							class="fa fa-contact"></i> Contact</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="ResumeGenerator.html"><i class="fa fa-wrench"
							aria-hidden="true"></i> Resume Generator</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
							class="fas fa-microchip"></i> Technology </a>
						<ul class="dropdown-menu text-center"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#"><img alt="" src="">
									<i class="fa fa-database" aria-hidden="true"></i> JDBC</a></li>
							<li><a class="dropdown-item" href="#">SERVLET</a></li>
							<li><a class="dropdown-item" href="#">JSP</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>

				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-warning" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>



</body>
</html>