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
  <!-- 전체를 감싸는-->
  <div class="site-wrap">
  
   	<!-- 0메뉴바 div -->
	<!-- 모바일버전. 안채워둠 -->
    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->
    
    <!-- 데스크탑버전. -->
    <div class="site-navbar-wrap">
      <div class="site-navbar site-navbar-target js-sticky-header">
        <div class="container">
          <div class="row align-items-center">
          	<!-- 메뉴바 2개 div -->
           	<!-- 왼쪽 로고 div -->
            <div class="col-6 col-md-4 half">
              <h1 class="my-0 site-logo"><a href="<%=request.getContextPath()%>/adminIndex.jsp">Mail<span class="text-primary">.</span>book</a></h1>
            </div>
         	<!-- 오른쪽 버튼 div -->
            <!-- 관리자화면 메뉴(네비게이션) include -->
	   			<jsp:include page="/inc/adminMenu.jsp"></jsp:include>
          </div>
        </div>
      </div>
    </div> <!-- END .site-navbar-wrap --> 
	
	<!-- 페이지 -->
	  <div class="site-blocks-cover" id="home-section">
	      <div class="container">
	        <div class="row">
	          <div class="col-md-12 ml-auto align-self-center">
	            
	            <div class="intro">
	              <div class="text">
	              	<h1><span class="text-primary">카테고리</span> 목록</h1>
	                <br>
	                <div class="TR">
	                 <a class="btn btn-primary" href="<%=request.getContextPath()%>/category/insertCategoryForm.jsp">카테고리 추가</a>
	          
	                </div>
	                <br>
	              </div> 
	             </div>
	             
				<!-- 글 전체 -->		       
				<div class="d-flex">   
				<!-- 1 테이블 -->  
	<table class="table table-second table-hover TC">
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
		</div> <!-- <div class="site-blocks-cover" id="home-section">-->
	   </div> <!-- <div class="container">-->
	  </div> <!-- <div class="row">-->
	 </div> <!--  <div class="col-md-12 ml-auto align-self-center">-->
	</div>
</body>
</html>