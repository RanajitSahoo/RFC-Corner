<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.rfc.dto.Item"%>
<%@page import="java.util.List"%>
<%@page import="com.rfc.dto.Admin"%>
<%@page import="com.rfc.dto.Customer"%>
<%@page import="com.rfc.dto.FoodOrder"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style type="text/css">
.brand-logo {
	height: 100px;
	width: 100px;
	background-image:
		url("https://thumbs.dreamstime.com/z/rfc-abstract-technology-logo-design-white-background-creative-initials-letter-concept-276746404.jpg");
	background-size: cover; margin : auto;
	border-radius: 50%;
	box-sizing: border-box;
	box-shadow: 7px 7px 10px #cbced1, -7px -7px 10px white;
	margin: auto;
}
.brand-title {
	margin-top: 10px;
	font-weight: 900;
	font-size: 2rem;
	color: #1DA1F2;
	letter-spacing: 3px;
}
</style>
</head>
<body>
<%
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
LocalDateTime now = LocalDateTime.now();  

	FoodOrder f = (FoodOrder) request.getAttribute("foodOrder");
	Customer c = (Customer) request.getAttribute("customer");
	Admin admin = (Admin) session.getAttribute("admin");
	if (admin != null) {
	%>
	<div class="card">
  <div class="card-body">
    <div class="container mb-5 mt-3">
      <div class="row d-flex align-items-baseline">
        <div class="col-xl-9">
          <p style="color: #7e8d9f;font-size: 20px;">Invoice >> <strong>ID:<%=f.getId()+""+0023 %></strong></p>
        </div>
        <div class="col-xl-3 float-end">
          <a class="btn btn-light text-capitalize border-0" data-mdb-ripple-color="dark"><i
              class="fa fa-print text-primary"></i> Print</a>
          <a class="btn btn-light text-capitalize" data-mdb-ripple-color="dark"><i
              class="fa fa-file-pdf text-danger"></i> Export</a>
        </div>
        <hr>
      </div>

      <div class="container">
      <div class="brand-logo"></div>
        <div class="col-md-12">
          <div class="text-center text-info">
            
           <div class="brand-title">RFC-CORNER</div>
          </div>

        </div>


        <div class="row">
          <div class="col-xl-9">
            <ul class="list-unstyled">
              <li class="text-muted">Customer: <span style="color:#5d9fc5 ;"><%=c.getName() %></span></li>
              <li class="text-muted">Email: <span style="color:#5d9fc5 ;"><%=c.getEmail() %></span></li>
              <li class="text-muted">Address: <span style="color:#5d9fc5 ;"><%=c.getAddress().getVillage()+","+c.getAddress().getDistrict()+","+c.getAddress().getPincode() %></span></li>
             <li class="text-muted">State: <span style="color:#5d9fc5 ;"><%=c.getAddress().getState() %></span></li>
              <li class="text-muted">Country: <span style="color:#5d9fc5 ;"><%=c.getAddress().getCountry() %></span></li>
              <li class="text-muted"><i class="fa fa-phone"></i> <%=c.getMobileNumber() %></li>
            </ul>
          </div>
          <div class="col-xl-3">
            <p class="text-info">Order by</p>
            <ul class="list-unstyled">
              <li class="text-muted"><i class="fa fa-circle" style="color:#84B0CA ;"></i> <span
                  class="fw-bold">Name: </span><%=f.getName() %></li>
                  <li class="text-muted"><i class="fa fa-circle" style="color:#84B0CA ;"></i> <span
                  class="fw-bold">Mobile: </span><%=f.getMobileNumber() %></li>
              <li class="text-muted"><i class="fa fa-circle" style="color:#84B0CA ;"></i> <span
                  class="fw-bold">Date: </span><%= dtf.format(now)%></li>
              <li class="text-muted"><i class="fa fa-circle" style="color:#84B0CA ;"></i> <span
                  class="me-1 fw-bold">Status:</span><span class="badge bg-warning text-black fw-bold">
                  Unpaid</span></li>
            </ul>
          </div>
        </div>

        <div class="row my-2 mx-1 justify-content-center">
          <table class="table table-striped table-borderless">
            <thead style="background-color:#84B0CA ;" class="text-white">
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
				int totalqnt=0;
				double subtotal = 0;
				double tax=0;
				int slno = 1;
				while (itr.hasNext()) {
					Item i = itr.next();
				%>
				<%
				if(slno%2!=0){%>
					<tr class="bg-light">
					<th scope="row"><%=slno++%></th>
					<td><%=i.getName()%></td>
					<td><%=i.getQuantity()%> </td>
					<td><%=i.getType()%> </td>
					<td><%=i.getPrice()%></td>
					<td><%=0%></td>
					<td><%=i.getQuantity() * i.getPrice()%></td>
				</tr>
				<%}else{%>
					<tr class="bg-dark text-white">
					<th scope="row"><%=slno++%></th>
					<td><%=i.getName()%></td>
					<td><%=i.getQuantity()%></td>
					<td><%=i.getType()%> </td>
					<td><%=i.getPrice()%></td>
					<td><%=0%></td>
					<td><%=i.getQuantity() * i.getPrice()%></td>
				</tr>
				<% }subtotal += (i.getQuantity() * i.getPrice());
				totalqnt+=i.getQuantity();
				}
				tax=(subtotal*15)/100;
				%>
				

            </tbody>

          </table>
        </div>
        <div class="row">
          <div class="col-xl-8 bg-secondary">
            <p class="ms-3 "style="text-decoration: underline;">Add your notes  below when you get the bill from the counter</p>

          </div>
          <div class="col-xl-4">
          <div class="row justify-content-around">
          	<h5 class="text-info me-4">Total Quantity:</h5>
          	<h5 class="text-muted ms-3"><%=totalqnt %></h5>
          </div>
          <div class="row justify-content-around">
          	<h5 class="text-info me-4">SubTotal    :</h5>
          	<h5 class="text-muted ms-3"><%=subtotal %></h5>
          </div>
          <div class="row justify-content-around">
          	<h5 class="text-info me-4">Tax(15%) :</h5>
          	<h5 class="text-muted ms-3"><%=tax%></h5>
          </div>
          <hr>
           <div class="row justify-content-around">
          	<h5 class="text-primary me-4">Total Amount: </h5>
          	<h5 class="text-black ms-3"><%=subtotal+tax %></h5>
          </div>
            
          </div>
        </div>
        <hr>
        <div class="row">
          <div class="col-xl-10">
            <p>Thank you for coming to RFC-CORNER!! Come Again</p>
          </div>
          <div class="col-xl-2">
           <a href="payBill?total=<%=subtotal+tax %>"> <button type="button" class="btn btn-primary text-capitalize"
              style="background-color:#60bdf3 ;">Pay Now</button></a>
          </div>
        </div>

      </div>
    </div>
  </div>
  <%
	} else {
	response.sendRedirect("adminLogin");
	}
	%>
</div>
</body>
</html>