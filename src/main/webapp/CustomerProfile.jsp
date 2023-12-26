<%@page import="com.rfc.dto.Admin"%>
<%@page import="com.rfc.dto.Customer"%>
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
body {
	background-image:
		url("https://wallpapers.com/images/hd/food-4k-1vrcb0mw76zcg4qf.jpg")
		!important;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
}

nav {
	position: fixed;
	background-color: black;
}

.container {
	/* width:1000px; */
	
	background-color: yellow;
}
</style>
</head>
<body>
<%Customer c=(Customer)request.getAttribute("customer"); %>
<%Admin admin=(Admin)session.getAttribute("admin"); 
		if(admin!=null){%>
		<div>
		<nav class="navbar navbar-expand-lg navbar-light bg-dark ">
			<a class="navbar-brand" href="#"><h1 class="text-warning bg-dark">RFC-CORNER</h1></a>


			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link text-white"
						href="index.jsp">Customer Profile Page <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link text-white" href="#">About</a></li>

					<li class="nav-item"><a class="nav-link text-white" href="#">Contact</a>
					</li>
				</ul>
				
				<form action="customerLogout" class="form-inline my-2 my-lg-0 ml-5">
					<button class="btn btn-outline-warning my-2 my-sm-0" type="submit">
						Logout</button>
				</form>
			</div>
		</nav>
	</div>
	<div class="container">
	<div class="text-center"> <h1>Name</h1> </div>
		<div class="text-center"> <h4><%=c.getName() %></h4> </div>
		<div class="text-center"> <h1>Info</h1> </div>
		<div class="row justify-content-around">
			
			<label>email:</label><label><%=c.getEmail() %></label>
			
		</div>
		<div class="row justify-content-around">
			
			<label>Mobile Number:</label><label><%=c.getMobileNumber() %></label>
			
		</div>
		<div class="text-center"> <h1>Address</h1> </div>
		<div class="row justify-content-around">
			
			<label>village/town/city:</label><label><%=c.getAddress().getVillage().toUpperCase() %></label>
			
		</div>
		<div class="row justify-content-around">
			
			<label>District:</label><label><%=c.getAddress().getDistrict() %></label>
			
		</div>
		<div class="row justify-content-around">
			
			<label>State:</label><label><%=c.getAddress().getState() %></label>
			
		</div>
		<div class="row justify-content-around">
			
			<label>Country:</label><label><%=c.getAddress().getCountry() %></label>
			
		</div>
		<div class="row justify-content-around">
			
			<label>Pincode:</label><label><%=c.getAddress().getPincode() %></label>
			
		</div>
		
	</div>
		<%}else{ 
			response.sendRedirect("adminLogin");
		} %>
</body>
</html>