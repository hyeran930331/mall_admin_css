<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="gdu.mall.util.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Mail.Book &mdash; Website Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/icomoon/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datepicker.css">
    
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/flaticon/font/flaticon.css">
  
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/aos.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.fancybox.min.css">
    

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<%
	request.setCharacterEncoding("utf-8");
	%>

	<%
		String ebookISBN = request.getParameter("ebookISBN");
	%>
	<h1>updateEbookImgForm</h1>
	<form enctype="multipart/form-data" action="<%=request.getContextPath()%>/ebook/updateEbookImgAction.jsp?ebookISBN=<%=ebookISBN%>" method="post">
	<!-- application/x-www-form-urlencoded 글자만 -->
	<!-- 파일타입 multipart/form-data -->
		<input type="hidden" name="ebookISBN" value="<%=ebookISBN%>">
		<input type="file" name="ebookImg">
		<button type="submit">이미지 수정</button>
	</form>
</body>
</html>