<%@page import="com.MyFirstAdvJavaProject.helper.ConnectionProvider"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TechBlog</title>

<!-- adding Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- for digital clock -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Orbitron:wght@800&display=swap"
	rel="stylesheet">


<!-- adding Bootstrap CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- adding External CSS file	 -->
<link href="CSS\Style.css" rel="stylesheet">



<!-- adding Internal CSS -->
<style type="text/css">
#Jumbotron {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 79%, 70% 100%, 30% 100%, 0 84%, 0 0
		);
}

.card {
	width: 300px;
	height: 50px;
	box-shadow: 7px 10px 10px;
	transition: height 2s;
	overflow: hidden;
	text-align: center;
}

.card:hover {
	height: 200px;
	background: rgb(234, 35, 224);
	color: white;
}

#Jumbotron {
	background: linear-gradient(rgb(68, 178, 234), rgb(234, 68, 189));
}

.welcome {
	text-shadow: 2px 2px 1px;
	font-family: 'Orbitron', sans-serif;
}

#clock {
	font-family: 'Orbitron', sans-serif;
}
</style>


</head>
<body>

	<!-- 	adding NavBar -->
	<%@ include file="NavBar.jsp"%>



	<!-- 	adding Jumbotron -->
	<div id="Jumbotron" class="jumbotron jumbotron-fluid text-light">
		<div class="container text-center py-5 " id="jumboMain">
			<div class="row">
				<div class="col-9">
					<h1 class="display-4 lead welcome m-5" id="heading">Welcome To
						TechBlog</h1>

					<a class="btn btn-outline-light text-light loginBtn"
						href="register.jsp"> <i class="fa fa-car"></i> Lets SignUp...
					</a> <a class="btn btn-outline-light text-light " id="loginBtn"
						href="login.jsp"> <i class="fa fa-sign-in text-warning"></i>
						Login
					</a>
				</div>
				<div class="col-3">
					<div id="clock">
						<h1 id="crntTime">
							<%
							Date date = new Date();
							int h = date.getHours();
							int m = date.getMinutes();
							int s = date.getSeconds();
							%>
							<%=h + ":" + m + ":" + s%>
						</h1>
					</div>
					<div class="btn-group">

						<button onclick="start()" class="btn btn-warning btn-group-item"
							id="startBtn">start</button>
						<button onclick="pause()" class="btn btn-light btn-group-item"
							id="pauseBtn">pause</button>

					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- 	adding cards -->

	<div class="container mt-5">
		<div class="row">
			<div class="col" id="firstcard">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>

			</div>
			<div class="col" id="secondcard">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">JavaScript</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>

			</div>
			<div class="col" id="thirdcard">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Angular</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>

			</div>

		</div>

	</div>
















	<!-- adding jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<!-- adding bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

	<!-- adding external JS file -->

	<script src="JS\clock.js"></script>




</body>
</html>