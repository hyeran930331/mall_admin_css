<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트 이북 이미지</title>
</head>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>

	<%
		String ebookISBN = request.getParameter("ebookISBN");
	%>
	<h1>updateEbookImgForm</h1>
	<form enctype="multipart/form-data" action="<%=request.getContextPath()%>/ebook/updateEbookImgAction.jsp?ebookISBN=<%=ebookISBN%>" method="post">
	<!-- application/x-www-form-urlencoded 글자만 -->
	<!-- 파일타입 multipart/form-data -->
		<input type="hidden" name="ebookISBN" value="<%=ebookISBN%>">
		<input type="file" name="ebookImg">
		<button type="submit">이미지 수정</button>
	</form>
</body>
</html>