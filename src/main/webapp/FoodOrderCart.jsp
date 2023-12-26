<%@page import="java.util.Iterator"%>
<%@page import="com.rfc.dto.Item"%>
<%@page import="java.util.List"%>
<%@page import="com.rfc.dto.Admin"%>
<%@page import="com.rfc.dto.FoodOrder"%>
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

.continer {
	/* width:1000px; */
	height: 200px;
	background-color: yellow;
}
</style>
</head>
<body>
	<%
	FoodOrder f = (FoodOrder) request.getAttribute("foodOrder");
	Customer c = (Customer) request.getAttribute("customer");
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
					<li class="nav-item"><a class="nav-link text-white" href="#">About
							<%=f.getMobileNumber()%></a></li>

					<li class="nav-item"><a class="nav-link text-white" href="#">Contact<%=c.getName()%></a>
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
			<h1>Order</h1>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">SL.NO</th>
					<th scope="col">NAME</th>
					<th scope="col">QUANTITY</th>
					<th scope="col">TYPE</th>
					<th scope="col">PRICE</th>
					<th scope="col">DISCOUNT</th>
					<th scope="col">TOTAL</th>

				</tr>
			</thead>
			<tbody>

				<%
				List<Item> items = (List<Item>) request.getAttribute("items");
				Iterator<Item> itr = items.iterator();
				double subtotal = 0;
				int slno = 1;
				while (itr.hasNext()) {
					Item i = itr.next();
				%>
				<%
				if(slno%2!=0){%>
					<tr class="bg-success">
					<th scope="row"><%=slno++%></th>
					<td><%=i.getName()%></td>
					<td><%=i.getQuantity()%> </td>
					<td><%=i.getType()%> </td>
					<td><%=i.getPrice()%></td>
					<td><%=0%></td>
					<td><%=i.getQuantity() * i.getPrice()%></td>
				</tr>
				<%}else{%>
					<tr class="bg-warning">
					<th scope="row"><%=slno++%></th>
					<td><%=i.getName()%></td>
					<td><%=i.getQuantity()%></td>
					<td><%=i.getType()%> </td>
					<td><%=i.getPrice()%></td>
					<td><%=0%></td>
					<td><%=i.getQuantity() * i.getPrice()%></td>
				</tr>
				<% }
				%>
				

				<%
				subtotal += (i.getQuantity() * i.getPrice());
				}
				%>
				<tr class="bg-info">
					<th scope="row">SUB TOTAL =</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><%=subtotal%></td>
				</tr>
				<tr class="">
					<th scope="row"></th>
					<td></td>
					<td></td>
					<td><a href="generateBill?fid=<%=f.getId() %>&cid=<%=c.getId() %>&totalcost=<%=subtotal%>" class="btn btn-success my-2 my-sm-0">GENERATE BILL</a></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
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