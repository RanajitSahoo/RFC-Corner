<%@page import="com.rfc.dto.Customer"%>
<%@page import="com.rfc.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;900&display=swap')
	;

input {
	caret-color: red;
}

body {
	margin-left: 100px;
	width: 100vw;
	height: 100vh;
	background-image:
		url("https://wallpapers.com/images/hd/food-4k-m37wpodzrcbv5gvw.jpg");
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover; display : flex;
	align-items: center;
	text-align: center;
	justify-content: flex-start;
	place-items: center;
	overflow: hidden;
	font-family: poppins;
	display: flex;
}

.container {
	position: relative;
	width: 350px;
	height: 600px;
	border-radius: 20px;
	padding: 40px;
	box-sizing: border-box;
	background: #ecf0f3;
	box-shadow: 14px 14px 20px , -14px -14px 80px;
}

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
	font-size: 1.8rem;
	color: #1DA1F2;
	letter-spacing: 1px;
}
.brand-subtitle{
	margin-top: 5px;
	font-weight: 600;
	font-size: 0.7rem;
	color: #1DA1F2;
	letter-spacing: 1px;
}

.inputs {
	text-align: left;
	margin-top: 30px;
}

label, input, button {
	display: block;
	width: 100%;
	padding: 0;
	border: none;
	outline: none;
	box-sizing: border-box;
}

label {
	margin-bottom: 4px;
}

label:nth-of-type(2) {
	margin-top: 12px;
}

input::placeholder {
	color: gray;
}

input {
	background: #ecf0f3;
	padding: 10px;
	padding-left: 20px;
	height: 50px;
	font-size: 14px;
	border-radius: 50px;
	box-shadow: inset 6px 6px 6px #cbced1, inset -6px -6px 6px white;
}

button {
	color: white;
	margin-top: 20px;
	background: #1DA1F2;
	height: 40px;
	border-radius: 20px;
	cursor: pointer;
	font-weight: 900;
	box-shadow: 6px 6px 6px #cbced1, -6px -6px 6px white;
	transition: 0.5s;
}

button:hover {
	box-shadow: none;
}

a {
	position: absolute;
	font-size: 8px;
	bottom: 4px;
	right: 4px;
	text-decoration: none;
	color: black;
	background: yellow;
	border-radius: 10px;
	padding: 2px;
}

h1 {
	position: absolute;
	top: 0;
	left: 0;
}
</style>
</head>
<body>
	<%
	Customer c=(Customer) session.getAttribute("customer");
	Admin admin = (Admin) session.getAttribute("admin");
	if (admin != null) {
	%>
	<div class="container">
		<div class="brand-logo"></div>
		<div class="brand-title">RFC-CORNER</div>
		<div class="brand-subtitle">Customer Food Order</div>
		<form action="addFoodOrder?cid=<%=c.getId() %>" method="post">
			<div class="inputs ">
				<label>NAME</label> <input type="text" placeholder="enter name"
					name="name" required="required" /> <label>MOBILE NUMBER</label> <input
					type="text" placeholder="enter mobile number" name="mobileNumber"
					required="required" />
				<button type="submit">Order</button>


			</div>
		</form>

	</div>
	<%
	} else {
	response.sendRedirect("adminLogin");
	}
	%>
</body>
</html>