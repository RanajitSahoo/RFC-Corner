<%@page import="com.rfc.dto.FoodOrder"%>
<%@page import="com.rfc.dto.Admin"%>
<%@page import="com.rfc.dto.Customer"%>
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
	FoodOrder f=(FoodOrder)request.getAttribute("foodOrder");
	Customer c=(Customer)request.getAttribute("customer");
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

			
					<a href="foodOrder?fid= <%=f.getId()%>&cid=<%=c.getId()%>"><button
						class="btn btn-outline-success my-2 my-sm-0 position-relative"
						type="submit">
						Orders <span
							class="badge badge-light position-absolute top-1 ml-1 bg-danger border border-light rounded-circle text-white ">0</span>
					</button></a>
				
				<form action="customerLogout" class="form-inline my-2 my-lg-0 ml-5">
					<button class="btn btn-outline-warning my-2 my-sm-0" type="submit">
						Logout</button>
				</form>
			</div>
		</nav>
	</div>
	<div class="continer">
		<div class="text-center">
			<h1>Menu</h1>
		</div>
		<marquee direction="left" behavior="scroll">
			Welcome mr/ms
			<%=c.getName().toUpperCase()%>
			to RFC Corner, ow your are good to go with our menu
		</marquee>
		<div class="row">
			<%
			List<Product> pds = (List<Product>) request.getAttribute("products");
			Iterator<Product> itr = pds.iterator();
			while (itr.hasNext()) {
				Product p = itr.next();
			%>

			<div class="col-md-3 mt-5">
				<div class="card">
					<div class="card-body row justify-content-around">
						<div>
							<p class="card-text text-center bg-info">Food Details</p>
							<ul class="list-group list-group-flush">
								<label>Name: <%=p.getName()%>
								</label>
								<label>Category: <%=p.getCategory()%></label>

								<label>Price: <%=p.getPrice()%>/item
								</label>
							</ul>
						</div>
						<div>
							<a href="addItem?p=<%=p.getId()%>&fid= <%=f.getId()%>&cid=<%=c.getId()%>"
								class="btn btn-outline-success">Add +</a>
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