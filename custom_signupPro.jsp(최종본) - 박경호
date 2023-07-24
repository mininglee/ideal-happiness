<%@page import="member.MemberDao"%>
<%@page import="member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("utf-8");
Member mem = new Member();
mem.setEmail(request.getParameter("email"));
mem.setPass(request.getParameter("pass"));
mem.setNicname(request.getParameter("name"));
mem.setBirthday(request.getParameter("birthday"));

MemberDao md = new MemberDao();
int num = md.insertMember(mem);
String msg = "";
String url = "";
if (num > 0) {
	//insert ok
	msg = mem.getNicname() + "님이 가입을 하였습니다";
	url = "login.jsp";
} else {
	// insert error
	msg = "회원가입이 실패 하였습니다";
	url = "custom_signup.jsp";
}

%><%=mem %>
<script>
  alert ('<%=msg%>');
  location.href="<%=url%>";
</script>
</body>
</html>
