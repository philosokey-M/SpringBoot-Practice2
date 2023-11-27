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


	<!-- Q19. 게시글 세부내용 조회 기능 -->
	<div id="board">
		<table id="list">
			<tr>
				<td>제목</td>
				<td>${board.title}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${board.writer}</td>
			</tr>
			<tr></tr>
			<tr>
				<td>내용</td>
				<td colspan="2">${board.filename}</td>
				<td colspan="2">${board.content}</td>
			</tr>
			<tr>
				<td colspan="2"><img alt="img" src="img/${board.filename}"></td>
			</tr>
			
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2"><a href="BoardMain.jsp"><button>뒤로가기</button></a></td>
			</tr>
		</table>
	</div>
	<!-- Scripts -->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="resources/assets/js/jquery.scrollex.min.js"></script>
	<script src="resources/assets/js/skel.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="resources/assets/js/main.js"></script>
</body>
</html>