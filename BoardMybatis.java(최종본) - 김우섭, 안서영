package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import member.Member;
import mybatis.MemberAnno;
import mybatis.MybatisConnection;


public class BoardMybatis {

	private SqlSession sqlSession = MybatisConnection.getConnection();
	
	private static final String NS = "mybatis.board1.";
	   		  public int insertBoard(Board1 board1) {
	   		   try {	
	   			   return sqlSession.insert(NS+"insertBoard", board1);
	   			   
	   			   } catch (Exception e) {
	   				   e.printStackTrace();
	   				   
	   			   } finally { sqlSession.commit();
	   			   
	   			   } return 0;
		   }
	   		public int insertComment(String comment, int num, String session) {
	   			Map map = new HashMap();
	   			map.put("comment", comment);
	   			map.put("num", num);
	   			map.put("session", session);
	   			
	   			try {	
	   				return sqlSession.insert(NS+"insertComment", map);
	   			   
	   			   } catch (Exception e) {
	   				   e.printStackTrace();
	   				   
	   			   } finally { sqlSession.commit();
	   			   
	   			   } return 0;
	   		}
	   		

	public int boardCount(String boardid) {
		return sqlSession.selectOne(NS+"boardCount",boardid);
	}
	   		  
	
	public List<Board1> free(int pageInt, int limit, String boardid){
		Map map = new HashMap();
		map.put("boardid", boardid);
		map.put("start", (pageInt-1)*limit + 1);
		map.put("end", pageInt*limit);
		System.out.println(map);
		return sqlSession.selectList(NS+"boardList",map);  
		
	}
	      

	public List<Comment1> commentList(int num){
		return sqlSession.selectList(NS+"commentList",num);
	   }
	
	
	public Board1 boardOne(int num){
		return sqlSession.selectOne(NS+"boardOne",num);
	}
	
	
	public int boardUpdate(Board1 board1) {
		try {	
			   return sqlSession.insert(NS+"boardUpdate", board1);
			   
			   } catch (Exception e) {
				   e.printStackTrace();
				   
			   } finally { sqlSession.commit();
			   
			   } return 0;
		}
	
	public int boardDelete(int num) {
		try {	
			   return sqlSession.insert(NS+"boardDelete", num);
			   
			   } catch (Exception e) {
				   e.printStackTrace();
				   
			   } finally { sqlSession.commit();
			   
			   } return 0;
	}
}//end class
	
