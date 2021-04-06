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
<title>noticeOne</title>
</head>
<body>
<!-- 관리자화면 메뉴(네비게이션) include -->
	<div>
		<jsp:include page="/inc/adminMenu.jsp"></jsp:include>
	</div>
	<%
		//수집
		int noticeNo= Integer.parseInt(request.getParameter("noticeNo"));
		System.out.printf("noticeNo: %s<noticeOne>\n",noticeNo);
		//dao연결
		Notice n= NoticeDao.selectNoticeOne(noticeNo);
		
	%>
	<h1>noticeOne</h1>
	<table border="1">
		<tr>
			<th>noticeTitle</th>
			<td><%=n.getNoticeTitle()%></td>
		</tr>
		<tr>
			<th>managerId</th>
			<td><%=n.getManagerId()%></td>
		</tr>
		<tr>
			<th>noticeContent</th>
			<td><%=n.getNoticeContent()%></td>
		</tr>
		<tr>
			<th>noticeDate</th>
			<td><%=n.getNoticeDate()%></td>
		</tr>
	</table>
	<a href="<%=request.getContextPath()%>/notice/updateNoticeForm.jsp?noticeNo=<%=n.getNoticeNo()%>"><button>공지수정</button></a>
	<a href="<%=request.getContextPath()%>/notice/deleteNoticeAction.jsp?noticeNo=<%=n.getNoticeNo()%>"><button>공지삭제</button></a>
	<br>
	<br>
	<!-- 댓글 리스트-->
	<%
		System.out.println("\t"+noticeNo+"<---notice No");
	
		//Notice notice= NoticeDao.selectNoticeOne(noticeNo);
		//public static ArrayList<Comment> selectCommentListByNoticeNo(int noticeNo){
		ArrayList<Comment> commentList = CommentDao.selectCommentListByNoticeNo(noticeNo);
	%>
			<table border="1">
				<tr>
					<th>번호</th>
					<th>댓글</th>
					<th>날짜</th>
					<th>관리자</th>
					<th></th>
				</tr>
	<%
		for (Comment c : commentList) {//commentList가 있으면
	%>
				<tr>
					<td><%=c.getCommentNo()%></td>
					<td><%=c.getCommentContent()%></td>
					<td><%=c.getCommentDate()%></td>
					<td><%=c.getManagerId()%></td>
					<td>
						<a href="<%=request.getContextPath()%>/notice/deleteCommentAction.jsp?commentNo=<%=c.getCommentNo()%>&noticeNo=<%=noticeNo%>">
						<button><%=c.getCommentNo()%>번 댓글삭제</button>
						</a>
				</tr>
	<%
		}//for 끝
	%>
			</table>
	

	<!-- 댓글 달기 -->
	<form action="<%=request.getContextPath()%>/notice/insertCommentAction.jsp" method="post">
		<!-- 현재 공지글 넘버 넘기기 -->
		<input type="hidden" name="noticeNo" value="<%=noticeNo%>">
		<div>
			<!--  세션값 사용 -->
			managerID : <input type="text" name="managerId" value="<%=m.getManagerId()%>" readOnly="readonly">
		</div>
		<textarea rows="2" cols="30" name="commentContent"></textarea>
		<button type="submit">댓글입력 </button>
 	</form>
</body>
</html>