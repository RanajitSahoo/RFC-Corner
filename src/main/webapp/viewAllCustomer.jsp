<%@page import="com.rfc.dto.Admin"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.rfc.dto.Customer"%>
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
	max-width: 100em;
	width: 400px;
	height: 550px;
	box-shadow: 0 8px 10px 0 black;
	border: 2px solid black;
	background-color: transparent;
	border-radius: 45px 45px 45px 45px;
}
.card-head{
height:20%;

border-radius: 45px 45px 0px 0px;
}

body {
	background-image:
		url("https://wallpapers.com/images/hd/food-4k-3gsi5u6kjma5zkj0.jpg")
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
			<a class="navbar-brand" href="#"><h1 class="text-warning ">RFC-CORNER</h1></a>


			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link text-white"
						href="AdminHomePage.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link text-white" href="#">About</a></li>

					<li class="nav-item"><a class="nav-link text-white" href="#">Contact</a>
					</li>
				</ul>
				<form action="adminLogout" class="form-inline my-2 my-lg-0">
					<button class="btn btn-outline-warning my-2 my-sm-0" type="submit">
						Log0ut</button>
				</form>
			</div>
		</nav>
	</div>
	<div class="container">
		<%
		List<Customer> list = (List<Customer>) request.getAttribute("allCustomers");
		if (!list.isEmpty()) {
			Iterator<Customer> itr = list.iterator();
			while (itr.hasNext()) {

				Customer c = itr.next();
		%>
		<div class="card mt-5">

			<div class="card-head text-center bg-success">
				<h5 class="card-title"><%=c.getName()%></h5>
				<p class="card-text"></p>
			</div>
			<div class="">
				<p class="card-text text-center bg-info">details</p>
				<ul class="list-group list-group-flush">
					<label class="text-white">Email: <%=c.getEmail()%></label>
					<label class="text-white">Phone: <%=c.getMobileNumber()%></label>
				</ul>
			</div>
			<div class="card-body">
				<p class="card-text text-center bg-info">Address</p>
				<ul class="list-group list-group-flush">
					<label class="text-white">Village: <%=c.getAddress().getVillage()%></label>
					<label class="text-white">District: <%=c.getAddress().getDistrict()%></label>
					<label class="text-white">State: <%=c.getAddress().getState()%></label>
					<label class="text-white">Country: <%=c.getAddress().getCountry()%></label>
					<label class="text-white">Pincode: <%=c.getAddress().getPincode()%></label>
				</ul>
			</div>

			<div class="card-body">

				<div class="row justify-content-between">
					<div>
						<a href="updateCustomer?id=<%=c.getId()%>"
							class="btn btn-outline-success text-white">Edit</a>
					</div>
					<div>
						<a href="deleteCustomer?id=<%=c.getId()%>"
							class="btn btn-outline-danger text-white">Delete</a>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		} else {
		%>
		<h1>No Customer yet??</h1>
		<a href="registerButton">AddCustomer</a>
		<%
		}
		%>
	</div>
	<%
	} else {
	response.sendRedirect("adminLogin");
	}
	%>
</body>
</html>