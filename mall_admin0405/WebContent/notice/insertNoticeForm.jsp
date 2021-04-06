<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import="gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>
	<%
	//레벨 2 미만 보안코드
	Manager m = (Manager)session.getAttribute("sessionManager");
	if(m == null || m.getManagerLevel() < 2){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertNoticeForm</title>
</head>
<body>
	<!-- 관리자화면 메뉴(네비게이션) include -->
	<div>
		<jsp:include page="/inc/adminMenu.jsp"></jsp:include>
	</div>
	
	<h1>insertNoticeForm</h1>
	
	<form action="<%=request.getContextPath()%>/notice/insertNoticeAction.jsp" method="post">
		<input type="hidden" name="managerId" value="<%=m.getManagerId()%>">
		
		<table border="1">	
			<tr>
				<th>noticeTitle</th>
				<td><input type="text" name= "noticeTitle"></td>
			</tr>
			<tr>
				<th>noticeContent</th>
				<td><textarea rows="5" cols="80" name="noticeContent"></textarea></td>
			</tr>
		</table>
		
		<button type="submit">공지 생성</button>
	</form>
</body>
</html>