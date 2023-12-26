<%@page import="com.rfc.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
body {
	background-image:
		url("https://wallpapers.com/images/hd/refreshing-food-drinks-tropical-ke0k58bof3ebzb8s.webp")
		!important;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
}

</style>
</head>
<body>
	<div>
		<nav class="navbar navbar-expand-lg navbar-light bg-transparent ">
			<a class="navbar-brand" href="#"><h1 class="text-warning bg-dark">RFC-CORNER</h1></a>


			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link text-white"
						href="index.jsp">Admin Home Page <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link text-white" href="#">About</a></li>

					<li class="nav-item"><a class="nav-link text-white" href="#">Contact</a>
					</li>
				</ul>
				<form action="adminLogout" class="form-inline my-2 my-lg-0">
					<button class="btn btn-outline-warning my-2 my-sm-0" type="submit">
						Logout</button>
				</form>
			</div>
		</nav>
	</div>
	<div>
	<h1>${msg}</h1>
	</div>
	<%Admin admin=(Admin)session.getAttribute("admin"); 
		if(admin!=null){%>
			<div class="container d-flex row justify-content-around m-5">
			<div class="m-5">
				<a href="loginButton"><button class="btn btn-outline-warning my-2 my-lg-0 p-5" type="submit" >
						Login Customer</button></a>
			</div>
			<div class="m-5">
				<a href="addProduct"><button class="btn btn-outline-success my-2 my-lg-0 p-5" type="submit" >
						Add Product</button></a>
			</div>
			<div class="m-5">
				<a href="viewProducts"><button class="btn btn-outline-primary my-2 my-lg-0 p-5" type="submit" >
						View All Products</button></a>
			</div>
			<div class="m-5">
				<a href="viewCustomers"><button class="btn btn-outline-info my-2 my-lg-0 p-5" type="submit" >
						View All Customers</button></a>
			</div>
			<div class="m-5">
				<a href="viewAllFoodOrder"><button class="btn btn-outline-danger my-2 my-lg-0 p-5" type="submit" >
						View All Food-Orders</button></a>
			</div>
		</div>
		<%}else{ %>
			<div class="container d-flex row justify-content-around m-5">
			<div class="m-5">
				<a href="adminLogin"><button class="btn btn-outline-warning my-2 my-lg-0 p-5" type="submit" >
						Login Customer</button></a>
			</div>
			<div class="m-5">
				<a href="adminLogin"><button class="btn btn-outline-success my-2 my-lg-0 p-5" type="submit" >
						Add Product</button></a>
			</div>
			<div class="m-5">
				<a href="adminLogin"><button class="btn btn-outline-primary my-2 my-lg-0 p-5" type="submit" >
						View All Products</button></a>
			</div>
			<div class="m-5">
				<a href="adminLogin"><button class="btn btn-outline-info my-2 my-lg-0 p-5" type="submit" >
						View All Customers</button></a>
			</div>
			<div class="m-5">
				<a href="adminLogin"><button class="btn btn-outline-danger my-2 my-lg-0 p-5" type="submit" >
						View All Food-Orders</button></a>
			</div>
		</div>
		<%} %>
	%>
	

</body>
</html>