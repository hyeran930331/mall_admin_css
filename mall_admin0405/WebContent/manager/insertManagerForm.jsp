<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.Manager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>managerInsertForm</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>

	<%
	System.out.println("-------------insert Manager Form.jsp 실행 -------------");
	//<!-- 1. -->
	Manager manager = (Manager)(session.getAttribute("sessionManager")); //캐스팅 연산자, 강제 형변환
	%>
	
	<!--// 3. -->
	<h1>메니저 가입희망</h1>
	<!-- 관리자 메뉴 include -->
	<div>
		<jsp:include page="/inc/adminMenu.jsp"></jsp:include>
	</div>
	<form action="<%=request.getContextPath()%>/manager/insertManagerAction.jsp" method="post">
		<table border="1">
			<tr>
				<td>manager_id</td>
				<td><input type="text" name="managerId"></td>
			</tr>
			<tr>
				<td>manager_pw</td>
				<td><input type="password" name="managerPw"></td>
			</tr>
			<tr>
				<td>manager_name</td>
				<td><input type="text" name="managerName"></td>
			</tr>
		</table>
		<button type="submit" onClick="location.href='<%=request.getContextPath()%>+/managerIndex.jsp'">등록신청</button>
	</form>
</body>
</html>