<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error page</title>

<!-- adding Bootstrap CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style type="text/css">
#errorimg {
	width: 50%;
}
</style>

</head>
<body>



	<div class="container">
		<div class="row">
			<div class="col text-center">
				<img id="errorimg" alt="error" src="Image/errorpage.jpeg">
				<h1 class="text-danger text-center display-3">sorry, something
					went wrong !!!</h1>
								<%= exception %>	
				<a type="button" class="btn btn-primary" href="index.jsp">Home</a>


			</div>
		</div>
	</div>











	<!-- adding bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>