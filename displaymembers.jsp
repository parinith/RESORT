<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="table/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="table/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="table/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="table/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="table/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="table/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="table/css/util.css">
	<link rel="stylesheet" type="text/css" href="table/css/main.css">
<!--===============================================================================================-->
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<body>
 <div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
<h1>Customer In Our Hotel</h1>
<table >
<tr bgcolor="00c5ff" class="row100 head">
<td width="50%" bgcolor="00c5ff" class="cell100 column1"><h5>user</h5></td>
<td bgcolor="00c5ff" class="cell100 column1"><h5>phone</h5></td>
<td bgcolor="00c5ff" class="cell100 column1"><h5>email</h5></td>
<td bgcolor="00c5ff" class="cell100 column1"><h5>address</h5></td>
<td bgcolor="00c5ff" class="cell100 column1"><h5>checking</h5></td>
<td bgcolor="00c5ff" class="cell100 column1"><h5>checkout</h5></td>
<td bgcolor="00c5ff" class="cell100 column1"><h5>adult</h5></td>
<td bgcolor="00c5ff" class="cell100 column1"><h5>child</h5></td>
<td bgcolor="00c5ff" class="cell100 column1"><h5>message</h5></td>
<td bgcolor="00c5ff" class="cell100 column1"><h5>Action</h5></td>
</tr>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?autoReconnect=true&useSSL=false","root","password");
statement=connection.createStatement();
String sql ="select * from resort";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>

<div class="table100-body js-pscroll">
						<table>
							<tbody>
<tr width="50%" class="row100 body">
<td width="5%" class="cell100 column1"><%=resultSet.getString("user") %></td>
<td class="cell100 column1"><%=resultSet.getString("phone") %></td>

<td class="cell100 column1"><%=resultSet.getString("email") %></td>

<td class="cell100 column1"><%=resultSet.getString("address") %></td>
<td class="cell100 column1"><%=resultSet.getString("check in") %></td>

<td class="cell100 column1"><%=resultSet.getString("check out") %></td>
<td class="cell100 column1"><%=resultSet.getString("adult") %></td>

<td class="cell100 column1"><%=resultSet.getString("child") %></td>

<td class="cell100 column1"><%=resultSet.getString("message") %></td>
<td><a href="delstudent.jsp?id=<%=resultSet.getString("id") %>"><button type="button" class="delete">Delete</button></a></td>
</tr>
	</tbody>
						</table>
					</div>
				</div>
				</div>
				</div>
				</div>
				
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<a href="end.html" class="button">HOME PAGE</a>
</body>

</html>