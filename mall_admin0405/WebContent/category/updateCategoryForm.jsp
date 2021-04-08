<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*"%>
<%@page import="gdu.mall.dao.*"%>
	<%
	//세션 검사 관리자 권한 1 이상만 볼 수 있도록.
	Manager m = (Manager)session.getAttribute("sessionManager");
	if(m == null || m.getManagerLevel() < 1){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}	
	%>
	
	<%
	request.setCharacterEncoding("utf-8");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<a href="<%=request.getContextPath()%>/category/categoryList.jsp">카테고리 목록</a>
	</div>
	<h1>카테고리 등록</h1>
	
	<form action="<%=request.getContextPath()%>/category/insertCategoryAction.jsp" method="post">
		<table border="1">
			<tr>
				<td>categoryName</td>
				<td><input type="text" name="categoryName"></td>
			</tr>
			<tr>
				<td>categoryWeight</td>
				<td><input type="text" name="categoryWeight" readonly="readonly" value="0"></td><!-- 초기값 0 이후 수정해서 사용 -->
			</tr>
		</table>
		<button type="submit">카테고리 등록</button>
	</form>
</body>
</html>