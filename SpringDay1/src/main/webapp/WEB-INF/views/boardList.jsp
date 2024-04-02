<%@page import="com.smhrd.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>BOARD LIST</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>SPRING VER 01</h2>
		<div class="panel panel-default">
			<div class="panel-heading">TEST BOARD</div>

			<table class="table table-bordered table-hover">
				<thead>
					<!-- 줄바꿈 -->
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>내용</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>사진</th>
					</tr>
				</thead>

				<tbody>
					<%-- 
					모델 안에 있는 list 출력해보기 
					모델 >> Request 안에 있음
					--%>
					<%-- 스코프를 매핑하는 순서 > page > request > session 에서 찾음
					만약 session애서 찾고싶으면 SessionScope.list로 표기하면 됨--%>
					<c:forEach items="${list}" var="item" varStatus="count">
						<tr>
							<td>${count.count}</td>
							<%-- 시행 횟수를 담은 변수 --%>
							<td><a href="boardContent?idx=${item.idx}">${item.getTitle()}</a></td>
							<%-- ${item.title}로 쓰는 것도 가능, 알아서 item.getTitle()로 변경 --%>
							<td><c:out value="${item.getWriter()}"></c:out></td>
							<td><c:out value="${item.getContent()}"></c:out></td>
							<td><c:out value="${item.getIndate()}"></c:out></td>
							<td><c:out value="${item.getCount()}"></c:out></td>
							<td><c:out value="${item.getImg()}"></c:out></td>
						</tr>
					</c:forEach>

					<%--
					//scope를 가져오기::  scope; 프로그래밍에서 변수나 객체의 생존 기간(lifetime)과 접근 가능한 범위를 나타내는 개념
					List<Board> boardListScriptlet = (List<Board>)request.getAttribute("list");
					for (int idx = 0; idx < boardListScriptlet.size(); idx++){
						Board item = boardListScriptlet.get(idx);
					%>
					<tr>
						<td><%=idx+1%></td>
						<td><%=item.getTitle()%></td>
						<td><%=item.getWriter()%></td>
						<td><%=item.getContent()%></td>
						<td><%=item.getCount()%></td>
						<td><%=item.getImg()%></td>
					</tr>
					<%} --%>
				</tbody>
			</table>
			<div class="panel-footer">스프링 DAY01 테스트</div>
		</div>
		<a href="boardForm"><button class="btn btn-primary btn-sm">
				글쓰기</button></a>
	</div>

</body>
</html>