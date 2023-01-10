<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.boardDTO"%>
<%@page import="board.boardDAO"%>
<%@ page import="java.io.File" %>
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

String updir = application.getRealPath("/upload/"+ num + "-"); // /upload/ 폴더 안에 글번호 별로 폴더를 만들어 파일 저장
// String updir = "/Users/jun/upload/"+ (num+1) + "/";
File targetDir = new File(updir);
if(!targetDir.exists()) { targetDir.mkdirs(); }
int maxSize = 1024 * 1024 * 500;
String encoding = "utf-8";
MultipartRequest multipartRequest = new MultipartRequest(request, updir, maxSize, encoding, new DefaultFileRenamePolicy()); 
String filename = multipartRequest.getOriginalFileName("file");
String fileRealname = multipartRequest.getFilesystemName("file");

bt.setTitle(multipartRequest.getParameter("title"));
bt.setContent(multipartRequest.getParameter("content"));
bt.setNum(num);
bt.setFilename(fileRealname);

ba.update(bt);

RequestDispatcher dispatcher = request.getRequestDispatcher("List.jsp"); 
dispatcher.forward(request, response);

%>	

</body>
</html>