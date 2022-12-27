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
	 userEmail = userEmail + "@" + e_domain;
} else {
	 userEmail = userEmail + "@" + domain;
}
 UserMgr um3 = new UserMgr();
 String userPassword = um3.pw_search(userName, userEmail);//비밀번호를 디비에서 가져옴..실패시 널
 if (userPassword != null) {//비밀번호 찾기 성공시
  //response.sendRedirect("./home.jsp");
  //메인화면으로 이동
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
</style>




</HEAD>

<BODY>
 <form name="pwsearch">
  <%@ include file="./top.jsp"%>
  <font face="Yang Rounded">

   <table width="1330px" border="0" height="430px" align="center">
    <tr>
     <td>
      <%
       if (userPassword != null) {
      %>
      <table width="450px" align="center" border="0"
       style="color: black; margin-top: -4%">
       <tr>
        <td>
         <table width="500px" align="center" border=0
          style="font-size: 30px">
          <tr>
           <td align="center"><img src="../img/miki_icon.png"
            height="42px"></td>
           <td>회원님의 비밀번호는 ?</td>
          </tr>
         </table>
        </td>
       </tr>

       <tr>
        <td>
         <table width="400px" height="200px" align="center" border="1"
          style="font-size: 25px; margin-top: 2%;">
          <tr align="center">
           <td style="border: 0"><%=userPassword%> 입니다.</td>
          </tr>
         </table>
        </td>
       </tr>
      </table> <%
  } else {
 %>
      <table width="550px" align=center border="0"
       style="color: black; font-size: 30px;">
       <tr align=center>
        <td style="height: 170px">* 비밀번호 찾기를 실패하셨습니다. *</td>
       </tr>
       <tr align=center>
        <td><input type="button" value="돌아가기"
         onClick="history.back()"></td>
       </tr>
      </table> <%
  }
 %>
     </td>
    </tr>
   </table>

  </font>
 </form>
 <script src="js/id4.js"></script>
</body>
</HTML> 