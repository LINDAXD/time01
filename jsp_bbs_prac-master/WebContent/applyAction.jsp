<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Enrolment.EnrolmentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="enrolment" class="Enrolment.Enrolment" scope="page" />
<jsp:setProperty name="enrolment" property="gradeName" />
<jsp:setProperty name="enrolment" property="stuList" />
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
			if(enrolment.getGradeName() == null || enrolment.getStuList() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력되지 않은 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				EnrolmentDAO Enrolment = new EnrolmentDAO();
				int result = Enrolment.write(enrolment.getGradeName(),userID, enrolment.getStuList());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else { // 글쓰기 성공
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'Enrolment.jsp'");
					script.println("</script>");
				}
			}
		}
		
	%>
</body>
</html>