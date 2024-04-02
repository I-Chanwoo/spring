<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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