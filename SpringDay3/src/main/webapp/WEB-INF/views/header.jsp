<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<nav class="navbar navbar-expand-lg bg-white sticky-top">
	<div class="container-fluid">
		<a class="navbar-brand text-dark" href="/controller">SPRING03</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">


			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-end"
			id="navbarNav">
			<ul class="nav nav-pills">
				<c:if test="${empty loginSession}">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="/controller/joinForm">Join</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/controller/loginForm">Login</a>
					</li>
				</c:if>
				<c:if test="${not empty loginSession}">
					<li class="nav-item"><a class="nav-link" aria-current="page" href="#">${loginSession.nick}님 반갑습니다!</a></li>
					<li class="nav-item">
						<a class="nav-link" href="/controller/loginForm">MY PAGE</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="logout">로그아웃</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>
