package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import member.Member;

public class BoardDao {
	
	public Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1111");
			System.out.println("db ok");
			return conn;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("db error");
		return null;
	}

	
	public int insertBoard(Board1 board) {
		Connection con = getConnection(); // 1
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement
			("insert into board1 values (boardseq.nextval,?,?,?,?,?,?,sysdate,0,boardseq.currval,0,0)");
			
			pstmt.setString(1, board.getBoardid());
			pstmt.setString(2, board.getName());
			pstmt.setString(3, board.getPass());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5,board.getContent());
			pstmt.setString(6, board.getFile1());
			
			return pstmt.executeUpdate(); // 3 dml시 실행

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}
	public int insertComment(String comment, int num) {
		Connection con = getConnection(); // 1
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement
			("insert into comment1 values (boardcomseq.nextval,?,?,sysdate)");
			pstmt.setInt(1, num);
			pstmt.setString(2, comment);
			return pstmt.executeUpdate(); // 3 dml시 실행

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}
	public int boardCount(String boardid) {
		Connection con = getConnection(); // 1
		PreparedStatement pstmt;		ResultSet rs=null;
		String sql = "select nvl(count(*),0) from board1 where boardid = ? ";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardid);
			rs=pstmt.executeQuery() ;
			if (rs.next())
			{  return rs.getInt(1);
						}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		return 0;		
	}
	
	

	public List<Board1> boardList(int pageInt, int limit, String boardid) {
		Connection con = getConnection(); // 1
		PreparedStatement pstmt;		ResultSet rs=null;
		List<Board1> li = new ArrayList<>();
		try {
			/*
			select * from (
select rownum rnum , a.* from 
(select * from board where boardid = '1'
order by num desc) a) where rnum BETWEEN 10 and 13;
			 */
		String sql = 	" select * from ("+
				" select rownum rnum , a.* from "+
				" (select * from board1 where boardid = ?"+
				" order by num desc) a) where rnum BETWEEN ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardid);
			pstmt.setInt(2, (pageInt-1)*limit + 1); //1 ,11, 21,  .....
			pstmt.setInt(3, pageInt*limit);  //10, 20, 30
			rs=pstmt.executeQuery() ;
			
			while (rs.next()) {
				Board1 b = new Board1();
				b.setNum(rs.getInt("num"));
				b.setName(rs.getString("name"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setRegdate(rs.getDate("regdate"));
				b.setReadcnt(rs.getInt("readcnt"));
				li.add(b);		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		return li;		
	}
	public List<Comment1> commentList(int num) {
		Connection con = getConnection(); // 1
		PreparedStatement pstmt;		ResultSet rs=null;
		List<Comment1> li = new ArrayList<>();
		try {	
		String sql = 	" select * from comment1 where num = ?  order by regdate desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery() ;
			while (rs.next()) {
				Comment1 c = new Comment1();
				c.setSer(rs.getInt("ser"));
				c.setNum(rs.getInt("num"));
				c.setContent(rs.getString("content"));
				c.setRegdate(rs.getDate("regdate"));
				li.add(c);		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		return li;		
	}
	
	
	public Board1 boardOne(int num) {
		Connection con = getConnection(); // 1
		PreparedStatement pstmt;		ResultSet rs=null;
		try {
		String sql = 	"select * from board1 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery() ;
			if (rs.next()) {
				Board1 b = new Board1();
				b.setNum(rs.getInt("num"));
				b.setName(rs.getString("name"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setRegdate(rs.getDate("regdate"));
				b.setReadcnt(rs.getInt("readcnt"));
				return b;		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		return null;		
	}
	
	public int boardUpdate(Board1 board) {
		Connection con = getConnection(); // 1
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement
			("update board1 set subject = ?, content = ?, file1 = ? where num = ?");
			
			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3,  board.getFile1());
			pstmt.setInt(4, board.getNum());
			
			
			return pstmt.executeUpdate(); // 3 dml시 실행

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}
	
	public int boardDelete(int num) {
		Connection con = getConnection(); // 1
		PreparedStatement pstmt;
		String sql1 = "delete from board1 where num = ?";
		String sql2 = "delete from comment1  where num = ?";
		try {
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt = con.prepareStatement(sql1);
			pstmt.setInt(1, num);
			return pstmt.executeUpdate(); // 3 dml시 실행

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return 0;		
	}	
}  //end class
