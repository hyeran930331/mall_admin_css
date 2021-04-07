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
	System.out.println("\n----------updateClientForm.jsp 실행 ---------");
	// 0. 전처리
	Client c = (Client)(session.getAttribute("sessionClient"));
	%>
	
	<!-- 3.출력 -->
	<h1>update Client Form</h1>
	<!-- 관리자 메뉴 include -->
	<div>
		<jsp:include page="/inc/adminMenu.jsp"></jsp:include>
	</div>
	
	<br>
	<form action ="<%=request.getContextPath()%>/client/updateClientAction.jsp" method="post">
		<table>
		<tr>
			<td>Email</td>
			<td><%=c.getClientMail()%></td>
		</tr>
		
		<tr>
			<td>PW</td>
			<td>
				<input type="text" name="clientPw" value="<%=c.getClientPw() %>">
				<button type="submit">수정</button>
			</td>
		</tr>
	</form>
					
		<tr>
			<td><button type="submit">등록</button> </td>
			<td><a href="<%=request.getContextPath()%>/client/clientInsertForm.jsp">홈</a></td>
		</tr>
		</table>
	</form>
</body>
</html>