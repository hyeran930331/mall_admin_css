<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="gdu.mall.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매니저 인설트 액션</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>

	<%
	System.out.println("-------------insert Manager Action.jsp 실행 -------------");
	// 1.수집
	String managerId = request.getParameter("managerId");
	String managerPw = request.getParameter("managerPw");
	String managerName = request.getParameter("managerName");

	System.out.printf("ID: %s, pw: %s, name: %s\n",managerId, managerPw, managerName);
	
	// 2-1. 중복된 아이디가 있다면, null이 아니면 사용불가.
	String returnManagerId = ManagerDao.selectManagerId(managerId);
	
	if(returnManagerId != null) { //리턴값이 null이 아니라면, 사용중인아이디
		System.out.println(managerId+"사용중인 아이디 입니다");
		response.sendRedirect(request.getContextPath()+"/manager/insertManagerForm.jsp");
		return; // 더이상 코드를 진행안하고 끝낸다.
	} else {
		// 2-2. 중복된 아이디가 없다면,
		System.out.println(managerId+"사용 가능한 아이디 입니다");
		ManagerDao.insertManager(managerId, managerPw, managerName);
	}
	%>
	<!-- 3. 출력 -->
	<div>
		매니저 등록 성공, 승인 후 사용 가능합니다.
		<a href="<%=request.getContextPath()%>/adminIndex.jsp">운영자 홈</a>
	</div>
</body>
</html>