package member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.MemberAnno;
import mybatis.MybatisConnection;

public class MemberMybatis {
	
	private static SqlSession sqlSession = MybatisConnection.getConnection();
	
	public int insertMember(Member m) {
		
		try {
			return sqlSession.getMapper(MemberAnno.class).insertMember(m);
	    
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.commit();
			} return 0;
	}
	   
	public Member oneMember(String email) {
		return sqlSession.getMapper(MemberAnno.class).oneMember(email);
	}
	
	public Member oneNicname(String nicname) {
		return sqlSession.getMapper(MemberAnno.class).oneNicname(nicname);
	}
	
	public int updateMember(Member m) {
		try {
		    return sqlSession.getMapper(MemberAnno.class).updateMember(m);
		    
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.commit();
			} return 0;
	}

	public int deleteMember(String email) {
		try {
		    return sqlSession.getMapper(MemberAnno.class).deleteMember(email);
		    
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.commit();
			} return 0;
	}
	   
	public int changePass(String email, String newPass) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("newPass", newPass);
		try {
			return sqlSession.getMapper(MemberAnno.class).changePass(map);
		    
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.commit();
			} return 0;
	}
	
	public List<Member> memberList() {
		return sqlSession.getMapper(MemberAnno.class).memberList();
	}
}
