<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.boardDTO"%>
<%@page import="board.boardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<%
String num = request.getParameter("num"); 
//String num = multipartRequest.getParameter("num"); 
String id = (String) session.getAttribute("id");
session.setAttribute("number", num);       // num을 세션에 저장. 세션 저장 시 String 형 -> 저장할 때와 받을 때 자료형이 같아야 함.

boardDAO ba = new boardDAO();
boardDTO bt = ba.read(Integer.parseInt(num));

String writer = bt.getId();

System.out.println(num + ", id => " + writer);
String filename = bt.getFilename();

%>
<form action="Update.jsp" method="post" encType = "multipart/form-data">
	<table >
		<tr><td>제목</td><td><input type="text" name="title" size="100" value="<%=bt.getTitle() %>"></td></tr>
		<tr><td colspan="2">내용 | <a href='FileDown.jsp?filename=<%=filename %>'>사진 받기</a> </td></tr>
		<tr><td colspan="2"><img src="./upload/<%=filename %>" style="max-width:600px;"><br></td></tr>
		<tr><td colspan="2"><textarea name="content" rows="4" cols="70"><%=bt.getContent() %></textarea></td></tr>
	</table>
<%
if ( id.equals(writer))    // 자신이 쓴 글만 수정/삭제 가능
{
%>
	<input type=hidden value="<%=filename %>" name="filename">
	<input type="submit" value="수정">
	<input type="button" value="삭제" onclick="location.href='Delete.jsp'">
	<input type="button" value="글 목록" onclick="location.href='List.jsp'">
</form>
 
<%
} else {
%>

<input type="button" value="글 목록" onclick="location.href='List.jsp'">

<%} %>
</body>
</html>