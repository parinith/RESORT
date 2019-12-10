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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>

.table {
 width: 100%;
 max-width: 100%;
 margin-bottom: 1rem;
}
.table th,
.table td {
 padding: 0.75rem;
 vertical-align: top;
 border-top: 1px solid #eceeef;
}
.table thead th {
 vertical-align: bottom;
 border-bottom: 2px solid #eceeef;
}
.table tbody + tbody {
 border-top: 2px solid #eceeef;
}
.table .table {
 background-color: #fff;
}
.table-sm th,
.table-sm td {
 padding: 0.3rem;
}
.table-bordered {
 border: 1px solid #eceeef;
}
.table-bordered th,
.table-bordered td {
 border: 1px solid #eceeef;
}
.table-bordered thead th,
.table-bordered thead td {
 border-bottom-width: 2px;
}
.table-striped tbody tr:nth-of-type(odd) {
 background-color: rgba(0, 0, 0, 0.05);
}
.table-hover tbody tr:hover {
 background-color: rgba(0, 0, 0, 0.075);
}
.table-active,
.table-active > th,
.table-active > td {
 background-color: rgba(0, 0, 0, 0.075);
}
.table-hover .table-active:hover {
 background-color: rgba(0, 0, 0, 0.075);
}
.table-hover .table-active:hover > td,
.table-hover .table-active:hover > th {
 background-color: rgba(0, 0, 0, 0.075);
}
.table-success,
.table-success > th,
.table-success > td {
 background-color: #dff0d8;
}
.table-hover .table-success:hover {
 background-color: #d0e9c6;
}
.table-hover .table-success:hover > td,
.table-hover .table-success:hover > th {
 background-color: #d0e9c6;
}
.table-info,
.table-info > th,
.table-info > td {
 background-color: #d9edf7;
}
.table-hover .table-info:hover {
 background-color: #c4e3f3;
}
.table-hover .table-info:hover > td,
.table-hover .table-info:hover > th {
 background-color: #c4e3f3;
}
.table-warning,
.table-warning > th,
.table-warning > td {
 background-color: #fcf8e3;
}
.table-hover .table-warning:hover {
 background-color: #faf2cc;
}
.table-hover .table-warning:hover > td,
.table-hover .table-warning:hover > th {
 background-color: #faf2cc;
}
.table-danger,
.table-danger > th,
.table-danger > td {
 background-color: #f2dede;
}
.table-hover .table-danger:hover {
 background-color: #ebcccc;
}
.table-hover .table-danger:hover > td,
.table-hover .table-danger:hover > th {
 background-color: #ebcccc;
}
.thead-inverse th {
 color: #fff;
 background-color: #292b2c;
}
.thead-default th {
 color: #464a4c;
 background-color: #eceeef;
}
.table-inverse {
 color: #fff;
 background-color: #292b2c;
}
.table-inverse th,
.table-inverse td,
.table-inverse thead th {
 border-color: #fff;
}
.table-inverse.table-bordered {
 border: 0;
}
.table-responsive {
 display: block;
 width: 100%;
 overflow-x: auto;
 -ms-overflow-style: -ms-autohiding-scrollbar;
}
.table-responsive.table-bordered {
 border: 0;
}
</style>
<body>

<h1>TABELS BOOKED</h1>
<table border="1" class="table table-striped">
<tr>
<td>id</td>
<td>name</td>
<td>date</td>
<td>email</td>
<td>time</td>

<td>people</td>
<td>message</td>

</tr>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?autoReconnect=true&useSSL=false","root","password");
statement=connection.createStatement();
String sql ="select * from hotel";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name") %></td>

<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("time") %></td>
<td><%=resultSet.getString("people") %></td>
<td><%=resultSet.getString("message") %></td>

</tr>
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>

</html>