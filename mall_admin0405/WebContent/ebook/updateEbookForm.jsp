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
	<!-- 보안코드 넣기 -->
	<%
	System.out.println("\n----------update Ebook Form.jsp 실행----------");
	
	// 세션 검사 관리자 권한 1 이상만 볼 수 있도록.
	Manager m = (Manager)session.getAttribute("sessionManager");
	if(m == null || m.getManagerLevel() < 1){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	%>
	
	<%
	request.setCharacterEncoding("utf-8");
	%>

	<!-- 관리자화면 메뉴(네비게이션) include -->
		<div>
			<jsp:include page="/inc/adminMenu.jsp"></jsp:include>
		</div><!-- 인클루드는 프로젝트 명이 필요없다 -->
	<%
	//수집
	String ebookISBN = request.getParameter("ebookISBN");
	System.out.printf("ebookISBN: %s<ebookOne.jsp>\n",ebookISBN);
	
	//dao연결
	Ebook e = EbookDao.selectEbookOne(ebookISBN);
	// 카테고리 리스트 가져오기
	ArrayList<String> Estate = EbookDao.selectEbookStateName();
	%>

	
	<h1>ebook Form</h1>
	<form action="<%=request.getContextPath()%>/ebook/updateEbookAction.jsp?ebookISBN=<%=ebookISBN%>">
	<table border="1">
		<tr>
			<th>ebookNO</th>
			<td>수정 불가 : <%=e.getEbookNo()%>
			</td>
		</tr>
		
		<tr>
			<th>categoryName</th>
			<td>
			<div>	
				<%
				//public static ArrayList<String> categoryNameList() throws Exception{
				ArrayList<String> list3 = CategoryDao.categoryNameList();
				System.out.println(list3.size()+"<---카테고리네임리스트 크기");
				%>
				<select name="categoryName">	
					<%
					for(String ct : list3){
					%>
						<option value="<%=ct%>"><%=ct%></option>
					<%
					}
					%>
					</select>
				</div>		
			</td>
		</tr>
		
		<tr>
			<th>ebookTitle</th>
			<td>
			<input type="text" name="ebookTitle" value="<%=e.getEbookTitle()%>">
			</td>
		</tr>
		
		<tr>
			<th>ebookState</th>
			<td>
			<%=e.getEbookState()%> 
			<select name="ebookState">
				<option value="판매중">판매중</option>
				<option value="품절">품절</option>
				<option value="절판">절판</option>
				<option value="구편절판">구편절판</option>
			</select>
			</td>
		</tr>
		
		<tr>
			<th>ebookAuthor</th>
			<td><input type="text" name="ebookAuthor" value="<%=e.getEbookAuthor()%>"></td>
		</tr>
		
		<tr>
			<th>ebookISBN</th>
			<td>수정불가 : <%=e.getEbookISBN()%>
				<input type="hidden" name="ebookISBN" value="<%=e.getEbookISBN()%>">
			</td>
		</tr>
		<tr>
			<th>ebookCompany</th>
			<td><input type="text" name="ebookCompany" value="<%=e.getEbookCompany()%>"></td>
		</tr>
		<tr>
			<th>ebookDate</th>
			<td>수정불가 <%=e.getEbookDate()%>
			</td>
		</tr>
		<tr>
			<th>ebookSummary</th>
			<td>
				<textarea rows="5" cols="50" name="ebookSummary"><%=e.getEbookSummary()%></textarea>
			</td>
		</tr>
		<tr>
			<th>ebookPrice</th>
			<td><input type="text" name="ebookPrice" value="<%=e.getEbookPrice()%>"></td>
		</tr>
		
		<tr>
			<th>ebookPageCount</th>
			<td><input type="text" name="ebookPageCount" value="<%=e.getEbookPageCount()%>"></td>
		</tr>
	</table>
	
	<button type="submit">수정</button>
	</form>
</body>
</html>