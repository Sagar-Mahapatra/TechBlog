
<html>
<head>
<%@page import="com.MyFirstAdvJavaProject.helper.ConnectionProvider"%>
<%@page import="com.MyFirstAdvJavaProject.entities.*"%>
<%@page import="java.util.*"%>
<%@ page import="com.MyFirstAdvJavaProject.dao.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<style>
#table tr td {
	text-align: center;
}
</style>


<!-- adding Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- adding Bootstrap CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style type="text/css">
#main {
	background-repeat: none;
	background-size: 100%;
}

#table tr td {
	padding: 5px 0px;
}
</style>

</head>


<body>
	<div class="container-fluid p-5" id="main">
		<div class="row">

			<%
			Thread.sleep(1000);

			PostDao p = new PostDao(ConnectionProvider.getConnection());

			List<Posts> Posts = null;

			String catId = request.getParameter("catId");

			int cateId = Integer.parseInt(catId);

			if (cateId == 1) {

				Posts = p.getAllPost();

			} else {
				Posts = p.getPostbyCategoryId(cateId);
			}

			if (Posts.size() == 0) {

				out.print("No posts");
			}

			for (Posts prr : Posts) {
			%>
			<div class="col-6 my-3">
				<div class="card">
					<table class="card-body table-bordered" id="table">

						<tr class="card-title">

							<td class="py-2 bg-primary"><h3
									class="card-subtitle mb-2 text-light"><%=prr.getTitle()%></h3></td>
						</tr>

						<tr class="card-title">


							<%
							UserDao Us = new UserDao(ConnectionProvider.getConnection());

							User u = Us.getUserByUserId(prr.getUserId());

							System.out.println(u.getId());
							%>

							<td><h5 class="card-subtitle mb-2 text-muted"><%=u.getName()%>
									has Posted
								</h5></td>

						</tr>
						<tr class="card-title">

							<td style="height: 100px;"><h5
									class="card-subtitle mb-2 text-muted"><%=prr.getContext()%></h5></td>
						</tr>

						<tr class="card-title">

							<td style="height: 100px;"><h5
									class="card-subtitle mb-2 text-muted"><%=prr.getCODE()%></h5></td>
						</tr>

						<tr class="card-title bg-primary ">

							<td class="py-2"><a class="btn btn-outline-light"
								onclick="doLike(<%=u.getId()%>,<%=prr.getId()%>)"><i
									class="fa fa-thumbs-o-up"></i>10</a> <a
								class="btn btn-outline-light"><i class="fa fa-commenting-o"></i>20</a></td>
						</tr>

					</table>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>

	<!-- SweetAlert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<!-- Note:	To use Ajax, we must have to use jquery-3.1.1.min.js NOT slim.min.js -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- adding bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="JS\like.js"></script>
</body>
</html>
