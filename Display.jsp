<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@ page import="java.io.*" %> 
<%
try {
String userid=request.getParameter("usr");
session.setAttribute("userid",userid);
String pwd=request.getParameter("pwd");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=latin1","root","password");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT * from first;");
%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<tr>
<th>UserName</th>
<th>FirstName</th>
<th>LastName</th>
<th>Email</th>
<th>DateOfBirth</th>
<th>Gender</th>
</tr>
<%
while(rs.next()) {
%>
<TR>
<TD><%=rs.getString(1)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>
<TD><%=rs.getString(5)%></TD>
<TD><%=rs.getString(6)%></TD>
<TD><%=rs.getString(7)%></TD>
</TR>
<%
}
// close all the connections.
rs.close();
} catch (Exception ex) {

out.println("Unable to connect to database.");
}
%>
</TABLE>

</body>
<a href="end.html" class="button">HOME PAGE</a>
</html>