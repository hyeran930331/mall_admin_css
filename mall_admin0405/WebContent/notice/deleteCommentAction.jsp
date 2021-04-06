<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "gdu.mall.vo.*" %>
<%@ page import="gdu.mall.dao.*"%>
<%@ page import="java.util.*" %>

	<%
	//레벨 2 미만 보안코드
	Manager m = (Manager)session.getAttribute("sessionManager");
	if(m == null || m.getManagerLevel() < 2){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	%>
	
	<%
	//수집
	int commentNo = Integer.parseInt(request.getParameter("commentNo"));
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	//디버깅
	System.out.printf("commentNo: %s\n noticeNo: %s <deleteCommentAction.jsp>\n",commentNo, noticeNo);
	
	
	
	//dao삭제 메서드 호출
	if(m.getManagerLevel() > 1){ //manager.managerLevel == 2
		CommentDao.deleteComment(commentNo);
	} else if(m.getManagerLevel() > 0) {//manager.managerLevel == 1
		CommentDao.deleteComment(commentNo, m.getManagerId());
	}
	//list 재실행
	//response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
	response.sendRedirect(request.getContextPath()+"/notice/noticeOne.jsp?noticeNo="+noticeNo);
	%>