<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 결과</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String age = request.getParameter("age");
String q1 = request.getParameter("q1");
String q2 = request.getParameter("q2");

File survey = new File("/survey.txt");
PrintWriter writer = null;

try {
	String filePath = application.getRealPath("/" + survey);
	FileWriter fw = new FileWriter(filePath, true);
	writer = new PrintWriter(fw);
	writer.printf("%s, %s, %s, %s, %s\n", name, gender, age, q1, q2);
} catch (IOException ioe) {
} finally {
	try{ writer.close();} 
	catch (Exception e) {}
}
%>

<script>location.href="SurveyResult.jsp"</script>
</body>
</html>