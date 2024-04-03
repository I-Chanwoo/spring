<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>LOGIN</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<h1></h1>
		<h2>SPRING VER 03</h2>
		<h4>LOGIN</h4>
		<br>
		<form action = "login" method="post">
			<table class="table table-borderless" width="300px">
				<tr>
					<td>ID</td>
					<td><input type=""text name="id" class="form-control"></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><input type="password" name="pw" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-primary">로그인</button>
					</td>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
</body>