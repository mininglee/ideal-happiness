package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;


import board.Board1;
import board.BoardMybatis;
import board.Comment1;
import kic.mskim.MskimRequestMapping;
import kic.mskim.RequestMapping;

@WebServlet(urlPatterns = {"/board/*"},
initParams= {@WebInitParam(name="view",value="/view/board/"),//jsp위치
		@WebInitParam(name="login",value="login")})  //패키지명
public class boardController extends MskimRequestMapping{
	
	@RequestMapping("write")
	public String write(HttpServletRequest request,
			HttpServletResponse response) {
		
		return  "write";
	}
	
	
	
	@RequestMapping("boardPro")
	public String boardPro(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "view/board/images/";
		String msg = "게시물 등록 실패";
		String url = "/board/write";
		
		
		String boardid = (String) request.getSession().getAttribute("boardid");
		if (boardid == null)
			boardid = "1";
		
		
		String filename = "";
		try {
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8");
			filename = multi.getFilesystemName("file1");
			Board1 board = new Board1();
			board.setBoardid(boardid);
			board.setName(multi.getParameter("name"));
			board.setPass(multi.getParameter("pass"));
			board.setSubject(multi.getParameter("subject"));

			board.setContent(multi.getParameter("content"));
			if (filename == null)  filename="";
			board.setFile1(filename);
			BoardMybatis bd = new BoardMybatis();
			System.out.println(board);
			int num = bd.insertBoard(board);
			if (num > 0) {
				msg = "게시물 등록 성공";
				url = "/board/free";

			}

			// upload filename type="file" name="file1">
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("msg", filename + ":" + msg);
		request.setAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("free")
	public String free(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		// boardid 파라메터로 넘어 왔을때만 session에 저장 한다
		if (request.getParameter("boardid") != null) {
			session.setAttribute("boardid", request.getParameter("boardid"));
			session.setAttribute("pageNum", "1");
		}
		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null)
			boardid = "1";
		
		// pageNum 파라메터로 넘어 왔을때만 session에 저장 한다
		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1";
		
		
		int limit = 12; // 한 page당 게시물 갯수
		
		int pageInt = Integer.parseInt(pageNum); // page 번호
		BoardMybatis bd = new BoardMybatis();
		int boardCount = bd.boardCount(boardid); // 전체 게시물 갯수
		int boardNum = boardCount - ((pageInt - 1) * limit);

		List<Board1> list = bd.free(pageInt, limit, boardid);
		System.out.println(list);
		String boardName = "";
		switch (boardid) {
		case "1":
			boardName = "자유게시판";
			break;
		case "2":
			boardName = "제품 추천";
			break;
		case "3":
			boardName = "친구 찾기";
			break;
		case "4":
			boardName = "호텔&여행 정보";
			break;
		}
		
		// pagging
				int bottomLine = 3;
				int start = (pageInt - 1) / bottomLine * bottomLine + 1;
				int end = start + bottomLine - 1;
				int maxPage = (boardCount / limit) + (boardCount % limit == 0 ? 0 : 1);
				if (end > maxPage)
					end = maxPage;

				request.setAttribute("bottomLine", bottomLine);
				request.setAttribute("start", start);
				request.setAttribute("end", end);
				request.setAttribute("maxPage", maxPage);
				request.setAttribute("pageInt", pageInt);
				request.setAttribute("list", list);
				request.setAttribute("boardNum", boardNum);
				request.setAttribute("boardName", boardName);
		return "free";
    }
	
	@RequestMapping("boardComment")
	public String boardComment(HttpServletRequest request, HttpServletResponse response) {
		int num=1;
		try {
		 num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		BoardMybatis   bd = new BoardMybatis();
		Board1 board = bd.boardOne(num);
		List<Comment1> commentLi = bd.commentList(num);
		request.setAttribute("board", board);
		request.setAttribute("commentLi", commentLi);
		return "boardComment";
	}
	
	
	@RequestMapping("boardCommentPro")
	public String boardCommentPro(HttpServletRequest request, HttpServletResponse response) {
		int boardnum=1;
		try {
			boardnum = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		//session 세션 확인
		
		String comment = request.getParameter("comment");
		BoardMybatis   bd = new BoardMybatis();
		int num = bd.insertComment(comment, boardnum, "session");
		
		if (num==0) comment="저장되지 않았습니다 ";
		
		Comment1 c = new Comment1();
		c.setContent(comment);
		c.setRegdate(new Date());
       c.setNicname("session");
		
		request.setAttribute("c", c);
	
		return "boardCommentPro";
	}
	
	
	@RequestMapping("boardUpdateForm")
	   public String boardUpdateForm(HttpServletRequest request, HttpServletResponse response) {
	      int num=1;
	      try {
	       num = Integer.parseInt(request.getParameter("num"));
	      } catch (Exception e) {
	         e.printStackTrace();
	         
	      }
	      
	      String boardid = (String) request.getSession().getAttribute("boardid");
	      if (boardid == null)  boardid="1";
	      
	      String boardName="";
	      switch (boardid) {
	      case "1":
	         boardName = "자유게시판";
	         break;
	      case "2":
	         boardName = "제품 추천";
	         break;
	      case "3":
	         boardName = "친구 찾기";
	      case "4":
		         boardName = "호텔&여행 정보";
	         break;

	      }
	        BoardMybatis   bd = new BoardMybatis();
			Board1 board = bd.boardOne(num);
			request.setAttribute("board", board);
			request.setAttribute("boardName", boardName);
			return "boardUpdateForm";
	}
	      
	      @RequestMapping("boardUpdatePro")
	  	public String boardUpdatePro(HttpServletRequest request, HttpServletResponse response) {
	  		int num=1;
	  	
	  		String path = request.getServletContext().getRealPath("/") + "view/board/images/";
	  		String msg = "";
	  		String url = "";	
	  		
	  		try {
	  			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8");
	  		
	  			Board1 board = new Board1();	
	  			board.setNum(Integer.parseInt(multi.getParameter("num"))); //====
	  			board.setName(multi.getParameter("name"));
	  			board.setPass(multi.getParameter("pass"));
	  			board.setSubject(multi.getParameter("subject"));
	  			board.setContent(multi.getParameter("content"));
	  		   
	  			String file2 = multi.getFilesystemName("file2");
	  			if (file2!=null) {
	  				board.setFile1(file2);
	  			} else {
	  				board.setFile1(multi.getParameter("file1"));
	  			}
	  			
	  			
	  			
	  			System.out.println(board);
	  			BoardMybatis bd = new BoardMybatis();
	  			Board1 dbboard = bd.boardOne(board.getNum()); //pass 확인용  ======
	  			
	  			if(board.getPass().equals(dbboard.getPass())) {  //수정 가능 확인
	  				if (bd.boardUpdate(board)>0) { //update ok
	  				 msg="수정 완료";
	  				 url = "/board/boardComment?num="+board.getNum();
	  				} else {
	  					 msg="수정 실패";
	  					 url = "/board/boardUpdateForm?num="+board.getNum();
	  				}
	  				
	  			} else {
	  				
	  				 msg="비밀번호가 틀렸습니다";
	  				 url = "/board/boardUpdateForm?num="+board.getNum();
	  			}
	  			
	  			
	  		} catch (Exception e) { e.printStackTrace(); }
	  		request.setAttribute("msg", msg);
	  		request.setAttribute("url", url);
	  		return "alert";  //view/board/alert.jsp 확인
	  	}
	      
	 
	    
	
	
	@RequestMapping("boardDeleteForm")
	public String boardDeleteForm(HttpServletRequest request, HttpServletResponse response) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", num);
		return "boardDeleteForm";
	}
	

	@RequestMapping("boardDeletePro")
	public String boardDeletePro(HttpServletRequest request, HttpServletResponse response) {
		String pass = request.getParameter("pass");
		int num = Integer.parseInt(request.getParameter("num"));
		BoardMybatis  bd = new BoardMybatis();
		Board1 dbboard = bd.boardOne(num);
		String msg="";
		String url = "";
		if (pass.equals(dbboard.getPass())) {
			if (bd.boardDelete(num) > 0) {
				msg="게시글이 삭제 되었습니다";
				url="/board/free";
			} else {
				msg="삭제 실패 입니다";
				url="/board/boardDeleteForm";}
		} else {
			msg="비밀번호 확인하세요";
			url="/board/boardDeleteForm";}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}	
}

