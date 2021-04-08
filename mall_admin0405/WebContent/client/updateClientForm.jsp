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
	
	// 0. 전처리 레벨2 이하 접근제한
	Manager m = (Manager)(session.getAttribute("sessionManager"));
	if(m==null){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	} else if(m.getManagerLevel() < 2){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	%>
	
	<!-- 3.출력 -->
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
	   			<jsp:include page="<%=request.getContextPath()%>/inc/adminMenu.jsp"></jsp:include>
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
	<form action ="<%=request.getContextPath()%>/client/updateClientAction.jsp" method="post">
		<table class="table table-second table-hover TC">
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
		</div> <!-- <div class="site-blocks-cover" id="home-section">-->
	   </div> <!-- <div class="container">-->
	  </div> <!-- <div class="row">-->
	 </div> <!--  <div class="col-md-12 ml-auto align-self-center">-->
	</div>
</body>
</html>