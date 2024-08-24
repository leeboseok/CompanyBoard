<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>내가 쓴 글</title>
		<link rel="stylesheet" href="css/viewCreation.css">
	</head>
	<body>
		<div id="wrap">
			<div>
				<form id="menu" method="post" action="">
					<div data-action="create.jsp" id="btn1">create</div>
					<div data-action="editproposal.jsp" id="btn2">edit</div>
					<div data-action="progressmycreationsdelete.jsp" id="btn3">delete</div>
					<div data-action="main.jsp" id="btn4">main</div>
				</form>
			</div>
				<%
				int num = Integer.parseInt(request.getParameter("num"));
				session.setAttribute("selectedNum", num);
				Connection conn=null;
				Statement stmt=null;
				ResultSet rs=null;
				
				String url="jdbc:mysql://127.0.0.1:3306/fm_global";
				String db_id="root";
				String db_pw="iotiot";
				try{
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn=DriverManager.getConnection(url, db_id, db_pw);
					String sql="select p.title, p.summary, p.background, p.solution, p.financial, p.conclusion, p.documents,";
					sql+="m.email, m.fn, m.ln, m.photo, m.phone, m.job, m.location from proposals p join member m on p.author=m.num where p.num="+num;
					System.out.println(sql);
					stmt=conn.createStatement();
					rs=stmt.executeQuery(sql);
					if(rs.next()){
						String title=rs.getString("title");
						String ex=rs.getString("summary");
						String pro=rs.getString("background");
						String sol=rs.getString("solution");
						String fin=rs.getString("financial");
						String con=rs.getString("conclusion");
						String doc=rs.getString("documents");
						String email=rs.getString("email");
						String fnm=rs.getString("fn");
						String lnm=rs.getString("ln");
						String ph=rs.getString("photo");
						String phn=rs.getString("phone");
						String j=rs.getString("job");
						String lo=rs.getString("location");
			%>
						<div id="container">
							<div>
								<h1><%=title%></h1>
							</div>
							<div class="div_info">
								<p><%=fnm+" "+lnm%></p>
								<p><%=j+" "+lo%></p>
								<p><%=email+" "+phn%></p>
							</div>
							<div>
								<p><%=ex %></p>
								<p><%=pro %></p>
								<p><%=sol%></p>
								<p><%=fin %></p>
								<p><%=con %></p>
								<p><%=doc %></p>
							</div>
						</div>
						<%
					}else{
						%>
							<h1>해당 글을 찾을 수 없습니다.</h1>
						<%
					}
				}catch(Exception e){
					System.out.println("접속 중 로류 발생");
				}finally{
					try{
						if(rs!=null)rs.close();
						if(stmt!=null)stmt.close();
						if(conn!=null)conn.close();
					}catch(Exception ex){
						System.out.println("접속 해제 중 오류 발생: "+ ex);
					}
				}
			%>
		</div>
		<script>
			let menu = document.getElementById("menu");
			let btn = menu.getElementsByTagName("div");
	
			for(let i = 0; i < btn.length; i++){
			    btn[i].addEventListener("click", function(){
			        let action = btn[i].getAttribute("data-action");
			        if(action){
			        	menu.action = action;
			            menu.submit();
			        }
			    });
			};
		</script>
	</body>
</html>