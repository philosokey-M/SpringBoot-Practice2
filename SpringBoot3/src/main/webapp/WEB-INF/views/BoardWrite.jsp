<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assetsBoard/css/main.css" />
<link rel="stylesheet" href="assetsBoard/css/board.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
	<!-- Q16. 게시글 작성 기능(작성된 게시글은 DB에 저장) - 파일업로드 cos.jar 사용 -->
	<div id="board">
		<form class="form-data" action="boardInsert.do" method="post" enctype="multipart/form-data">
			<table id="list">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer"></td>
				</tr>
				<tr>
					<td colspan="2">내용</td>
				</tr>
				<tr>
					<td colspan="2">
						<input  name="file" type="file" style="float: right;">
						<textarea name="content" rows="10" style="resize: none;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="reset" value="초기화"> <input
						type="submit" value="작성하기"></td>
		<button type="button" onClick="formSubmit()">Ajax로 작성하기</button>
				</tr>
			</table>
		</form>
	</div>
	<!-- Scripts -->
	<script type="text/javascript">
		function formSubmit() {
			// 1. form태그에 작성된 값들을 가져오기 -> serialize()
			let form = $('.form-data').serialize();
			console.log('form : ', form);
			
			$.ajax({
				url : "boardInsertAsync.do",	// 요청 경로
				data : form,	// 요청 데이터
				type : "post",	// 요청 방식
				success : function(res){	// 성공
					alert(res);
					location.href = "boardList.do";
				},
				error : function(){		// 실패
					console.log("ajax insert 실패")
				}
			});
		}
	</script>
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="resources/assets/js/jquery.scrollex.min.js"></script>
	<script src="resources/assets/js/skel.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="resources/assets/js/main.js"></script>
</body>
</html>