<%@page import="java.util.Iterator"%>
<%@page import="com.rfc.dto.FoodOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.rfc.dto.Admin"%>
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
</style>
</head>
<body>
<%
	Admin admin = (Admin) session.getAttribute("admin");
	if (admin != null) {
	%>
	<div>
		<nav class="navbar navbar-expand-lg navbar-light bg-dark ">
			<a class="navbar-brand" href="#"><h1 class="text-warning bg-dark">RFC-CORNER</h1></a>


			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link text-white"
						href="index.jsp">Customer Home Page <span class="sr-only">(current)</span>
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
	<div class="continer">
		<div class="text-center">
			<h1>All Orders</h1>
		</div>
		<table class="table">
			<thead>
				<tr class="bg-warning">
					<th scope="col">SL.NO</th>
					<th scope="col">NAME</th>
					<th scope="col">MOBILE NUMBER</th>
					<th scope="col">ACTUAL CUSTOMER</th>
					<th scope="col">CUSTOMER MOBILE</th>
					<th scope="col">TOTAL-COST</th>

				</tr>
			</thead>
			<tbody>

				<%
				List<FoodOrder> items = (List<FoodOrder>) request.getAttribute("orders");
				Iterator<FoodOrder> itr = items.iterator();
				double subtotal = 0;
				int slno = 1;
				while (itr.hasNext()) {
					FoodOrder f = itr.next();
				
				
				%>
				<tr class="bg-success">
					<th scope="row"><%=slno++%></th>
					<td><%=f.getName()%></td>
					<td><%=f.getMobileNumber()%></td>
					<td><%=f.getCustomer().getName()%></td>
					<td><%=f.getCustomer().getMobileNumber()%></td>
					<td><%=f.getTotalCost()%></td>
				</tr>
				
				
				<%
				}
				%>

			</tbody>
		</table>


	</div>

	<%
	
	} else {
	response.sendRedirect("adminLogin");
	}
	%>
</body>
</html>