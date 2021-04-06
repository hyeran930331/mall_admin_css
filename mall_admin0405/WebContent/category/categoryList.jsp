<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*"%>
<%@page import="gdu.mall.dao.*"%>
<%@page import="java.util.ArrayList"%>
	<%
	System.out.println("\n----------CategoryList.jsp 실행----------");
	
	// 세션 검사 관리자 권한 1 이상만 볼 수 있도록.
	Manager m = (Manager)session.getAttribute("sessionManager");
	if(m == null || m.getManagerLevel() < 1){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	// 카테고리 리스트 가져오기
	ArrayList<Category> list = CategoryDao.selectCategoryList();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>categoryList</title>
</head>
<body>
	<h1>카테고리 목록</h1>
	<!-- 관리자 화면 메뉴(네비게이션) include -->
	<div>
		<jsp:include page="/inc/adminMenu.jsp"></jsp:include>
	</div>
		
	<br>
		
	<a href="<%=request.getContextPath()%>/category/insertCategoryForm.jsp"><button type="button">카테고리 추가</button></a>
	
	<table border="1">
		<thead>
			<tr>
				<th>categoryName</th>
				<th>categoryWeight</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Category c : list){
			%>
				<tr>
					<td><%=c.getCategoryName()%></td>
					<td>
						<form action="<%=request.getContextPath()%>/category/updateCategoryAction.jsp" method="post">
							<input type="hidden" name="categoryName" value="<%=c.getCategoryName()%>">
							<select name="categoryWeight">
									<%
									for(int i=0; i<3; i++){
										if(c.getCategoryWeight() == i){
										%>
											<option value="<%=i%>" selected="selected"><%=i%></option>
										<%
										} else {
										%>
											<option value="<%=i%>"><%=i%></option>
										<%
										}
									}
									%>
							</select>
								<button>수정</button>
							</form>
						</td>
					<td><a href="<%=request.getContextPath()%>/category/deleteCategoryAction.jsp?categoryName=<%=c.getCategoryName()%>"><button type="button">삭제</button></a></td>
				</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>