<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board List</title>
</head>
<body>

<!-- 글 목록 테이블 -->
<div class="container">
<h2> FREE BOARD</h2>
	<table class="table table-hover">
		<tr>
			<th>#</th> <!-- 글번호 -->
			<th>Title</th>
			<th>Writer</th>
			<th>Date</th>
			<th>Hit</th>
		</tr>
	<c:forEach var="li" items="${list}">
		<tr onclick="location.href='/board/${li.idx}'">
			<td>${li.idx}</td>
			<td>${li.title}</td>
			<td>${li.writer}</td>
			<td>${li.regDate}</td>
			<td>${li.hit}</td>
		</tr>
	</c:forEach>
	</table>
		<input type="button" class="btn btn-dark float-right" onclick="location.href='/board/post'" value="Write"/>
</div>
<%@ include file="bootstrap.jsp" %>
</body>
</html>