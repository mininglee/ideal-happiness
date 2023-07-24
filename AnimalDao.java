package animal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import member.Member;

public class AnimalDao {
	   public int insertAni(Ani m) {
		      Connection con = getConnection(); //1
		      
		      PreparedStatement pstmt;
		      try {
		         pstmt = con.prepareStatement(
		            "insert into animember values (?,?,?,?, sysdate)");
		         pstmt.setString(1, m.getSer());
		         pstmt.setString(2, m.getGroupid());
		         pstmt.setString(3, m.getNeuter());
		         pstmt.setString(4, m.getName());
		         pstmt.setString(5, m.getAge());
		         pstmt.setString(6, m.getGender());
		         pstmt.setString(7, m.getPicture());

		         return pstmt.executeUpdate(); //3 dml시 실행
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		      return 0;
		   }

	private Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}
}
