<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = (String) session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class='user'><b><%= id %></b> 님 로그인 됨 <button class="logout" onclick="location.href='Logout.jsp'">로그아웃</button></div>
<div class="container"><div class="box">
<form action="WriteBoard.jsp" method="post" encType = "multipart/form-data">
	<table>
		<tr><td>제목</td><td><input type="text" size="100" name="title"></td></tr>
		<tr><td colspan="2">내용</td></tr>
		<tr><td colspan="2"><textarea name="content"  rows="4" cols="70"></textarea></td></tr>
		<tr><td colspan="2"><input type="file" name="file"></td></tr>
	</table>
	<input type="submit" value="저장">
	<input type=button value="글 목록" onclick="location.href='List.jsp'">
</form>
</div></div>
</body>
</html>