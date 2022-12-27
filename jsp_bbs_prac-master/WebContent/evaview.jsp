<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="eva.Eva" %>
<%@ page import="eva.EvaDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
<title>Insert title here</title>
</head>
<body>

	<%
	
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int evaID = 0;
		// url에 evaID가 넘어온다면 evaID 변수에 정보 저장
		if(request.getParameter("evaID") != null){
			evaID = Integer.parseInt(request.getParameter("evaID"));
		}
		if (evaID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'eva.jsp'");
			script.println("</script>");
		}
		Eva eva = new EvaDAO().geteva(evaID);
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>	
			</button>
			<a href="main.jsp" class="navbar-brand">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
				<li><a href="eva.jsp">수강평</a></li>
				<li><a href="Enrolment.jsp">수강신청</a></li>
			</ul>
			<%
				if(userID == null){
			%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>					
			<%
				} else {
			%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="mypage.jsp">내정보</a></li>
							<li><a href="Withdrawal.jsp">회원탈퇴</a></li>
							<li><a href="logoutAction.jsp">로그아웃</a></li>
						</ul>
					</li>
				</ul>	
			<% 
				}
			%>
		</div>
	</nav>

	<!-- 게시판 시작 -->

	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="4" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th style="width: 20%;">글 제목</th>
						<td colspan="3"><%= eva.getEvaTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&tr;") %></td>
					</tr>
					<tr>
						<th>수강과목명</th>
						<td style="min-height: 200px; text-align: left;"><%= eva.getEvaSubject().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&tr;").replaceAll("\n", "<br>") %></td>
						<th>강사명</th>
						<td style="min-height: 200px; text-align: left;"><%= eva.getEvaTeacher().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&tr;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3" style="min-height: 200px; text-align: left;"><%= eva.getEvaContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&tr;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<th>평가점수</th>
						<td colspan="3" style="min-height: 200px; text-align: left;"><%= eva.getEvaScore()%></td>
					</tr>
					<tr>
						<th>작성일자</th>
						<td colspan="3" ><%= eva.getEvaDate().substring(0, 11) + eva.getEvaDate().substring(11, 13) + "시" + eva.getEvaDate().substring(14, 16) + "분" %></td>
					</tr>
				</tbody>
			</table>
			<a href="eva.jsp" class="btn btn-primary">목록</a>
			<%
			if(userID != null && userID.equals(eva.getUserID())){
			%>
					<a href="update.jsp?evaID=<%=evaID%>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?evaID=<%=evaID%>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
			<a href="evawrite.jsp"><input type="submit" class="btn btn-primary pull-right" value="글쓰기" /></a>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>