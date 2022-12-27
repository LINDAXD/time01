<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
 <HEAD>
  <TITLE> PW_find </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">

<style>

  tr, td{
    border: 0px solid none; 
}
    </style>


 </HEAD>

 <BODY>

 <form name="pwfindscreen">
  <%@ include file="./top.jsp" %>
  <font face="Yang Rounded">
 
<table width="1330px"  border="0"  height="430px" align="center"   >
   <tr>
    <td>
     <table width="450px" align="center"  border="0" style="color:black; background-color: #F6F6F6; font-size:20px; ">
    <tr>
    <td>
     <table width="750px" align="center" border=0; style="background-color:white; margin-top:3%" >
      <tr>
       <td align="center"><img src="../img/miki_icon.png" height="30px"></td>
       <td>비밀번호 찾기</td>
       <td><div id="sub-title"> |  회원정보에 등록한 정보로 인증.</td>
       <td style="width:300px"></td>
      </tr>
     </table>
    </td> 
    </tr>       
   <tr> 
    <td>
   <table width="600px"  height="300px" align="center" border="0"  style=" background-color:none; border:dotted 5px none;">
    <tr>
     <td>
      <table width="400px"  border="0" style="margin-top:3%">
       <tr>
        <td>&nbsp;&nbsp;<img src="../img/check.png" height="30px" >
        </td>
        <td><div id="middle-title">&nbsp;이름과 이메일을 입력해주세요.</div>
        </td>
       </tr>
      </table>
     </td>
    </tr>

    <tr>
     <td>
      <table width="380px" align="center" border="0" style="font-size:19px">
       <tr>
        <td>이름</td>
        <td><input type="text" name="userName"></td>
       </tr>
       <tr>
             <td style="text-align: center;">e-mail&nbsp;</td>
             <td><input type="text" name="userEmail"
              style="width: 80px" onblur="checkid()"> @ <input
              type="text" name="e_domain" style="width: 80px"> <select
              name="domain" onchange="domainCheck();">
               <option value="0" selected="selected">직접입력</option>
               <option value="naver.com">naver.com</option>
               <option value="hanmail.net">hanmail.net</option>
               <option value="nate.com">nate.com</option>
               <option value="yahoo.com">yahoo.com</option>
             </select></td>
            </tr>
      </table>
     </td>
    </tr>
   
    <tr>
     <td>
      <table width="150px"  align="center" border="0" style="margin-top:1%">
       <tr>
              <td><input type="button" name="enter2" value="  찾기  "
               align="center"
               style="cursor: pointer; background: white; color: black; border-color: black;"
               onClick="id_search2()"></td>
              <td><input type="button" name="cancle2"
               value="  취소  " align="center"
               style="cursor: pointer; background: white; color: black; border-color: black"
               onClick="gologin()"></td>
             </tr>
      </table>
     </td>
    </tr>

  </table>
 </td>
</tr>
</table>
</td>
</table>

</font>
</form>
<script src="js/id2.js"></script>
 </BODY>
</HTML> 