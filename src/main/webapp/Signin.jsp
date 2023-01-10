<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.memberDTO"%>
<%@page import="board.memberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

memberDAO ma = new memberDAO();
memberDTO mt = new memberDTO();

mt.setId(request.getParameter("id"));
mt.setPassword(request.getParameter("psw"));
mt.setEmail("email");

ma.writeMember(mt);  // 회원가입

RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");  // 로그인 화면으로 가기
dispatcher.forward(request, response);

%>	
</body>
</html>