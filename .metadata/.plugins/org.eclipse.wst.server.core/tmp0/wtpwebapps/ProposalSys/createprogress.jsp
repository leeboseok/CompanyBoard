<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>next write</title>
		<link rel="stylesheet" href="css/body.css">
		<style>
			
		</style>
	</head>
	<body>
	    <%
	        request.setCharacterEncoding("utf-8");
	        data.create d=new data.create();
	        session.setAttribute("obj", d);
	        
	        String title = request.getParameter("title");
	        String summary=request.getParameter("summary");
	        String bg=request.getParameter("background");
	        String solution=request.getParameter("solution");
	        String financial=request.getParameter("financial");
	        String conclusion=request.getParameter("conclusion");
	        String documents=request.getParameter("documents");
	        
	        d.setTitle(title);
	        d.setSummary(summary);
	        d.setBackground(bg);
	        d.setSolution(solution);
	        d.setFinancial(financial);
	        d.setConclusion(conclusion);
	        d.setDocuments(documents);
	        
	        Connection conn=null;
	        PreparedStatement pstmt=null;
	        ResultSet rs=null;
	
	        String url="jdbc:mysql://127.0.0.1:3306/fm_global";
	        String db_id="root";
	        String db_pw="iotiot";
	
	        try{
	            String data=(String)session.getAttribute("author");
	    %>
	            <h1><%=data %></h1>
	    <%
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            conn=DriverManager.getConnection(url, db_id, db_pw);
	            String sql="insert into proposals (title, summary, background, solution, financial, conclusion, documents, author) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	            pstmt=conn.prepareStatement(sql);
	            pstmt.setString(1, title);
	            pstmt.setString(2, summary);
	            pstmt.setString(3, bg);
	            pstmt.setString(4, solution);
	            pstmt.setString(5, financial);
	            pstmt.setString(6, conclusion);
	            pstmt.setString(7, documents);
	            pstmt.setString(8, data);
	
	            pstmt.executeUpdate();
	    %>
	            <h1>업로드 성공</h1>
	    <%
	            response.sendRedirect("preview.jsp");
	        }catch(Exception e){
	            out.println("접속 중 오류 발생 : " + e);
		        }finally{
		            try{
		                if(rs!=null)rs.close();
		                if(pstmt!=null)pstmt.close();
		                if(conn!=null)conn.close();
		            }catch(Exception ex){
		                out.println("접속 해제 중 오류 발생 : " + ex);
		            }
		        }
	    %>
	</body>
</html>