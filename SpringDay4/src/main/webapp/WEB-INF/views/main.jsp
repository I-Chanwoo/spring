<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
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
		<h4>BOARD</h4>
		<br>
		<div class="rounded">

			<!-- board -->
			<!-- 리스트 테이블 -->
			<div id="viewList" class="panel-body">
				<table class="table table-borderless table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody id="list">
					</tbody>
				</table>
				<!-- button -->
				<button id="goForm" class="btn btn-outline-secondary">글쓰기</button>
			</div>

			<!-- 글쓰기 form -->
			<div id="viewForm" style="display: none;">
				<form id="upload" action="_URL" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
					<div class="panel-body">
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
						<span><textarea rows="7" name="content"
								class="form-control"></textarea></span>
					</div>
					<!-- button -->
					<div class="panel-footer">
						<button id="goInsert" class="btn btn-info" type="button">등록</button>
				</form>
				<button type="button" id="goList" class="btn btn-outline-primary">목록</button>
				<button type="reset" id="fclear" class="btn btn-outline-danger">초기화</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//html 전체 로드되고 바로 적용
		<%-- 토큰 값 추가 --%>
		let csrfTokenValue = "${_csrf.token}"
		let csrfHeaderName = "${_csrf.headerName}"
		
		console.log("헤더:"+csrfHeaderName)
		console.log("토큰: "+csrfTokenValue)
		
		$(document).ready(function() {

			loadList();

			// 글쓰기를 눌렀을떄 함수 실행
			$("#goForm").on("click", function() {
				$("#viewList").css("display", "none");
				$("#viewForm").css("display", "block");
			})

			// 목록을 눌렀을떄 함수 실행
			$("#goList").on("click", function() {
				$("#viewList").css("display", "block");
				$("#viewForm").css("display", "none");
			})

			// 글 작성을 눌렀을 때 함수 실행
			$("#goInsert").on("click", function() {
				let form = document.getElementById("upload")
				let data = new FormData(form);
				
				

				$.ajax({
					url : "boardInsert",
					type : "post",
					enctype : "multipart/form-data",
					data : data,
					beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					processData : false,
					contentType : false,
					cache : false,
					timeout : 10000, //10초
					success : loadList,
					error : function() {
						alert("error");
					}
				})

				$("#fclear").trigger("click");
			})
		});

		// 목록을 눌렀을떄 함수 실행
		function goContent(idx) {

			if ($("#title" + idx).css("display") == "none") {
				$("#title" + idx).css("display", "table-row");//tr은 실체가 없으니 block 하면 안됨
			} else {
				$("#title" + idx).css("display", "none");
				$.ajax({
					url : "addCount",
					type : "post",
					data : {
						"idx" : idx
					},
					cache : false,
					timeout : 10000, //10초
					success : loadList,
					error : function() {
						alert("error");
					}
				})
			}

		}

		//글 삭제
		function goDelete(boardIdx) {
			$.ajax({
				url : "boardDelete",
				type : "post",
				data : {
					idx : boardIdx
				},
				dataType : "text", //이거 쓰면 문제 생김 왜지?
				cache : false,
				timeout : 10000, //10초
				success : loadList,
				error : function() {
					alert("error");
				}
			})
		}

		//글 수정
		function goUpdate(idx) {
			$("#ta" + idx).attr("readonly", false);
			$("#to" + idx).css("display", "none")
			$("#up" + idx).css("display", "inline")

			let title = $("#t" + idx).text()
			let writer = $("#w" + idx).text()

			let newTitle = "<input id='nt"+idx+"' type='text' name = 'title' class='form-control' value = '" + title + "'>"
			let newWriter = "<input id = 'nw"+idx+"' type='text' name = 'writer' class='form-control' value = '"+ writer +"'>"

			$("#t" + idx).html(newTitle);
			$("#w" + idx).html(newWriter);

		}
		// 글 작성을 눌렀을 때 함수 실행
		function update(idx) {

			let title = $("#nt" + idx).val()
			let writer = $("#nw" + idx).val()
			let content = $("#ta" + idx).val()

			console.log(title + " " + content)

			$.ajax({
				url : "boardUpdate",
				type : "post",
				data : {
					"idx" : idx,
					"title" : title,
					"writer" : writer,
					"content" : content
				},
				//dataType:"json", //받아오는 데이터의 형태를 명시
				cache : false,
				timeout : 10000, //10초
				success : loadList,
				error : function() {
					alert("error");
				}
			})
		}

		//1. 게시글 전체 조회 요청
		function loadList() {
			$.ajax({
				url : "boardList",
				type : "get",
				dataType : "json",
				success : makeView, //응답코드가 200일때 success, callback function 불러오기
				error : function() {
					alert("error");
				}
			});
		}

		// loadList 에서 요청 성공시 콜백함수
		function makeView(data) {
			console.log(data);

			let html = "";
			//jQuery for-each
			$
					.each(
							data,
							function(idx, board) {
								console.log(board);
								html += "<tr>"
								html += "<td scope='row'>" + idx + "</td>"
								//클릭하면 상세내용 보이게
								html += "<td id='t"+board.idx+"'><a href='javascript:goContent("
										+ board.idx
										+ ")' class='text-dark'>"
										+ board.title + "</a></td>"
								html += "<td id='w"+board.idx+"'>"
										+ board.writer + "</td>"
								html += "<td>" + board.indate + "</td>"
								html += "<td>" + board.count + "</td>"
								html += "</tr>"

								// 상세내용 추가
								html += "<tr id='title"+board.idx+"' style='display:none'>"
								html += "<td scope='row'> 내용 </td>"
								html += "<td colspan='4'>"

								if (board.img != null) {
									html += "<img width='300px' src='resources/board/" + board.img + "'>"
									html += "<br><br>"
								}
								html += "<textarea id='ta"+board.idx+"' row='7' class='form-control' readonly='readonly'>"
										+ board.content + "</textarea>"
								html += "<br>"
								html += "<button id = 'to"
										+ board.idx
										+ "' onclick = 'goUpdate("
										+ board.idx
										+ ")' class='btn btn-outline-secondary'>수정</button>&nbsp;"
								html += "<span><button id = 'up"
										+ board.idx
										+ "' onclick = 'update("
										+ board.idx
										+ ")' class='btn btn-outline-secondary' style='display:none'>등록</button></span>&nbsp;"
								html += "<span><button onclick='goDelete("
										+ board.idx
										+ ")' class='btn btn-outline-danger'>삭제</button></span>"
								html += "</td>"
								html += "</tr>"
							});
			$("#list").html(html);
		}
	</script>
</body>
</html>