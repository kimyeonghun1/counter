<%@page import="model.MemberVO"%>
<%@page import="model.GraphVo"%>
<%@page import="model.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTDHTML4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html id="id_html">
    <head>
        <title>Full Secondary Column, 1/3 x 1/3 x 1/3 Main Column.</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/Graph2styles.css">
    </head>
    <body>
        <div id="doc3" class="yui-t7">
            <div id="hd">
                <div id="header">
                <br>
                    <h1 align = "center"style="color:white">스마트 운동 카운터</h1><br><p align = "center"style="color:white">스마트 운동 카운터를 이용한 카운팅 결과를 그래프로 볼 수 있습니다.</p>
                </div>
            </div>
            <div id="bd">
                <div id="yui-main">
                    <div class="yui-b">
                        <div class="yui-gb">
                            <div class="yui-u first">
                                <div class="content">
                                    <canvas id="myChart"></div>
                                </div>
                                <div class="yui-u">
                                    <div class="content">
                                        <canvas id="myChart2"></canvas>
                                    </div>
                                </div>
                                <div class="yui-u">
                                    <div class="content">
                                        <canvas id="myChart3"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--
                        <div class="yui-b">
                          <div id="secondary">Secondary Column</div>
                        </div>
                      </div>
                      <div id="ft">
                        <div id="footer">Footer</div>
                      </div>
                    </div>
                    -->
                    
                    
                    
                    
		<%
		//JDBC(Select)
		
		request.setCharacterEncoding("euc-kr");
		session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String push_tgt = "";
		String sit_tgt = "";
		String pull_tgt = "";
		

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_a_5_1025";
			String dbpw = "smhrd5";
			
			conn = DriverManager.getConnection(url, dbid, dbpw);
			
			//1
			String sql = "SELECT T_COUNT FROM event WHERE S_ID = 'a0'";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				push_tgt = rs.getString(1);
			}

			//2
			sql = "SELECT T_COUNT FROM event WHERE S_ID = 'b0'";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				sit_tgt = rs.getString(1);
			}
			
			//3
			sql = "SELECT T_COUNT FROM event WHERE S_ID = 'c0'";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				pull_tgt = rs.getString(1);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				if(rs!=null) {
					rs.close();
				}
				if(psmt!=null) {
					psmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	   %>	
	   
	   
	   <% 
	   GraphVo gvo;
	   
	   MemberDAO dao = new MemberDAO();
	   ArrayList<GraphVo> al = dao.R_COUNT("A");
	   
	   %>
	   
                    <script>
                    
                    
                        // === include 'setup' then 'config' above ===
                        var push_tgt ="<%=push_tgt%>"; 
                        var sit_tgt ="<%=sit_tgt%>"; 
                        var pull_tgt ="<%=pull_tgt%>"; 
                        var data1 = {
                            label: '목표갯수',
                            backgroundColor: 'rgb(0, 0, 0)',
                            borderColor: 'rgb(0, 0, 0)',
                            type: 'line',
                            data: [
                            	
                            	<%
                            	for(int i=0; i<al.size(); i++){ %>
                            		
                            		<%=push_tgt%>,
                            		
                            		<%
                            		
                            	}
                            	
                            	
                            	%>
           
                            ]
                        };
                        var data2 = {
                            label: '실제갯수',
                            backgroundColor: 'rgb(255, 0, 0)',
                            borderColor: 'rgb(255, 0, 0)',
                            data: [
                            	
                            	<%
                            	for(int i=0; i<al.size(); i++){ %>
                            		
                            		<%=al.get(i).getR_COUNT()%>,
                            	<%
                            	}
                            	%>
                  
                            ]
                        };
                        const labels = [];
                        
                        <%for(int i=0; i<al.size(); i++){%>
                        
                    	labels.push("<%=al.get(i).getDate()%>")
                    		
                    		
                    	<%}%>
                        const Adata = {
                            labels: labels,
                            datasets: [data1, data2]
                        };
                        const config = {
                            type: 'bar',
                            data: Adata,
                            options: {
                                maintainAspectRatio: false,
                                plugins: {
                                    title: {
                                        display: true,
                                        text: '팔굽혀펴기'
                                    }
                                }
                            }
                        };
                        const myChart = new Chart(document.getElementById('myChart'), config);
                        // ////////////////////////////
                        var data3 = {
                            label: '목표갯수',
                            backgroundColor: 'rgb(0, 0, 0)',
                            borderColor: 'rgb(0, 0, 0)',
                            type: 'line',
                            data: [
                            	sit_tgt,
                            	sit_tgt,
                            	sit_tgt,
                            	sit_tgt,
                            	sit_tgt,
                            	sit_tgt,
                            	sit_tgt
                            ]
                        };
                        var data4 = {
                            label: '실제갯수',
                            backgroundColor: 'rgb(255, 0, 0)',
                            borderColor: 'rgb(255, 0, 0)',
                            data: [
                                50,
                                25,
                                45,
                                30,
                                15,
                                35,
                                45
                            ]
                        };
                        const Adata2 = {
                            labels: labels,
                            datasets: [data3, data4]
                        };
                        const config2 = {
                            type: 'bar',
                            data: Adata2,
                            options: {
                                maintainAspectRatio: false,
                                plugins: {
                                    title: {
                                        display: true,
                                        text: '윗몸일으키기'
                                    }
                                }
                            }
                        };
                        const myChart2 = new Chart(document.getElementById('myChart2'), config2);
                        // ///////////////////////////////
                        var data5 = {
                            label: '목표갯수',
                            backgroundColor: 'rgb(0, 0, 0)',
                            borderColor: 'rgb(0, 0, 0)',
                            type: 'line',
                            data: [
                            	pull_tgt,
                            	pull_tgt,
                            	pull_tgt,
                            	pull_tgt,
                            	pull_tgt,
                            	pull_tgt,
                            	pull_tgt
                            ]
                        };
                        var data6 = {
                            label: '실제개수',
                            backgroundColor: 'rgb(255, 0, 0)',
                            borderColor: 'rgb(255, 0, 0)',
                            data: [
                                20,
                                5,
                                35,
                                14,
                                7,
                                15,
                                5
                            ]
                        };
                        const Adata3 = {
                            labels: labels,
                            datasets: [data5, data6]
                        };
                        const config3 = {
                            type: 'bar',
                            data: Adata3,
                            options: {
                                maintainAspectRatio: false,
                                plugins: {
                                    title: {
                                        display: true,
                                        text: '턱걸이갯수'
                                    }
                                }
                            }
                        };
                        const myChart3 = new Chart(document.getElementById('myChart3'), config3);
                    </script>
                </body>
                     <div class="logo" align = "center">
                            <a href="index2.jsp"><img src="logo_120.png" alt=""></a>
                        </div>
                  <!--   <button type="button"  onclick="location.href='index2.jsp'" id = "home" style="background-color: #fffadf;" >홈으로</button> -->
            </html>