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
	System.out.println("\n----------clientList.jsp 실행----------");

	// 세션 검사 관리자 권한 1 이상만 볼 수 있도록.
	Manager m = (Manager)session.getAttribute("sessionManager");
	if(m == null || m.getManagerLevel() < 1){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 리스트</title>
</head>
<body>
	
	<h1>client List</h1>
	<!-- 상단바 -->
	<div>
		<jsp:include page="/inc/adminMenu.jsp"></jsp:include>
	</div>
	<br>	
	<%
	/*
	0. 전처리
	*/
		// 현재페이지
		int currentPage = 1;
		if (request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("-----커렌트 페이지 : "+currentPage);
		}
		
		// 페이지당 수
		int rowPerPage = 10;
		if (request.getParameter("rowPerPage") != null){
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
			System.out.println("-----로우퍼 페이지 : "+rowPerPage);
		}
		
		//시작
		int beginRow = (currentPage -1) *rowPerPage ;
		
	
		String searchWord ="";
		ArrayList<Client> list = ClientDao.selectClientListByPage(beginRow,rowPerPage,searchWord);
	%>
	
	<%
	/*
	3. 출력
	*/
	%>
		<!-- 상단 몇개씩보기 -->
		<form action="<%=request.getContextPath()%>/client/clientList.jsp" method="post">
			<input type="hidden" name="searchWord" value="<%=searchWord%>">
			<select name="rowPerPage">
				<%
				for (int i=10; i <=30; i+=5){
					if(rowPerPage == i){
				%>
						<option value="<%=i %>" selected="selected"> <%=i %></option>
				<%
					} else {
				%>
						<option value="<%=i %>"> <%=i %></option>
				<%
					}
				}
				%>
			</select>
			<button type="submit">보기</button>
		</form>
		
		<!-- 고객표 -->
		<table border="1">
			<tr>
			<thead>
				<th>clientMail</th>
				<th>clientDate</th>
				<th>수정</th>
				<th>삭제</th>
			</thead>
			</tr>
				
			<%
			for(Client c: list){ //c 리스트가 있다면, 없을때까지
				System.out.println ("list : "+list);
			%>
				<tr>
				<tbody>
					<td> <%=c.getClientMail()%></td>
					<td> <%=c.getClientDate()%> </td>
					<td>
						
						<a href="<%=request.getContextPath()%>/client/updateClientForm.jsp?clientMail=<%=c.getClientMail()%>&rowPerPage=<%=rowPerPage%>&searchWord=<%=searchWord%>"  method="post">
						<button>
							수정
						</button>	
						</a>
						
					</td>
					<td>
						<button>
						<a href="<%=request.getContextPath()%>/client/deleteClientActon.jsp?clientMail=<%=c.getClientMail()%>&rowPerPage=<%=rowPerPage%>&searchWord=<%=searchWord%>" method="post">
						<!-- ?clientMail=< % = c . getClientMail() % > 를  method="post" 해야 넘어간다. -->
							삭제
						</a>
						</button>
					</td>
				</tr>
				</tbody>
			<%
			}//FOR
			%>
		</table>
		
		<!-- 페이징 -->
		<%
			if(currentPage > 1){//현재 페이지가 1보다 크면 이전이 나오게 해라.
		%>
			<a href="<%=request.getContextPath()%>/client/clientList.jsp?currentPage=<%=currentPage-1%>&rowPerPage=<%=rowPerPage%>&searchWord=<%=searchWord%>">
				이전
			</a>
		<%      
			}//이전 if 끝
		%>
		      
		      
		<%
			int totalRow = ClientDao.totalCount(searchWord); //메서드활용
			int lastPage = totalRow/rowPerPage;
			System.out.println("\t total Row : "+ totalRow);
			System.out.println("\t last Page : "+ lastPage);
		        
		    
			if (totalRow% rowPerPage !=0){ //현재 페이지가 전체게시글/페이지행 몫이 딱 떨어지거나. 몫보다 클때.
				lastPage += 1;  // 잘안씀 lastPage - lastPage+1; lastPage++
			}//보드 케이블의 총 행수 구하는 if 끝
		         
			if(currentPage<lastPage) {//현재 페이지가 라스트 페이지보다 작으면 다음이 나오게 해라.
		%>
			<a href="<%=request.getContextPath()%>/client/clientList.jsp?currentPage=<%=currentPage+1%>&rowPerPage=<%=rowPerPage%>&searchWord=<%=searchWord%>">
				다음
			</a>
		<% 
			}//다음 if끝
		%>
		
		<!-- 검색기능 -->
		<form action="<%=request.getContextPath()%>/client/clientList.jsp" method="post">
			<input type="hidden" name="rowPerPage" value="<%=rowPerPage%>">
			clientMail : <input type="text" name="searchWord" >
			<button type="submit"> 
			검색
			</button>
		</form>
	
</body>
</html>