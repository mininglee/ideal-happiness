package animal;

import org.apache.ibatis.session.SqlSession;

import mybatis.AniAnno;
import mybatis.MybatisConnection;

public class AniMybatis {
private static SqlSession sqlSession = MybatisConnection.getConnection();
	
	public int insertAni(Ani m) {
		
		try {
			return sqlSession.getMapper(AniAnno.class).insertAni(m);
	    
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.commit();
			} return 0;
	}
}
