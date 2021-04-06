<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import="gdu.mall.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 업데이트 폼</title>
</head>
<body>
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