<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.boardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
//int num = Integer.parseInt(request.getParameter("num"));
String id = (String) session.getAttribute("id");


String strNum = (String) session.getAttribute("number");
int num = Integer.parseInt(strNum);

System.out.println(id);
boardDAO ba = new boardDAO();
%>

<script>
if(confirm("정말 삭제하시겠습니까?"))
{
	<% ba.delete(num); %>
	alert("삭제 완료!");
	location.href="List.jsp";
} else 
{
	history.back();
}

</script>
</body>
</html>