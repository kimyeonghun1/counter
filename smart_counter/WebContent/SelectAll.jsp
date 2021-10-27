<%@page import="model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	
	
		<%
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberVO> al = dao.selectAll();
	
	%>


	<table>
							<caption><h2>회원관리페이지</h2></caption>
							<tr>
								<td>ID</td>
								<td>닉네임</td>
								<td>삭제하기</td>
							<!-- <td>수정하기</td> 기능 미구현 -->	
							</tr>
							<% for (int i=0; i<al.size(); i++){ %>		
							
							<tr>
							
							<td><%=al.get(i).getId() %></td>
							<td><%=al.get(i).getNick() %></td>
							<td><a href="Delete?id=<%=al.get(i).getId()%>">삭제</a></td>
						<!-- <td><a href="Update?id=<%=al.get(i).getId()%>">수정</a></td> 기능 미구현 -->	
							
							</tr>
							
							<% }%>
</table>
	




</body>
</html>