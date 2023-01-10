<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.OutputStream, java.io.FileInputStream, java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 받기</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String filename = request.getParameter("filename");
System.out.println("사진파일 다운 " + filename);

String updir = application.getRealPath("/upload/");
String downloadFile = updir + filename;
File file = new File(downloadFile);
FileInputStream in = new FileInputStream(downloadFile);

filename = new String(filename.getBytes("utf-8"), "8859_1");

response.setContentType("application/octet-stream");
response.setHeader("Content-Disposition", "attachment; filename=" + filename);

out.clear();
out = pageContext.pushBody();

OutputStream os = response.getOutputStream();

int length;
byte[] b = new byte[(int)file.length()];

while ( (length = in.read(b)) > 0) { os.write(b, 0, length); }

os.flush();
os.close();
in.close();

%>
</body>
</html>