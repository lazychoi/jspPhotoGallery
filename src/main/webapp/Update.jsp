<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.boardDTO"%>
<%@page import="board.boardDAO"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String strNum = (String) session.getAttribute("number");
int num = Integer.parseInt(strNum);
System.out.println("num = " + num);

boardDAO ba = new boardDAO();
boardDTO bt = new boardDTO();

String updir = application.getRealPath("/upload/");

int maxSize = 1024 * 1024 * 500;
String encoding = "utf-8";
MultipartRequest multipartRequest = new MultipartRequest(request, updir, maxSize, encoding, new DefaultFileRenamePolicy()); 


bt.setTitle(multipartRequest.getParameter("title"));
bt.setContent(multipartRequest.getParameter("content"));
bt.setFilename(multipartRequest.getParameter("filename"));
bt.setNum(num);

ba.update(bt);

System.out.println("fileName" + multipartRequest.getParameter("filename"));

RequestDispatcher dispatcher = request.getRequestDispatcher("List.jsp"); 
dispatcher.forward(request, response);

%>	

</body>
</html>