package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		//UserDAO 객체가 생성될때 바로 데이터베이스 접근하도록 생성자 설정
		try {
			String dbURL = "jdbc:mysql://127.0.0.1:3306/BBS";
			String dbID = "root";
			String dbPassword = "12345";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,  dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "select userPassword from user where userID= ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 비밀번호 불일치
				}
			}
			return -1; // 아이디 없음
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // DB오류
	}
	
	public int join(User user) {
		String SQL = "insert into user values (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  user.getUserID());
			pstmt.setString(2,  user.getUserPassword());
			pstmt.setString(3,  user.getUserName());
			pstmt.setString(4,  user.getUserGender());
			pstmt.setString(5,  user.getUserEmail());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	// 내정보 가져오기
	public User getUser(String userID){
		String SQL = "select * from user where userID = ? ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			// select * from user where userID = 'aa';
			if(rs.next()) {
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserGender(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				
				return user;
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(User user) {
		String SQL = "update user set userPassword = ?, userName = ?, userGender = ?, userEmail = ? where userID = ?"; //id에 맞는것만 찾아서 바꿈
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  user.getUserPassword());
			pstmt.setString(2,  user.getUserName());
			pstmt.setString(3,  user.getUserGender());
			pstmt.setString(4,  user.getUserEmail());
			pstmt.setString(5,  user.getUserID());
			return pstmt.executeUpdate(); // 0 이상의 결과 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	public int delete(String userID) {
		String SQL = "delete from user where userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			return pstmt.executeUpdate(); // 0 이상의 결과 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	public String id_search2(String userName, String userEmail){  //이름,이메일로 찾기
		  String userID=null ; //찾을아이디
		  
		  String SQL="select userID from user where userName=? and userEmail=?";
		  
		  try{
		PreparedStatement pstmt = conn.prepareStatement(SQL);; //쿼리
		   pstmt.setString(1, userName); //첫번째 ?를 스트링 id로 넣음
		   pstmt.setString(2, userEmail); //두번째 ?에 스트링 pw 넣음
		   
		   rs=pstmt.executeQuery(); //쿼리를 실행해서 결과값을 rs로 저장
		   while(rs.next()){  //rs가 끝날때까지 반복
			   userID=rs.getString("userID"); //cnt를 디비에서 가져온 cnt에 저장  
		   }

		  }catch(Exception e){
		   System.out.println(e);
		  }
		  return userID;
		 }

}
