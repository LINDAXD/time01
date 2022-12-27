<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.dropdown>ul>li {
 display: inline-block;
 position: relative;
}

.dropdown>ul>li>ul {
 position: absolute;
 list-style-type: none;
 padding-left: 0px;
 padding-top: 5px;
 display: none;
}

.dropdown>ul>li:hover>ul {
 display: block;
}

w:hover {
 text-decoration: none;
 color: red
}
</style>
</head>
<body>
 <form name="top">
  <font face="Yang Rounded">
   <table height="170px" border="0" width="1330px"
    style="background-color: white" border="0">
    <tr>
     <td>
      <%
       if (session.getAttribute("userID") == null) {
      %>
      <table width="1330px" height="40px" border="0" align="right"
       border="0" style="color: white; background-color: black">
       <tr>
        <td><audio controls
          style="width:250px; margin-left:7%; margin-top:1%;">
         <source src="../mp3/letitgo-frost.mp3" type="audio/mpeg"></audio>
        </td>
        <td style="width: 550px"></td>
        <td onClick="gologin()" style="cursor: pointer"><w>로그인</w></td>
        <td></td>
        <td onClick="gojoin()" style="cursor: pointer"><w>회원가입</w></td>
        <td></td>
        <td onClick="goidfind()" style="cursor: pointer"><w>아이디찾기</w></td>
        <td></td>
        <td onClick="gopwfind()" style="cursor: pointer"><w>비밀번호찾기</w></td>
       </tr>
      </table>
<%} else {%>
      <table width="1340px" height="40px" border="0" align="right"
       border="0" style="color: white; background-color: black">
       <tr>
        <td><audio controls
          style="width:250px; margin-left:7%; margin-top:1%;">
         <source src="../mp3/letitgo-frost.mp3" type="audio/mpeg"></audio>
        </td>
        <td style="width: 550px"></td>
        <td onClick="myinfomenu()" style="cursor: pointer"><w><%=session.getAttribute("userName")%>님</w></td>
        <td></td>
        <td onClick="logout()" style="cursor: pointer"><w>로그아웃</w></td>
        <td></td>
        <td onClick="myinfomenu()" style="cursor: pointer"><w>회원
         정보 관리</w></td>
       </tr>
      </table>
<%} %>
     </td>
    </tr>
    <tr align="center">
     <td align="center" style=" height: 180px;">
      <table width="1330px" align=center>
       <tr>
        <td>
         <table width="500px" height="200px" align=center border="0">
          <tr>
           <td align="center"><a href="home.jsp"><img src="../img/miki.png"
            width="400px" height="100px" onClick="gohome()"></a></td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>

    <tr>
     <td>
      <table width="1000px" border="0" align="center" border="0">
       <tr>
        <td>
         <table width="1000px" border="0" align="left" border="0"
          style="color: black">
          <tr>
           <td>
            <div class="dropdown">
             <ul align="center" style="font-size: 17px">
              <li align="center" onClick="gohome()"
               style="cursor: pointer;"><w> HOME</w></li>
              <li style="width: 60px">|</li>
              <li align="center" onClick="profilemenu()"
               style="cursor: pointer;"><w>PROFILE</w></li>
              <li style="width: 60px">|</li>
              <li align="left" style="cursor: pointer;"><w>MINE</w>
               <ul style="font-size: 16px;">
                <li style="background-color: white;"
                 onClick="minemenu()">collection&nbsp;</li>
                <li style="background-color: white; margin-top: 2px"
                 onClick="studymenu()">study&nbsp;</li>
               </ul></li>
              <li style="width: 60px">|</li>
              <li align="center" onClick="guestmenu()"
               style="cursor: pointer;"><w> GUEST</w></li>
              <li style="width: 60px">|</li>
              <li align="left" style="cursor: pointer;"><w> Q&A</w>
               <ul style="font-size: 16px; width: 55px;">
                <li style="background-color: white;"
                 onClick="noticemenu()">공지사항&nbsp;</li>
                <li style="background-color: white; margin-top: 2px"
                 onClick="faqmenu()">FAQ&nbsp;</li>
                <li style="background-color: white; margin-top: 2px"
                 onClick="questionmenu()">Q&A&nbsp;</li>
               </ul></li>
             </ul>
            </div>
           </td>
          </tr>

          <tr>
           <td height="20px"></td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </font>
     </td>
    </tr>
   </table>
   <script src="js/id.js"></script>
</body>
</html>