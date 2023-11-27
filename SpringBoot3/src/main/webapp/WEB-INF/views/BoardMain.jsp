<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div id="board">
		<table id="list">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>시간</td>
				<td>삭제</td>
			</tr>
			<!-- request 영역에 객체바인딩을 했기 때문에 EL표현언어 사용해서 출력 가능
			반복해서 보여주기 위해 jstl 사용해서 출력 -->
			<c:forEach items="${board_list}" var="board" varStatus="status" >
				<tr>
					<td>${status.count}</td>
					<td><a href="boardDetail.do?num=${board.num}">${board.title}</a></td>
					<td>${board.writer}</td>
					<td>${board.b_date}</td>
					<%-- <td><a href="boardDelete.do?num=${board.num}">삭제</a></td> --%>
					<!-- 받을 때 변수명을 결정하기 위해 ? -> / 로 변경 -->
					<td><a href="boardDelete.do/${board.num}">삭제</a></td>
					<td><button type="button" onClick="deleteBoard(${board.num})">Ajax로
							삭제</button></td>
				</tr>
			</c:forEach>
		</table>

		<a href="Main.jsp"><button id="writer">홈으로가기</button></a> <a
			href="boardWrite.do"><button id="writer">작성하러가기</button></a>
	</div>


	<!-- Scripts -->
	<script type="text/javascript">
		function deleteBoard(num) {
			// 1. form태그에 작성된 값들을 가져오기 -> serialize()
			$.ajax({
				url : "boardDeleteAsync.do",
				data : {num : num}
				type : "post",
				success : function(res){
					alert(res);
					location.reload();
				},
				error : function(){
					console.log("통신 실패")
				}
			})
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