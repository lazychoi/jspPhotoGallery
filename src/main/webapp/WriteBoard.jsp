<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.boardDTO"%>
<%@ page import="board.boardDAO"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = (String) session.getAttribute("id");

boardDAO ba = new boardDAO();
boardDTO bt = new boardDTO();

int lastNum = ba.getLastNum();     // DB의 마지막 번호 가져오기

String updir = application.getRealPath("/upload/"); // /upload/ 폴더 안에 글번호 별로 폴더를 만들어 파일 저장
//String updir = "/Users/jun/upload/"+ (lastNum+1) + "/";
File targetDir = new File(updir);
if(!targetDir.exists()) { targetDir.mkdirs(); }
int maxSize = 1024 * 1024 * 500;
String encoding = "utf-8";

MultipartRequest multipartRequest = new MultipartRequest(request, updir, maxSize, encoding, new DefaultFileRenamePolicy());

Enumeration<?> files = multipartRequest.getFileNames();
String element = "";
String fileSystemName = "";
String originalFilename = "";
if(files.hasMoreElements())
{
	element = (String) files.nextElement();
	originalFilename = multipartRequest.getOriginalFileName(element);
	fileSystemName = multipartRequest.getFilesystemName(element);
}


//String fileRealname = (lastNum+1) + "++" + multipartRequest.getFilesystemName("file");
//String filename = (lastNum+1) + "++" + multipartRequest.getOriginalFileName("file");
 

System.out.println("originalFilename => " + originalFilename);
System.out.println("fileSystemName => " + fileSystemName);

bt.setTitle(multipartRequest.getParameter("title"));       //form에서 encType="multipart/form-data" 설정하면 request.getParameter("title")로 읽을 수 없 
bt.setContent(multipartRequest.getParameter("content"));
bt.setId(id);
bt.setFilename(fileSystemName);

ba.write(bt);

RequestDispatcher dispatcher = request.getRequestDispatcher("List.jsp"); 
dispatcher.forward(request, response);

%>	

</body>
</html>