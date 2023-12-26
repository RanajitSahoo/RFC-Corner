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
	margin: 0;
	width: 100vw;
	height: 100vh;
	background-image:
		url("https://wallpapers.com/images/high/food-4k-4080-x-2295-9g4bc6lii3nfmbbm.webp");
	background-repeat: no-repeat;
	background-size: cover;
	display: flex;
	align-items: center;
	text-align: center;
	justify-content: center;
	place-items: center;
	overflow: hidden;
	font-family: poppins;
	display: flex;
}

.container {
	position: relative;
	width: 70%;
	height: auto;
	border-radius: 20px;
	padding: 40px;
	box-sizing: border-box;
	background: #ecf0f3;
	box-shadow: 14px 14px 20px graytext, -14px -14px 80px;
}

.brand-logo {
	height: 100px;
	width: 100px;
	background-image:
		url("https://thumbs.dreamstime.com/z/rfc-abstract-technology-logo-design-white-background-creative-initials-letter-concept-276746404.jpg");
	background-size: cover;
	margin: auto;
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
	margin-top: 10px;
	font-weight: 600;
	font-size: 1.2rem;
	color: #1DA1F2;
	letter-spacing: 2px;
}

.inputs {
	text-align: left;
	margin-top: 30px;
}

label, input {
	display: inline;
	width: 40%;
	padding: 10px;
	margin-top: 10px; border : none;
	outline: none;
	box-sizing: border-box;
	border: none;
}

.in>label, .in>input {
	display: inline;
	width: 38%;
	padding: 10px;
	margin-top: 10px;
	border: none;
	outline: none;
	box-sizing: border-box;
}

button {
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
	m
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
	font-size: 18px;
	bottom: 14px;
	right: 14px;
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
	Admin admin = (Admin) session.getAttribute("admin");
	if (admin != null) {
	%>
<div class="container">
		<div class="brand-logo"></div>
		<div class="brand-title">RFC-CORNER</div>
		<div class="brand-subtitle">Product Save form </div>
		<form action="saveProduct" method="get" >
			<div class="inputs " >
				<div class="text-info">

					<label>NAME</label> <input type="text" placeholder="enter product name"
						name="name" required="required"/> 
						<label class="ml-5">IMAGE</label> <input
						type="url" placeholder="give the image url" name="image" />


				</div>
				<div class="in">
					<label>CATEGORY</label> <input type="text"
						placeholder="enter product category" name="category" required="required"/> 
						<label>STOCK</label>
					<input type="text" placeholder="enter stock quantity" name="stock" required="required"/>
				</div>
				<div class="d-flex row justify-content-around">
					<label>PRICE</label> <input type="number" placeholder="enter price of product"
						name="price" required="required"/> 
						
				</div>
				<button type="submit">SAVE PRODUCT</button>
				
			</div>
		</form>
		<form action="AdminHomePage.jsp"><button type="submit" >Back</button></form>
		
	</div>
	<%
	} else {
		response.sendRedirect("adminLogin");
	}
	%>
</body>
</html>