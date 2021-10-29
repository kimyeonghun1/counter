<%@page import="model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
	<title>Insert title here</title>
	<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	
			<style>
    body {
    
	background: #40E0D0;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #FF0080, #FF8C00, #40E0D0);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #FF0080, #FF8C00, #40E0D0); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

      min-height: 100vh;
        
     
    }
    
  			</style>
	</head>
	
	
	<body style = "text-align: center;">
	
	<%
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberVO> al = dao.selectAll();
	
	%>
	<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">
						<table >
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
	</nav>			
</div>
	<!-- Scripts -->
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
</body>
</html>