<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="eva.EvaDAO" %>
<%@ page import="eva.Eva" %>
<%@ page import="java.util.ArrayList" %>
<%@ page buffer = "100000kb" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
<title>JSP 게시판-수강평</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1; // 기본페이지
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
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
		<a href="evawrite.jsp" class="btn btn-primary pull-right">글쓰기</a>
		
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;">번호</th>
						<th style="background-color: #eeeeee; text-align:center;">제목</th>
						<th style="background-color: #eeeeee; text-align:center;">수강과목명</th>
						<th style="background-color: #eeeeee; text-align:center;">강사명</th>
						<th style="background-color: #eeeeee; text-align:center;">내용</th>
						<th style="background-color: #eeeeee; text-align:center;">평가점수</th>
						<th style="background-color: #eeeeee; text-align:center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						EvaDAO evaDAO = new EvaDAO();
						ArrayList<Eva> list = evaDAO.getList(pageNumber);
						for(int i=0; i<list.size(); i++){
					%>
						<tr>
							<td><%= list.get(i).getEvaID() %></td>
							<td><a href="evaview.jsp?evaID=<%=list.get(i).getEvaID()%>"><%= list.get(i).getEvaTitle() %></a></td>
							<td><%= list.get(i).getEvaSubject() %></td>
							<td><%= list.get(i).getEvaTeacher() %></td>
							<td><%= list.get(i).getEvaContent() %></td>
							<td><%= list.get(i).getEvaScore() %></td>
							<td><%= list.get(i).getEvaDate().substring(0, 11) + list.get(i).getEvaDate().substring(11, 13) + "시" + list.get(i).getEvaDate().substring(14, 16) + "분" %></td>
						</tr>
					<%
						}
					%>

				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
				<a href="Eva.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} 
				if(evaDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="Eva.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			
			
		</div>
	</div>
	
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>