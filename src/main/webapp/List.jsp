<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 갤러리</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%
// String id = (String) request.getAttribute("id");
if (session.getAttribute("id") != null ){
	String id = (String) session.getAttribute("id");
	boardDAO ba = new boardDAO();
%>
	<div class='user' style='display:flex; justify-content: space-between; align-items: center;'><button onclick="location.href='WriteForm.jsp'" style='width: 100px; height:30px; margin-left: 10px;'>글쓰기</button><span><b><%= id %></b> 님 로그인 됨 <button class="logout" onclick="location.href='Logout.jsp'">로그아웃</button></span> </div>

	<div class="gallery" style=" width: 80%; display:flex; flex-wrap: wrap; padding: 0 4px; margin:auto;">
		<% out.print(ba.makeList());  %> 
	</div>
	
<%
} else {
%>
	<script>	
		alert("로그인 상태가 아닙니다.");
		location.href="index.html";
	</script>
<%
}
%>
</body>
</html>