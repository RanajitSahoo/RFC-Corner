<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
		url("https://i.pinimg.com/originals/d3/6d/46/d36d462db827833805497d9ea78a1343.jpg");
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover; display : flex;
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
	width: 350px;
	height: 500px;
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
	

	<div class="container">
		<div class="brand-logo"></div>
		<div class="brand-title">RFC-CORNER</div>
		<form:form action="loggedinAdmin" modelAttribute="admin">
		<div class="inputs">
			<label>EMAIL</label> <form:input type="email" placeholder="enter email" path="email" />
			<label>PASSWORD</label> <form:input type="password"
				placeholder="enter password" path="password"/>
			<button type="submit">LOGIN</button>
		</div>
		</form:form>
		<a
			href="https://www.linkedin.com/search/results/people/?firstName=Ranajit&lastName=Sahoo&origin=SEO_PSERP&sid=Scu">Made
			by Ranajit Sahoo</a>
	</div>
</body>
</html>