<%@page import="com.rfc.dto.Admin"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.rfc.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style type="text/css">
.card {
	max-width: 18em;
	box-shadow: 0 8px 10px 0 black;
}

body {
	background-image:
		url("https://wallpapers.com/images/high/food-4k-4080-x-2295-9g4bc6lii3nfmbbm.webp")
		!important;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%
	Admin admin = (Admin) session.getAttribute("admin");
	if (admin != null) {
	%>
	<div>
		<nav class="navbar navbar-expand-lg navbar-light bg-transparent ">
			<a class="navbar-brand" href="#"><h1 class="text-warning bg-dark">RFC-CORNER</h1></a>


			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link text-white"
						href="AdminHomePage.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link text-white" href="#">About</a></li>

					<li class="nav-item"><a class="nav-link text-white" href="#">Contact</a>
					</li>
				</ul>
				<form action="adminLogin" class="form-inline my-2 my-lg-0">
					<button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Admin
						Login</button>
				</form>
			</div>
		</nav>
	</div>
	<div class="container">
		<div class="row">
			<%
			List<Product> pds = (List<Product>) request.getAttribute("products");
			Iterator<Product> itr = pds.iterator();
			while (itr.hasNext()) {
				Product p = itr.next();
			%>
			<div class="col-md-3 mt-5">
				<div class="card">
					<img src="<%=p.getImage()%>" class="card-img-top"
						alt="Image not available">

					<div class="card-body">
						<p class="card-text text-center bg-info">Food Details</p>
						<ul class="list-group list-group-flush">
							<label>Name: <%=p.getName()%>
							</label>
							<label>Category: <%=p.getCategory()%></label>
							<label>Stock: <%=p.getStock()%>
							</label>
							<label>Price: <%=p.getPrice()%></label>
						</ul>
					</div>
					<div class="card-body ">
						<div class="row justify-content-between">
							<div>
								<a href="updateProduct?id=<%=p.getId()%>"
									class="btn btn-outline-success">Edit</a>
							</div>
							<div>
								<a href="deleteProduct?id=<%=p.getId()%>"
									class="btn btn-outline-danger">Delete</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%
	} else {
		response.sendRedirect("adminLogin");
	}
	%>

</body>
</html>