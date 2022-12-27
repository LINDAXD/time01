<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="eva.EvaDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="eva" class="eva.Eva" scope="page" />
<jsp:setProperty name="eva" property="evaTitle" />
<jsp:setProperty name="eva" property="evaSubject" />
<jsp:setProperty name="eva" property="evaTeacher" />
<jsp:setProperty name="eva" property="evaContent" />
<jsp:setProperty name="eva" property="evaScore" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			if(eva.getEvaTitle() == null || eva.getEvaSubject() == null ||eva.getEvaTeacher() == null ||eva.getEvaContent() == null || eva.getEvaScore() == 0 ) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력되지 않은 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				EvaDAO evaDAO = new EvaDAO();
				int result = evaDAO.write(eva.getEvaTitle(), eva.getEvaSubject(), eva.getEvaTeacher(), eva.getEvaContent(), eva.getEvaScore());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else { // 글쓰기 성공
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'eva.jsp'");
					script.println("</script>");
				}
			}
		}
		
	%>
</body>
</html>