<%@page import="board.memberDTO"%>
<%@page import="board.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

String id = request.getParameter("id");
String pw = request.getParameter("psw");

Boolean result = ma.checkMember(id, pw);

if (result) {
	//request.setAttribute("id", id);	
	// RequestDispatcher dispatcher = request.getRequestDispatcher("List.jsp");
	//dispatcher.forward(request, response);

	session.setAttribute("id", id);
	System.out.println("로그인 성공");
%>
	<script>location.href = "List.jsp"; </script>
<%	
} else {
%>

<script>
	alert("아이디나 비밀번호를 확인하세요.\n회원이 아니면 회원 가입 하세요\n초기 화면으로 이동합니다");
	location.href="index.html";
</script>

<%
}
%>
</body>
</html>