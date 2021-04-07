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
	//레벨 2 미만 보안코드
	Manager m = (Manager)session.getAttribute("sessionManager");
	if(m == null || m.getManagerLevel() < 2){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	%>

	<!-- 게시판모양 (넘버 타이틀 게시자 날짜), 페이징 넣기, noticeOne, 공지추가 기능, 페이지당 행의 수 바꾸기 -->
	<!-- 관리자화면 메뉴(네비게이션) include -->
	<div>
		<jsp:include page="/inc/adminMenu.jsp"></jsp:include>
	</div>
	
	<h1>noticeList</h1>
	
	<a href ="<%=request.getContextPath()%>/notice/insertNoticeForm.jsp"><button>공지추가</button></a>
	
	<%
	//페이징
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		System.out.printf("currentPage: %s<noticeList.jsp>\n",currentPage);
	}
		
	//페이지당 행의 수
	int rowPerPage = 10;
	if(request.getParameter("rowPerPage") != null){
		rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		System.out.printf("rowPerPage: %s<noticeList.jsp>\n",rowPerPage);
	}
			
	//시작 행
	int beginRow = (currentPage - 1) * rowPerPage;
		
	//Dao에서 게시글 호출 , noticeList
	ArrayList<Notice> list = NoticeDao.selectNoticeList(beginRow, rowPerPage);
	%>
	
	<!-- rowPerPage 변경기능 -->
	<form action ="<%=request.getContextPath()%>/notice/noticeList.jsp" method="post">
		<select name="rowPerPage">
		<%
		for(int i=10; i<31; i+=5){
			if(rowPerPage == i){
		%>
			<option value="<%=i %>" selected="selected"><%=i %></option>
		<%
			} else {
		%>
			<option value="<%=i%>"><%=i%></option>
		<%
			}//IF끝
		}//FOR끝
		%>
		</select>
	<button type="submit">변경</button>
	</form>
	
	<!-- 게시판 시작 -->
	<table border="1">
		<thead>
			<tr>
				<th>noticeNo</th>
				<th>noticeTitle</th>
				<th>managerId</th>
				<th>noticeDate</th>
			</tr>
		</thead>
		<tbody>
			<%
			for(Notice n : list){
			%>
			<tr>
				<td><%=n.getNoticeNo()%></td>
				<td><a href="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
				<td><%=n.getManagerId()%></td>
				<td><%=n.getNoticeDate()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<!-- 페이징 -->
	<!-- 이전버튼 -->
	<%
	if(currentPage > 1){ //현재페이지가 1일때 if
	%>
		<a href = "<%=request.getContextPath()%>/notice/noticeList.jsp?currentPage=<%=currentPage-1%>&rowPerPage=<%=rowPerPage%>">이전</a>
	<%
	}//if 끝
	%>
	
	<% 
	int totalRow = NoticeDao.totalCount();
	int lastPage = totalRow/rowPerPage ;
		
	if(totalRow  %rowPerPage != 0){//전체페이지가 나누어 떨어지지 않으면if
		lastPage += 1;
	}//if끝
			
	//다음버튼 만들기
	if(currentPage < lastPage){//현재페이지가 마지막 페이지보다 작으면
	%>
		<!-- 다음버튼 -->
		<a href = "<%=request.getContextPath()%>/notice/noticeList.jsp?currentPage=<%=currentPage+1%>&rowPerPage=<%=rowPerPage%>">다음</a>
	<%		
	} //if끝
	%>

</body>
</html>