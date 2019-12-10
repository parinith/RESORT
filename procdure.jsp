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
ResultSet rss=st.executeQuery("SELECT id FROM resort");
long countLong = 0; 

for (; rss.next();) {
   countLong = rss.getLong(1);
}
ResultSet rs=st.executeQuery("call user.new_procedure1('"+countLong+"');");
%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<tr>
<th>UserName</th>


</tr>
<%
while(rs.next()) {
%>
<TR>
<TD><%=rs.getString(1)%></TD>

</TR>
<%
}
// close all the connections.
rs.close();

} catch (Exception ex) {

out.println("Unable  connect to database.");
}
%>
</TABLE>

</body>
<a href="end.html" class="button">HOME PAGE</a>
</html>