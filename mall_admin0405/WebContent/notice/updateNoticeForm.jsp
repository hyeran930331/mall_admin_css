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
<title>updateNoticeOneForm</title>
</head>
<body>
	<!-- 관리자화면 메뉴(네비게이션) include -->
	<div>
		<jsp:include page="/inc/adminMenu.jsp"></jsp:include>
	</div>
	<%
	//인코딩
	request.setCharacterEncoding("UTF-8");
	%>
	
	<%
	//수집
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	System.out.printf("noticeNo: %s<updateNoticeOneForm.jsp>\n",noticeNo);
	//dao연결
	Notice n= NoticeDao.selectNoticeOne(noticeNo);
	%>
	
	<h1>updateNoticeOneForm</h1>
	<form action="<%=request.getContextPath()%>/notice/updateNoticeOneAction.jsp" method="post">
	<input type="hidden" name="noticeNo" value="<%=n.getNoticeNo()%>">
		<table border="1">
			<tr>
				<th>managerId</th>
				<td><%=n.getManagerId()%></td>
			</tr>
			<tr>
				<th>noticeDate</th>
				<td><%=n.getNoticeDate()%></td>
			</tr>
			<tr>
				<th>noticeTitle</th>
				<td><input type="text" name="noticeTitle" value="<%=n.getNoticeTitle()%>"></td>
			</tr>
			<tr>
				<th>noticeContent</th>
				<td><textarea rows="5" cols="80" name="noticeContent"><%=n.getNoticeContent()%></textarea></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>