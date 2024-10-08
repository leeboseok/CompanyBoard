<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>메인 페이지 입니다.</title>
		<link rel="stylesheet" href="css/main.css">
		<style>
            /*#menu {width: 100%; display: flex; justify-content:center; }*/
		</style>
	</head>
	<body>
		<%
			String test=(String)session.getAttribute("fn");
			String admin=(String)session.getAttribute("admin");
			System.out.println(test);
		%>
		<div id="wrap">
			<div class="header">
				<div class="top">
					<div class="left">
						<%
							if("admin".equals(admin)){
								%>
									<a href="memberedit.jsp">User list</a>
									<a href="admincontactview.jsp">User inquire</a>
								<%
							}else
						%>
						<a href="mypage.jsp">My page</a>
						<a href="create.jsp">Create</a>
					</div>
					<div class="right">
						<a href="logoutprogress.jsp">Sign out</a>
						<a href="admincontact.jsp">Contact</a>
					</div>
				</div>
			</div>
			<div class="body">
			<%
				Connection conn=null;
				Statement stmt=null;
				ResultSet rs=null;
				String pg=request.getParameter("page");
				
				int currentPage=(pg!=null)?Integer.parseInt(pg):1;
				int recordsPerPage=5;
				int start=(currentPage-1)*recordsPerPage;
				
				String url="jdbc:mysql://127.0.0.1:3306/fm_global";
				String db_id="root";
				String db_pw="iotiot";
				try{
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn=DriverManager.getConnection(url, db_id, db_pw);
					
					String countSql="select count(*) from proposals";
					
					stmt=conn.createStatement();
					rs=stmt.executeQuery(countSql);
					int totalRecords=0;
					if(rs.next()){
						totalRecords=rs.getInt(1);
					}
					rs.close();
					stmt.close();
					
					int totalPages=(int)Math.ceil((double) totalRecords / recordsPerPage);
					String sql="select p.num, p.title, m.fn, m.ln, m.job, m.location, p.created_at from proposals p join member m on p.author=m.num ";
					sql+= "order by p.created_at desc "+"limit "+start+","+recordsPerPage;
					stmt=conn.createStatement();
					rs=stmt.executeQuery(sql);
					System.out.println(sql);
					
					while(rs.next()){
						int num=rs.getInt("num");
						String title=rs.getString("title");
						String firstName=rs.getString("fn");
						String lastName=rs.getString("ln");
						String job=rs.getString("job");
						String location=rs.getString("location");
						String createdAt=rs.getString("created_at");
						%>
							<div class="list">
								<a href="viewpage.jsp?num=<%=num %>">
									<%=title %> <br>
									Name : <%=firstName+" "+lastName %> Position : <%=job %>
									Location : <%=location %><br>
									<%=createdAt %>
								</a>
							</div>
						<%
					}
					%>
					</div>
						<div class="pagination">
						<%
							if(currentPage>1){
								out.println("<a href='?page=" + (currentPage-1)+"'>Previous</a>");
							}
							for(int i=1; i<=totalPages; i++){
								if(i==currentPage){
									out.println("<strong>"+i+"</strong>");
								}else{
									out.println("<a href='?page="+i+"'>"+i+"</a>");
								}
							}
							if(currentPage<totalPages){
								out.println("<a href='?page="+(currentPage+1)+"'>Next</a>");
							}
						%>
						</div>
					<%
				}catch(Exception e){
					System.out.println("접속 중 오류 발생" + e);
				}finally{
					try{
						if(rs!=null)rs.close();
						if(stmt!=null)stmt.close();
						if(conn!=null)conn.close();
					}catch(Exception ex){
						System.out.println("접속 해제 중 오류 발생"+ex);
					}
				}
			%>
		</div>
	</body>
</html>