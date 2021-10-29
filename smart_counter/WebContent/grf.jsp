<%@page import="java.util.ArrayList"%>
<%@page import="model.MemberDAO"%>
<%@page import="model.GraphVo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

	 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">



<body>




<% 
String id = "aaaa";
MemberDAO dao = new MemberDAO();
ArrayList<GraphVo> al = dao.R_COUNT(id);

%>

	
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <canvas id="myChart"></canvas>
           
        </div>
    </div>
</div>


	
<script>






const labels = [
    
	<% for(int i=0; i<al.size(); i++){%>
	
	'<%=al.get(i).getDate()%>',
	
	<%
    System.out.println(al.get(i).getDate());
    }
    %>
	
	
];

const data = {
    labels: labels,
    datasets: [{
        label: '실재갯수 ',
        backgroundColor: 'rgb(255, 99, 132)',
        borderColor: 'rgb(255, 99, 132)',
        data: [<% for(int i=0; i<al.size(); i++){
        	
        	%><%=al.get(i).getR_COUNT()%>,<%
        			
        }
        
        %>],
    }]
};

const config = {
    type: 'bar',
    data: data,
    options: {}
};

const myChart = new Chart(
    document.getElementById('myChart'),
    config
);


</script>
	
	
	<a href="Home">home</a>

</body>
</html>