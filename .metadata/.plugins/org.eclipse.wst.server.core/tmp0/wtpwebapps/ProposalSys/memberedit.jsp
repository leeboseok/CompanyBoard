<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>회원정보 수정</title>
		<style>
			#wrap{
				margin:0 auto;
				width:1200px;
				border:3px solid black;
				padding:40px;
			}
			#wrap:after{
				content:"";
				display:block;
				clear:both;
			}
			span{
				display:inline-block;
				width:120px;
				padding:5px;
				font-size:20px;
			}
			table{
				display: flex; justify-content:center;
			}
			th, td{
				border:1px solid lightgray;
				padding:10px;
				font-size:small;
			}
			h1{
            	text-align:center;
            }
			#atag{
            	width: 100%; 
            	display: flex; 
            	justify-content:center;
            }
            a{
            	text-decoration:none;
            	font-size:600;
            	color:#450095;
            	padding:20px;
            }
            a:hover{
            	color:#ffbf3f;
            }
		</style>
	</head>
	<body>
		<div id="wrap">
			<form method="post" action="memberupdate.jsp">
				<span>User Number</span> 
				<span><input type="text" name="num"></span><br>
				<span>Email Address</span>
                <span><input type="email" name="email"></span><br>
                <span>Password</span>
                <span><input type="password" name="password"></span><br>
                <span>FirstName</span>
                <span><input type="text" name="FirstName"></span><br>
                <span>LastName</span>
                <span><input type="text" name="LastName"></span><br>
                <span>Photo</span>
                <span><input type="file" name="Photo"></span><br>
                <span>Phone</span>
                <span><input type="text" name="Phone" ></span><br>
                <span>Job</span>
                <span>
                    <select name="job">
                    	<option value="admin">Admin</option>
                        <option value="Engineering-Account Engineer">Engineering-Account Engineer</option>
                        <option value="Engineering-Engineering">Engineering-Engineering</option>
                        <option value="Engineering-Enterprise Service Delivery">Engineering-Enterprise Service Delivery</option>
                        <option value="Engineering-Field Engineer">Engineering-Field Engineer</option>
                        <option value="Engineering-Other">Engineering-Other</option>
                        <option value="Engineering-Quality Engineering/Audition">Engineering-Quality Engineering/Audition</option>
                        <option value="Engineering-Testing & Certification">Engineering-Testing and Certification</option>
                        <option value="Executive">Executive</option>
                    </select>
                </span><br>
                <span>Location</span>
                <span>
                	<select name="location">
                        <option value="United States - San Juan">United States - San Juan</option>
                        <option value="United States - California-Walnut Creek">United States - California-Walnut Creek</option>
                        <option value="United States - California-Woodlang Hills">United States - California-Woodlang Hills</option>
                        <option value="United States - Colorado-Denver">United States - Colorado-Denver</option>
                        <option value="United States - Connecticut-Burlington">United States - Connecticut-Burlington</option>
                        <option value="United States - Connecticut-Coventry">United States - Connecticut-Coventry</option>
                        <option value="United States - Connecticut-Newington">United States - Connecticut-Newington</option>
                        <option value="United States - Connecticut-Norwalk">United States - Connecticut-Norwalk</option>
                        <option value="United States - Georgia-Alpharetta">United States - Georgia-Alpharetta</option>
                        <option value="United States - Georgia-Rome">United States - Georgia-Rome</option>
                        <option value="United States - Illinois-Park Ridge">United States - Illinois-Park Ridge</option>
                        <option value="United States - Illinois-Peoria">United States - Illinois-Peoria</option>
                        <option value="United States - Indiana-Indianapolis">United States - Indiana-Indianapolis</option>
                        <option value="United States - Indiana-Merrillville">United States - Indiana-Merrillville</option>
                        <option value="United States - Indiana-South Bend">United States - Indiana-South Bend</option>
                        <option value="United States - lowa-Cedar Rapids">United States - lowa-Cedar Rapids</option>
                        <option value="United States - lowa-Davenport">United States - lowa-Davenport</option>
                        <option value="United States - lowa-Des Moines">United States - lowa-Des Moines</option>
                        <option value="United States - lowa-Sioux City">United States - lowa-Sioux City</option>
                        <option value="United states - Kansas-Topeka">United states - Kansas-Topeka</option>
                        <option value="United States - Kansas-Wichita">United States - Kansas-Wichita</option>
                        <option value="United States - Kentucky-Louisville">United States - Kentucky-Louisville</option>
                        <option value="United States - Maryland-Frederick">United States - Maryland-Frederick</option>
                        <option value="United States - Maryland-Gaithersburg">United States - Maryland-Gaithersburg</option>
                        <option value="United States - Massachusetts-Boston">United States - Massachusetts-Boston</option>
                        <option value="United States - Massachusetts-Norwood">United States - Massachusetts-Norwood</option>
                        <option value="United States - Massachusetts-Wakefield">United States - Massachusetts-Wakefield</option>
                        <option value="United States - Massachusetts-Waltham">United States - Massachusetts-Waltham</option>
                        <option value="United States - Michigan-Detroit">United States - Michigan-Detroit</option>
                        <option value="United States - Michigan-Grand Rapids">United States - Michigan-Grand Rapids</option>
                        <option value="United States - Michigan-Lansing">United States - Michigan-Lansing</option>
                        <option value="United States - Minnesota-Plymouth">United States - Minnesota-Plymouth</option>
                        <option value="United States - Missouri-Creve Coeur">United States - Missouri-Creve Coeur</option>
                        <option value="United States - Missouri-Kansas City">United States - Missouri-Kansas City</option>
                        <option value="United States - Missouri-St.Louis">United States - Missouri-St.Louis</option>
                        <option value="United States - Nebraska-Omaha">United States - Nebraska-Omaha</option>
                        <option value="United States - New Hampshire-Portsmouth">United States - New Hampshire-Portsmouth</option>
                        <option value="United States - New Jersey-Parsippany">United States - New Jersey-Parsippany</option>
                        <option value="United States - New York-Albany">United States - New York-Albany</option>
                        <option value="United States - New York-Rochester">United States - New York-Rochester</option>
                        <option value="United States - Ohio-Cincinnati">United States - Ohio-Cincinnati</option>
                        <option value="United States - Ohio-Cleveland">United States - Ohio-Cleveland</option>
                        <option value="United States - Ohio-North Olmsted">United States - Ohio-North Olmsted</option>
                        <option value="United States - Ohio-Toledo">United States - Ohio-Toledo</option>
                        <option value="United States - Oregon-Portland">United States - Oregon-Portland</option>
                        <option value="United States - Pennsylvania-Harrisburg">United States - Pennsylvania-Harrisburg</option>
                        <option value="United States - Pennsylvania-Malvern">United States - Pennsylvania-Malvern</option>
                        <option value="United States - Pennsylvania-York">United States - Pennsylvania-York</option>
                        <option value="United States - Rhode Island-Providence">United States - Rhode Island-Providence</option>
                        <option value="United States - Rhode Island-West Glocester">United States - Rhode Island-West Glocester</option>
                        <option value="United States - South Dakota-Sioux Falls">United States - South Dakota-Sioux Falls</option>
                        <option value="United States - Texas-Frisco">United States - Texas-Frisco</option>
                        <option value="United States - Houston">United States - Houston</option>
                        <option value="United States - Virginia-Reston">United States - Virginia-Reston</option>
                        <option value="United States - Virginia-Roanoke">United States - Virginia-Roanoke</option>
                        <option value="United States - Washington-Bellevue">United States - Washington-Bellevue</option>
                        <option value="United States - Wisconsin-Green Bay">United States - Wisconsin-Green Bay</option>
                        <option value="United States - Wisconsin-Madison">United States - Wisconsin-Madison</option>
                        <option value="United States - Wisconsin-Milwaukee">United States - Wisconsin-Milwaukee</option>
                        <option value="Argentina">Argentina</option>
                        <option value="Australia-New South Wales-Sydney">Australia-New South Wales-Sydney</option>
                        <option value="Australia-Queensland-Brisbane">Australia-Queensland-Brisbane</option>
                        <option value="Australia-Victoria-Melbourne">Australia-Victoria-Melbourne</option>
                        <option value="Austria">Austria</option>
                        <option value="Belgium-Brussels">Belgium-Brussels</option>
                        <option value="Belgium-Debroux">Belgium-Debroux</option>
                        <option value="Belgium-Brussels-Capital Region-Brussels">Belgium-Brussels-Capital Region-Brussels</option>
                        <option value="Brazil-Sao Paulo-Sao Paulo">Brazil-Sao Paulo-Sao Paulo</option>
                        <option value="Brazil-Sao Paulo-Vila Olimpia">Brazil-Sao Paulo-Vila Olimpia</option>
                        <option value="Canada-Alberta">Canada-Alberta</option>
                        <option value="Canada-British Columbia-Vancouver">Canada-British Columbia-Vancouver</option>
                        <option value="Canada-Manitoba-Winnipeg">Canada-Manitoba-Winnipeg</option>
                        <option value="Canada-Nova Scotia-Halifax">Canada-Nova Scotia-Halifax</option>
                        <option value="Canada-Ontario-Thornhill">Canada-Ontario-Thornhill</option>
                        <option value="Canada-Ontario-Vaughan">Canada-Ontario-Vaughan</option>
                        <option value="Canada-Quebec-Montreal">Canada-Quebec-Montreal</option>
                        <option value="Chile">Chile</option>
                        <option value="Chile-Region Metropolitana de Santiago">Chile-Region Metropolitana de Santiago</option>
                        <option value="China-Beijing">China-Beijing</option>
                        <option value="China-Shanghai">China-Shanghai</option>
                        <option Value="Colombia-Bogota">Colombia-Bogota</option>
                        <option value="Colombia">Colombia</option>
                        <option value="Czech Republic">Czech Republic</option>
                        <option value="Denmark">Denmark</option>
                        <option value="Egypt">Egypt</option>
                        <option value="Finland">Finland</option>
                        <option value="France-Metz-Tessy">France-Metz-Tessy</option>
                        <option value="France-Paris La Defense Cedex">France-Paris La Defense Cedex</option>
                        <option value="France-Paris">France-Paris</option>
                        <option value="France-Haute-Savoie-Mety-Tessy">France-Haute-Savoie-Mety-Tessy</option>
                        <option value="Germany-Frankfurt">Germany-Frankfurt</option>
                        <option value="Hong Kong-Mongkok">Hong Kong-Mongkok</option>
                        <option value="Hungary">Hungary</option>
                        <option value="India-Karnataka-Bangalulu">India-Karnataka-Bangalulu</option>
                        <option value="Ireland">Ireland</option>
                        <option value="Ireland-Dublin">Ireland-Dublin</option>
                        <option value="Italy-Milano">Italy-Milano</option>
                        <option value="Japan-Kanagawa-Yokohama">Japan-Kanagawa-Yokohama</option>
                        <option value="South Korea-Seoul">South Korea-Seoul</option>
                        <option value="Luxembourg">Luxembourg</option>
                        <option value="Malaysia-Kuala Kumpur">Malaysia-Kuala Kumpur</option>
                        <option value="Mexico-Nuevo Leon-Monterrey">Mexico-Nuevo Leon-Monterrey</option>
                        <option value="Mexico-Nuevo Leon-San Pedro">Mexico-Nuevo Leon-San Pedro</option>
                        <option value="Mexico-Nuevo Leon-San Pedro Garza Garcia">Mexico-Nuevo Leon-San Pedro Garza Garcia</option>
                        <option value="Netherlands-Amsterdam">Netherlands-Amsterdam</option>
                        <option value="New Zealand">New Zealand</option>
                        <option value="Philippines-Quezon City,Metro Manilla">Philippines-Quezon City,Metro Manilla</option>
                        <option value="Poland">Poland</option>
                        <option value="Portugal">Portugal</option>
                        <option value="Romania">Romania</option>
                        <option value="Russia-Moscow">Russia-Moscow</option>
                        <option value="Singapore">Singapore</option>
                        <option value="Slovakia">Slovakia</option>
                        <option value="South Africa-Johannesburg">South Africa-Johannesburg</option>
                        <option value="Spain-Madrid">Spain-Madrid</option>
                        <option value="Sweden-Stockholm">Sweden-Stockholm</option>
                        <option value="Switzerland-Bern">Switzerland-Bern</option>
                        <option value="Switzerland">Switzerland</option>
                        <option value="Thailand">Thailand</option>
                        <option value="Turkey-Atasehir">Turkey-Atasehir</option>
                        <option value="United Arab Emirates-Abu Dhabi">United Arab Emirates-Abu Dhabi</option>
                        <option value="United Kingdom-London">United Kingdom-London</option>
                        <option value="United Kingdom-Maidenhead">United Kingdom-Maidenhead</option>
                        <option value="United Kingdom-Manchester">United Kingdom-Manchester</option>
                        <option value="United Kingdom-Windsor and maidenhead-Windsor">United Kingdom-Windsor and maidenhead-Windsor</option>
                        <option value="Vietnam">Vietnam</option>
                    </select>
                   </span><br>
				<div><input type="submit" value="수정"></div>
			</form>
		<%
			request.setCharacterEncoding("utf-8");
			Connection conn=null;
			Statement stmt=null;
			ResultSet rs=null;
			
			String url="jdbc:mysql://127.0.0.1:3306/fm_global";
			String db_id="root";
			String db_pw="iotiot";
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url, db_id, db_pw);
				String sql="select * from member;";
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				%>
				<h1>User List</h1>
				<table>
					<tr>
						<th>Num</th>
			            <th>Email</th>
			            <th>Password</th>
			            <th>FirstName</th>
			            <th>LastName</th>
			            <th>Photo</th>
			            <th>Phone</th>
			            <th>Job</th>
			            <th>Location</th>
					</tr>
				<%
				while(rs.next()){
					String num=rs.getString("num");
					String email=rs.getString("email");
					String pass=rs.getString("pw");
					String fn=rs.getString("fn");
					String ln=rs.getString("ln");
					String photo=rs.getString("photo");
					String phone=rs.getString("phone");
					String job=rs.getString("job");
					String lo=rs.getString("location");
					%>
						<tr>
							<td><%=num %></td>
							<td><%=email %></td>
							<td><%=pass %></td>
							<td><%=fn %></td>
							<td><%=ln %></td>
							<td><%=photo %></td>
							<td><%=phone %></td>
							<td><%=job %></td>
							<td><%=lo %></td>
							<td>
								<form method="post" action="deleteprogress.jsp">
									<input type="hidden" value="<%=email %>" name="email">
									<input type="submit" value="delete">
								</form>
							</td>
						</tr>
					<%
				}
				%>
				</table>
					<div id="atag"><a href="main.jsp">Go to the Main page</a></div>
				<%
			}catch(Exception e){
				System.out.println("memberedit.jsp 접속 중 오류 발생 :"+e);
			}finally{
				try{
					if(rs!=null)rs.close();
					if(stmt!=null)rs.close();
					if(conn!=null)rs.close();
				}catch(Exception ex){
					System.out.println("edit.jsp 접속 해제중 오류 발생 :"+ex);
				}
			}
		%>
		</div>
	</body>
</html>