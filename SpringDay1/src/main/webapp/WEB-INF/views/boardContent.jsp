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
			<div class="panel-heading">게시글</div>
			<div class="panel-body">
				<table>
					<tbody>
						<tr>
							<h4><c:out value="${content.title}"></c:out></h4>
							<br>
						</tr>
						<tr>
							<td>작성자</td>
							<td><c:out value="${content.writer}"></c:out></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td><c:out value="${content.indate}"></c:out></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="panel-body" height="200px">


				<%-- img 가 not null이면 --%>
				<c:if test="${not empty content.img}">
					<img src="resources/board/${content.img}" width="200px">
					<br><br>
				</c:if>
				<br>
				<span>${content.content}</span>
				<br>
			</div>
			<div class="panel-footer">
				<a href="boardUpdateForm?idx=${content.idx}"><button class="btn btn-info">수정</button></a>
				<a href="boardDelete?idx=${content.idx}"><button class="btn btn-danger">삭제</button></a> 
				<a href="boardList"><button class="btn btn-warning">목록</button></a>
			</div>
		</div>
	</div>

</body>
</html>