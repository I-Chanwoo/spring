<%@page import="com.smhrd.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="kor">
<head>
<title>${content.title}</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
td {
	width: 100px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>CONTENT</h2>
		<div class="panel panel-default">
			<div class="panel-heading">WRITE BOARD</div>
			<div class="panel-body">
				<form action="boardInsert" method="post" enctype="multipart/form-data">
					<table class="table table-bordered table-hover">
						<tr>
							<th>제목</th>
							<th><input type="text" name="title" class="form-control"></th>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" name="writer" class="form-control"></td>
						</tr>
						<tr>
							<td>파일</td>
							<td><input type="file" name="img" class="form-control"></td>
						</tr>
					</table>
			</div>
			<div class="panel-body">
				<span><textarea rows="7" name="content" class="form-control"></textarea></span>
			</div>
			<div class="panel-footer">
				<button class="btn btn-info" type="submit">등록</button>
			</form>
				<a href="boardList"><button class="btn btn-warning">목록</button></a>
			</div>
		</div>
	</div>

</body>
</html>