<%@page import="com.MyFirstAdvJavaProject.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.MyFirstAdvJavaProject.entities.*"%>
<%@ page import="com.MyFirstAdvJavaProject.dao.*"%>
<%@ page import="java.util.*"%>
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page</title>

<!-- adding Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


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
	box-shadow: 5px 10px 10px #888888;
}

#Jumbotron {
	background: linear-gradient(rgb(68, 178, 234), rgb(234, 68, 189));
}
</style>

</head>
<body>


	<nav
		class="navbar navbar-expand-lg navbar-dark bg-primary navbar-styling">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">DynamicWebProject</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<button type="button" class="btn text-light"
							data-bs-toggle="modal" data-bs-target="#exampleModal" id="View">View
							Profile</button>
					</li>
					<li class="nav-item"><button type="button"
							class="btn text-light" data-bs-toggle="modal"
							data-bs-target="#PostModal">Do Post</button></li>

					<li><a class="nav-link text-light"
						href="loadPosts.jsp?catId=1" role="button""> All Posts
					</a></li>
					

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-light"
						href="loadPosts.jsp?catId=0" id="navbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"><i
							class="fas fa-microchip"></i> Categories </a>
						<ul class="dropdown-menu text-center"
							aria-labelledby="navbarDropdown">
							<!--getting all categories -->

							<%
							PostDao p1 = new PostDao(ConnectionProvider.getConnection());
							ArrayList<Category> al1 = p1.getCategories();

							for (Category cat1 : al1) {
							%>
							<li><a href="loadPosts.jsp?catId=<%=cat1.getId()%>"
								class="list-group-item list-group-item-action c-link"><%=cat1.getName()%></a></li>

							<%
							}
							%>

						</ul>
				</ul>

				<%
				User u = (User) session.getAttribute("currentUser");

				if (u == null) {
					response.sendRedirect("login.jsp");
				}
				%>


				<form class="d-flex text-light">

					<ul class="list-group list-group-horizontal">

						<li class="list-group-item ">
							<h5 class=" text-danger">
								<i class="fa fa-user" aria-hidden="true"></i> Mr.
								<%=u.getName()%></h5>
						</li>
						<li class="list-group-item "><a id="logoutBtn"
							class="btn btn-danger" href="LogoutServlet"> <i
								class="fa fa-sign-out text-info" aria-hidden="true"></i> Logout
						</a></li>
					</ul>

				</form>
			</div>
		</div>
	</nav>

	<!-- getting Post session -->
	<%
	Posts post = (Posts) session.getAttribute("Post");

	if (post != null) {
	%>
	<div class="alert">
		<h5>Post Saved Successfully....</h5>
	</div>

	<%
	session.removeAttribute("Post");
	}
	%>




	<!-- post modal -->
	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="PostModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						Post Detail</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="AddPostServlet" method="POST" id="PostForm">


						<table class="table table-striped table-bordered text-center">

							<tr>
								<td>
									<div class="form-group">
										<select class="form-control" name="postSelect"
											required="required">

											<%
											PostDao postDao = new PostDao(ConnectionProvider.getConnection());

											ArrayList<Category> list = postDao.getCategories();

											for (Category c : list) {
											%>

											<option value="<%=c.getId()%>"><%=c.getName()%></option>

											<%
											}
											%>

										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td><input type="text" class="form-control text-center"
									id="postTitle" name="postTitle"
									placeholder="Enter Your Title here" required="required"></td>
							</tr>
							<tr>
								<td><textarea class="form-control text-center"
										id="postcontext" name="postcontext" rows="3"
										placeholder="Enter Your Context Here..." required="required"></textarea></td>
							</tr>
							<tr>
								<td><textarea class="form-control text-center"
										id="postCode" name="postCode" rows="3"
										placeholder="Enter Your Code Here..."></textarea></td>
							</tr>
							<tr>
								<td><input type="file" class="form-control" id="postPhoto"
									name="postPhoto"></td>
							</tr>
							<tr>
								<td>
									<div class="d-grid">
										<button class="btn btn-success" type="submit">Post</button>
									</div>
								</td>
							</tr>
						</table>
					</form>

				</div>

			</div>
		</div>
	</div>






	<!-- Update Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary text-light">

					<div class="input-group">
						<p class="modal-title input-group-text" id="exampleModalLabel"><%=u.getId()%></p>

						<input type="text" disabled="disabled"
							value="Mr. <%=u.getName()%>"
							class="form-control modal-title bg-light text-center">

					</div>


					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="hide">
						<table class="table table-striped table-bordered text-center">
							<tr>
								<td><label>Email</label></td>
								<td><input type="email" value="<%=u.getEmail()%>"
									class="form-control text-center" id="inputEmail"
									name="inputEmail" disabled="disabled"></td>
							</tr>
							<tr>
								<td><label>Password</label></td>
								<td><input type="text" value="<%=u.getPassword()%>"
									class="form-control text-center" id="inputpassword"
									name="inputpassword" disabled="disabled"></td>
							</tr>
							<tr>
								<td><label>City</label></td>
								<td><input type="text" value="<%=u.getCity()%>"
									class="form-control text-center" id="inputCity"
									name="inputCity" disabled="disabled"></td>
							</tr>
							<tr>
								<td><label for="inputState">State</label></td>
								<td><input type="text" value=" <%=u.getState()%>"
									class="form-control text-center" id="inputState"
									name="inputState" disabled="disabled"></td>
							</tr>
							<tr>
								<td><label>Zip</label></td>
								<td><input type="number" value="<%=u.getZip()%>"
									class="form-control text-center" id="inputZip" name="inputZip"
									disabled="disabled"></td>
							</tr>
							<tr>

								<td colspan="2"><input type="image"
									value="<%=u.getProfile()%>" class="form-control text-center"
									id="inputProfile" name="inputProfile" disabled="disabled"></td>
							</tr>
						</table>

					</div>
					<div id="show" style="display: none;">
						<form action="EditServlet" method="POST" id="EditForm">
							<table class="table table-striped table-bordered text-center">
								<tr>
									<td><label>Email</label></td>
									<td><input type="email" value="<%=u.getEmail()%>"
										class="form-control text-center" id="editEmail"
										name="editEmail"></td>
								</tr>
								<tr>
									<td><label>Password</label></td>
									<td><input type="password" value="<%=u.getPassword()%>"
										class="form-control text-center" id="editpassword"
										name="editpassword"></td>
								</tr>
								<tr>
									<td><label>City</label></td>
									<td><input type="text" value="<%=u.getCity()%>"
										class="form-control text-center" id="editCity" name="editCity"></td>
								</tr>
								<tr>
									<td><label for="inputState">State</label></td>
									<td><input type="text" value=" <%=u.getState()%>"
										class="form-control text-center" id="editState"
										name="editState"></td>
								</tr>
								<tr>
									<td><label>Zip</label></td>
									<td><input type="number" value="<%=u.getZip()%>"
										class="form-control text-center" id="editZip" name="editZip"></td>
								</tr>

								<tr>

									<td colspan="2">
										<div class="d-grid">
											<button class="btn btn-success" type="submit">Save</button>
										</div>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="editBtn">Edit</button>

				</div>
			</div>

		</div>
	</div>






	<!-- SweetAlert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<!-- Note:	To use Ajax, we must have to use jquery-3.1.1.min.js NOT slim.min.js -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- adding bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

	<!-- 	internal JS -->
	<script type="text/javascript">
		//adding Js for edit Button toggle

		$(document).ready(function() {

			let edit = false;

			$("#editBtn").click(function() {

				if (edit == false) {

					$("#hide").hide()
					$("#show").show()
					edit = true;
					$(this).text("Back")
				} else {

					$("#hide").show()
					$("#show").hide()
					edit = false;
					$(this).text("Edit")
				}
			})

		});

		$(document).ready(function() {

			$("#PostForm").on("submit", function(event) {

				//It is used to prevent nor flow of form after clicking on submit button

				event.preventDefault();

				console.log("u have prevented");

				let form = new FormData(this);

				//now calling servlet

				$.ajax({

					url : "AddPostServlet",
					type : "POST",
					data : form,
					success : function(data, textStatus, jqXHR) {

						swal("Good job!", "Post Successful...", "success");

					},
					error : function(jqXHR, textStatus, errorThrown) {

						swal("some thing went wrong job!!!", "", "denied");

					},

					processData : false,
					contentType : false,

				})

			})

		});
	</script>

</body>
</html>