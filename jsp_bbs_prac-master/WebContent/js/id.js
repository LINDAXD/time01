 function gohome() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./main.jsp"; //넘어간화면
  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
 }

 function gojoin() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./join.jsp"; //넘어간화면
  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
 }

 function gologin() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./login.jsp";
  frm.submit();
 }

 function goidfind() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./id_find.jsp";
  frm.submit();
 }

 function gopwfind() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./pw_find.jsp";
  frm.submit();
 }
 function logout() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./index.jsp";
  frm.submit();
 }
 function id_search2(){
	var frm=document.idfindscreen;
	if(frm.userName.value.length<1){
		alert("이름입력");
		return;
	}
	if(frm.userEmail.value.length <1){
		alert("이메일 입력");
		return;
	}
	frm.method="post";
	frm.action="./id_searchCtl2.jsp";
	frm.submit();
}
 function checkid() {

  var frm = document.idfindscreen;

  var regExp = "/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/";

  if (!regExp.test(frm.email.value)) {

   alert("올바른 email을 입력해주세요.");

   frm.email.focus();

  }

 }

 function domainCheck() {

  var frm = document.idfindscreen;

  if (frm.domain.value == 0) {
   frm.e_domain.value = "";
   frm.e_domain.disabled = false;

  } else {
   frm.e_domain.value = frm.domain.value;
   frm.e_domain.disabled = true;

  }
  /* function enter(){

  var frm=document.pwfindscreen;

	if(frm.userName.value.length<1){
		alert("이름입력");
		return;
	}
	if(frm.userEmail.value.length <1){
		alert("이메일 입력");
		return;
	}
  frm.method="post";
  frm.action="./pw_searchCtl.jsp"; //넘어간화면
  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
  }
*/
 }