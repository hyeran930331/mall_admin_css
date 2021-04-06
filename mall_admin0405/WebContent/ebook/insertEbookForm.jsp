<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import="gdu.mall.dao.*" %>
<%@ page import="gdu.mall.util.*" %>

<%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이북인설트폼</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<%
	System.out.println("\n----------insert Ebookt Form.jsp 실행----------");
	%>
	<!-- 3. 출력 -->
	<h1>ebook Insertform</h1>
	<!-- 상단바 -->
	<div>
		<jsp:include page="/inc/adminMenu.jsp"></jsp:include>
	</div>
	<br>
	
	<form action="<%=request.getContextPath()%>/ebook/insertEbookAction.jsp">
		<table border ="1">
			<tr>
				<th> <!-- 0 -->
					categoryName
				</th>
				<td>
				<!-- 카테고리 눌렀을 때, 카테고리별로 리스트를 나오게 함 (네비게이션) -->
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
			
			<tr> <!-- 1 -->
				<th>
					ebookISBN
				</th>
				<td>
					<input type="text" name="ebookISBN">
				</td>
			</tr>
			
			<tr> <!-- 2 -->
				<th>
					ebookTitle
				</th>
				<td>
					<input type="text" name="ebookTitle">
				</td>
			</tr>
			
			<tr> <!-- 3 -->
				<th>
					ebookAuthor
				</th>
				<td>
					<input type="text" name="ebookAuthor">
				</td>
			</tr>
			
			<tr> <!-- 4 -->
				<th>
					ebookPrice
				</th>
				<td>
					<input type="text" name="ebookPrice">
				</td>
			</tr>
			
			<tr> <!-- 5 -->
				<th>
					ebookCompany
				</th>
				<td>
					<input type="text" name="ebookCompany">
				</td>
			</tr>
			
			<tr> <!-- 6 -->
				<th>
					ebookPageCount
				</th>
				<td>
					<input type="text" name="ebookPageCount">
				</td>
			</tr>
			
			<tr> <!-- 7 -->
				<th>
					ebookSummary
				</th>
				<td>
					<textarea rows="5" cols="80" name="ebookSummary"> </textarea>
				</td>
			</tr>
			
			<!-- 이미지, 스테이트, 데이트, 번호는 자동생성  -->
		</table>
	<button type="submit">이북추가</button>
	</form>
</body>
</html>