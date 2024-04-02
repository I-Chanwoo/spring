<%@page import="com.smhrd.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="kor">
<head>
<title>수정 - ${content.title}</title>
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
				<%-- 파일 업로드 하는 거 아니면 multi는 사용하지 않는 게 낫다 --%>
				<form action="boardUpdate" method="post"> 
					<input type = "hidden" name = "idx" value="${content.idx}">
					<table class="table table-bordered table-hover">
						<tr>
							<th>제목</th>
							<th><input type="text" name="title" class="form-control" value="${content.title}"></th>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" name="writer" class="form-control" value="${content.writer}"></td>
						</tr>
						<tr>
							<td>파일</td>
							<c:if test="${not empty content.img}">
							<td><img src="resources/board/${content.img}" width="200px"></td>
							<br>							
							</c:if>
							<!--<td><input type="file" name="img" class="form-control"></td>-->
						</tr>
					</table>
			</div>
			<div class="panel-body">
				<span><textarea rows="7" name="content" class="form-control">${content.content}</textarea></span>
			</div>
			<div class="panel-footer">
				<button class="btn btn-info" type="submit">수정</button>
				<a href="boardList"><button class="btn btn-warning">목록</button></a>
			</div>
			</form>
		</div>
	</div>

</body>
</html>