<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import = "java.io.*" %>

<%
	BufferedReader reader = null;
	String line = "";
	Boolean notFound = true;
	int q11 = 0, q12=0, q13 = 0, q14=0, q15=0;
	int q21 = 0, q22=0, q23 = 0, q24=0, q25=0;
	try{
		reader = new BufferedReader(new FileReader("/Users/jun/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/JspWebsite/survey.txt"));
		while(true)
		{
			line = reader.readLine();
			if(line == null)
				break;
			
			String[] str = line.split(",");
			
			if(str[3].trim().equals("q11")){
				q11 += 1;
			} else if(str[3].trim().equals("q12")){
				q12 += 1;
			} else if(str[3].trim().equals("q13")){
				q13 += 1;
			} else if(str[3].trim().equals("q14")){
				q14 += 1;
			} else if(str[3].trim().equals("q15")){
				q15 += 1;
			}
			
			if(str[4].trim().equals("q21")){
				q21 += 1;
			} else if(str[4].trim().equals("q22")){
				q22 += 1;
			} else if(str[4].trim().equals("q23")){
				q23 += 1;
			} else if(str[4].trim().equals("q24")){
				q24 += 1;
			} else if(str[4].trim().equals("q25")){
				q25 += 1;
			}
		}
	} catch(FileNotFoundException fnfe){
		System.out.println("File not found");
	} catch(IOException ioe){
		System.out.println("Cannot Read File.");
	} finally {
		try { reader.close(); }
		catch(Exception e){}
	}
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 결과</title>
</head>
<body>
<div class="container"><div style="margin: 100px 0 0 300px;">
<h1>설문 결과</h1>

<p>Q1. 이 사이트가 얼마나 마음에 드나요?</p>
<ul>
<li>전혀 마음에 안 든다: <%= q11 %></li>
<li>조금 마음에 안 든다: <%= q12 %></li>
<li>보통이다: <%= q13 %></li>
<li>조금 마음에 든다: <%= q14 %></li>
<li>아주 마음에 든다: <%= q15 %></li>
</ul>

<p>Q2. 가장 마음에 드는 기능은 무엇인가요?</p>
<ul>
<li>회원가입: <%= q21 %></li>
<li>사진갤러리: <%= q22 %></li>
<li>글쓰기: <%= q23 %></li>
<li>글 수정하기: <%= q24 %></li>
<li>글 삭제하기: <%= q25 %></li>
</ul>

<p><a href="index.html">첫 화면으로 돌아가기</a>
</div></div>
</body>
</html>