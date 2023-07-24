package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import animal.Ani;
import animal.AniMybatis;
import kic.mskim.Login;
import kic.mskim.MskimRequestMapping;
import kic.mskim.RequestMapping;
import member.Member;
import member.MemberMybatis;

@WebServlet(urlPatterns = { "/member/*" }, initParams = { @WebInitParam(name = "view", value = "/view/member/"),
		@WebInitParam(name = "login", value = "login") })
public class MemberController extends MskimRequestMapping {

	@RequestMapping("login")
	public String login(HttpServletRequest request, HttpServletResponse response) {

		return "login";
	}

	@RequestMapping("loginPro")
	public String loginPro(HttpServletRequest request, HttpServletResponse response) {

		String email = request.getParameter("email");
		String pass = request.getParameter("pass");

		MemberMybatis md = new MemberMybatis();
		Member mem = md.oneMember(email);
		String msg = "";
		String url = "";
		if (mem == null) {
			msg = "이메일과 비밀번호를 입력하세요";
			url = "member/login";
		} else {
			if (pass.equals(mem.getPass())) {
				request.getSession().setAttribute("email", email);
				msg = mem.getNicname() + "님이 로그인 하셨습니다";
				url = "mainpg/main";
			} else {
				msg = "비밀번호를 확인하세요";
				url = "member/login";
			}
			request.setAttribute("loggedIn", true);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}
	
	
	
	

	@RequestMapping("custom_signup")
	public String custom_signup(HttpServletRequest request, HttpServletResponse response) {

		return "custom_signup";
	}

	@RequestMapping("custom_signupPro")
	public String custom_signupPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Member mem = new Member();
		mem.setEmail(request.getParameter("email"));
		mem.setPass(request.getParameter("pass"));
		mem.setNicname(request.getParameter("nicname"));
		mem.setBirthday(request.getParameter("birthday"));
        
		MemberMybatis md = new MemberMybatis();
		Member m = new MemberMybatis().oneMember(mem.getEmail());
		String msg = "";
		String url = "";
		Member	nicm = new MemberMybatis().oneNicname(mem.getNicname());
		 if (nicm!=null) {
		    	msg = "증복된 닉네임이 존재합니다";
				url = "member/custom_signup";
				request.setAttribute("msg", msg);
				request.setAttribute("url", url);
				return "alert";
		    }
		if (m == null) {
			int num = md.insertMember(mem);
		
		if (num > 0) {
			msg = mem.getNicname() + "님이 가입을 하였습니다";
			url = "member/login";
		} else {
			msg = "회원가입이 실패하였습니다";
			url = "member/custom_signup";
		}
		
		} else {
			msg = "증복된 이메일이 존재합니다";
			url = "member/custom_signup";
			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		Member m = new MemberMybatis().oneMember(email);
		session.invalidate();
		String msg = m.getNicname() + "님이 로그아웃 되었습니다";
		String url = "/mainpg/main";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("myinfo")
	@Login("LoginUser")
	public String memberInfo(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		Member m = new MemberMybatis().oneMember(email);
		request.setAttribute("m", m);
		return "myinfo";
	}

	@RequestMapping("myinfoPro")
	public String myinfoPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Ani mem = new Ani();
		String email = (String) request.getSession().getAttribute("email");
		mem.setEmail(email);
		mem.setGroupid(request.getParameter("group1") + request.getParameter("group2"));
		mem.setNeuter(request.getParameter("neuter"));
		mem.setName(request.getParameter("name"));
		mem.setAge(request.getParameter("age"));
		mem.setGender(request.getParameter("gender"));
		mem.setPicture(" ");
		System.out.println(mem);

		AniMybatis md = new AniMybatis();
		int num = md.insertAni(mem);
		String msg = "";
		String url = "";
		if (num > 0) {
			msg = "저장되었습니다";
			url = "mainpg/main";
		} else {
			msg = "항목을 선택해주세요";
			url = "member/myinfo";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("memberUpdateForm")
	@Login("LoginUser")
	public String memberUpdateForm(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		Member m = new MemberMybatis().oneMember(email);

		request.setAttribute("m", m);

		return "memberUpdateForm";
	}

	@RequestMapping("memberUpdatePro")
	@Login("LoginUser")
	public String memberUpdatePro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String msg = "";
		String url = "";
		Member newm = new Member();
		newm.setEmail(email);
		newm.setPass(request.getParameter("pass"));
		newm.setNicname(request.getParameter("nicname"));
		newm.setBirthday(request.getParameter("birthday"));
		MemberMybatis md = new MemberMybatis();
		Member dbm = md.oneMember(email);
		System.out.println("dbm====="+newm);
		if (dbm != null) {
			if (dbm.getPass().equals(newm.getPass())) {
				int num = md.updateMember(newm);
				if (num > 0) {
					msg = newm.getNicname() + "님의 정보 수정이 되었습니다";
					url = "member/myinfo";
				} else {
					msg = "정보수정이 실패 하였습니다";
					url = "member/memberUpdateForm";
				}
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("memberPassForm")
	@Login("LoginUser")
	public String memberPassForm(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		request.setAttribute("email", email);
		return "memberPassForm";
	}

	@RequestMapping("memberPassPro")
	@Login("LoginUser")
	public String memberPassPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String msg = "";
		String url = "";
		MemberMybatis md = new MemberMybatis();
		Member dbm = md.oneMember(email);
		String Pass = request.getParameter("pass");
		String newPass = request.getParameter("chgpass1");
		if (dbm != null) {
			if (dbm.getPass().equals(Pass)) {
				int num = md.changePass(email, newPass);
				if (num > 0) {
					msg = dbm.getNicname() + "님의 비밀번호가 수정 되었습니다";
					url = "member/myinfo";
				} else {
					msg = "비밀번호 수정을 실패하였습니다";
					url = "member/memberPassForm";
				}
			} else {
				msg = "비밀번호가 틀렸습니다";
				url = "member/memberPassForm";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("memberDeleteForm")
	@Login("LoginUser")
	public String memberDeleteForm(HttpServletRequest request, HttpServletResponse response) {

		return "memberDeleteForm";
	}

	@RequestMapping("memberDeletePro")
	@Login("LoginUser")
	public String memberDeletePro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		MemberMybatis md = new MemberMybatis();
		Member dbm = md.oneMember(email);
		String pass = request.getParameter("pass");
		Object msg = null;
		String url = null;
		if (dbm != null) {
			if (dbm.getPass().equals(pass)) {
				int num = md.deleteMember(email);
				if (num > 0) {
					msg = dbm.getNicname() + "님의 탈퇴 처리 되었습니다";
					session.invalidate();
					url = "mainpg/main";
				} else {
					msg = "회원탈퇴가 실패 하였습니다";
					url = "member/memberDeleteForm";
				}
			} else {
				msg = "비밀번호가 틀렸습니다";
				url = "member/memberDeleteForm";
			}
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("pictureimgForm")
	public String pirctureimgForm(HttpServletRequest request, HttpServletResponse response) {

		return "pictureimgForm";

	}

	@RequestMapping("picturePro")
	public String picturePro(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "view/member/picture/";
		String filename = null;

		try {
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8");
			filename = multi.getFilesystemName("picture");
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("filename", filename);

		return "picturePro";

	}

	@RequestMapping("memberList")
	@Login("LoginAdmin")
	public String memberList(HttpServletRequest request, HttpServletResponse response) {
		String email = (String) request.getSession().getAttribute("email");
		List<Member> li = new MemberMybatis().memberList();
		request.setAttribute("li", li);

		return "memberList";
	}
}
