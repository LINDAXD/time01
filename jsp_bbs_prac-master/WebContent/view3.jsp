<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
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
		int bbsID = 0;
		// url에 bbsID가 넘어온다면 bbsID 변수에 정보 저장
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
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
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&tr;") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&tr;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID.equals(bbs.getUserID())){
			%>
					<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기" />
		</div>
	</div>
	
	<!-- 답글 쓰기 시작 -->
	<div class="container">
	<div class="form-group">
		<form method="post" encType = "multipart/form-data" action="commentAction.jsp?bbsID=<%= bbsID %>&userID=<%=userID%>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<td style="border-bottom:none;" valign="middle"><br><br><%= userID %></td>
					<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
					<td><br><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
				</tr>
				<tr>
					<td colspan="3"><input type="file" name="fileName"></td>
				</tr>
			</table>
		</form>
	</div>
</div>

<!-- 댓글 리스트  -->
<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
<tbody>
	<tr>
		<td align="left" bgcolor="beige">댓글</td>
	</tr>
	<tr>
	<%
CommentDAO commentDAO = new CommentDAO();
ArrayList<Comment> list = commentDAO.getList(UserID, bbsID);
for(int i=0; i<list.size(); i++){
%>
<div class="container">		//댓글하나당 container만들어서 보여줌
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
<tbody>
	<tr>						
		<td align="left"><%= list.get(i).getUserID() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "시" + list.get(i).getCommentDate().substring(14,16) + "분" %></td>		
<td colspan="2"></td>
<td align="right">
	<%
if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)){   //댓글 쓴사람과 지금 유저가 같을 때 수정과 삭제를 가능하게 함
%>
<form name = "p_search">
	<a type="button" onclick="nwindow(<%=UserID%>,<%=bbsID %>,<%=list.get(i).getCommentID()%>)" class="btn-primary">수정</a>
</form>	
	<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "commentDeleteAction.jsp?commentID=<%= list.get(i).getCommentID() %>" class="btn-primary">삭제</a>																	
<%
}
%>	
	</td>
</tr>
<tr>
	<td colspan="5" align="left"><%= list.get(i).getCommentText() %>
<% 	
String commentReal = "C:\\Users\\j8171\\Desktop\\studyhard\\JSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BBS\\commentUpload";
File commentFile = new File(commentReal+"\\"+bbsID+"사진"+list.get(i).getCommentID()+".jpg");
if(commentFile.exists()){           //해당 댓글에 대응되는 사진이 있을 경우 사진도 보여준다.
%>	
<br><br><img src = "commentUpload/<%=bbsID%>사진<%=list.get(i).getCommentID() %>.jpg" border="300px" width="300px" height="300px"><br><br></td>
<%} %>	
				</tr>
			</tbody>
		</table>			
	</div>
</div>
<%
}
%>
				</tr>
		</table>
	</div>
</div>

<form name = "p_search">
	<a type="button" onclick="nwindow(<%=UserID%>,<%=bbsID %>,<%=list.get(i).getCommentID()%>)" class="btn-primary">수정</a>
</form>	

<script type="text/javascript">
	function nwindow(UserID,bbsID,commentID){
	window.name = "commentParant";				//이름이 없으니까 그냥 이름을 설정해줍니다.
	var url= "commentUpdate.jsp?UserID="+boardID+"&bbsID="+bbsID+"&commentID="+commentID;
	window.open(url,"","width=600,height=230,left=300");		//자식창이 되는 주소를 오픈해줌 (크기도 설정해 줍니다.)
	}
</script>



	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>