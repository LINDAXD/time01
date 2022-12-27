package user;

public class UserMgr {
	 UserDAO dao=new UserDAO();
	 
	// public UserDTO login(String id, String pw){
//	  return dao.login(id, pw);
//	 }
//	 public UserDTO pwinfo(String id){
	//  return dao.pwinfo(id);
	// }
//	 public boolean join(String id, String pw,String name,String sex,String phone,String email){
//	  return dao.join(id, pw,name,sex,phone,email);
//	 }
	 
//	 public String pw_search(String id,String phone){
//	  return dao.pw_search(id,phone);
//	 }
	 
	 
	 public String id_search2(String userName,String userEmail){  //이름,이메일로 찾기
	  return dao.id_search2(userName,userEmail);
	 }

	
}
