<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserMgr"%>
<%
 request.setCharacterEncoding("UTF-8");
 String userName = request.getParameter("userName");
 String domain = request.getParameter("domain");
 String e_domain = request.getParameter("e_domain");
 String userEmail = request.getParameter("userEmail");
 System.out.println("이름:" + userName);

 if (domain.equals("0")) {
	 userEmail = userName + "@" + e_domain;
 } else {
	 userEmail = userEmail + "@" + domain;
 }

 System.out.println("이메일:" + userEmail);
 UserMgr um = new UserMgr();
 String userID = um.id_search2(userName, userEmail); //아이디를 디비에서 가져옴..실패시 널
 if (userID != null) { //아이디 찾기 성공시

 }
%>
<HTML>
<HEAD>
<style>
tr,td {
 border: 0px solid none;
}

 

k:hover {
 text-decoration: none;
 color: #9354ED
}


</HEAD>
<body>
 <font face="Yang Rounded">
  <form name="idsearch" method="post">
   <%@ include file="./top.jsp"%>
   <table width="1330px" height="530px" align="center">
    <tr>
     <td>
      <%
       if (userID != null) {
      %>
      <table width="550px" align=center border="0"
       style="color: black; font-size: 30px;">
       <tr align=center>
        <td style="height: 170px">* 회원님의 아이디를 찾았습니다! *</td>
       </tr>
       <tr align=center>
        <td style="font-size: 20px"><%=userID%></td>
       </tr>
      </table> <%
  } else {
 %>
      <table width="550px" align=center border="0"
       style="color: black; font-size: 30px;">
       <tr align=center>
        <td style="height: 170px">* 아이디 찾기를 실패하셨습니다. *</td>
       </tr>
       <tr align=center>
        <td><input type="button" value="돌아가기"
         onClick="history.back()"></td>
       </tr>
      </table> <%
  }
 %> </font>
      </form>

</font>
 <script src="js/id.js"></script>
</body>
</HTML>