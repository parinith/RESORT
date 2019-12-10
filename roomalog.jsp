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

<%



String room=request.getParameter("room");
String type=request.getParameter("type");
String adult=request.getParameter("adult");
String child=request.getParameter("child");

String em ;
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=latin1","root","password");
System.out.print("connected");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT id FROM resort");
long countLong = 0; 

for (; rs.next();) {
   countLong = rs.getLong(1);
}
int i=st.executeUpdate("insert into room values('"+countLong+"','"+room+"','"+type+"','"+adult+"','"+child+"')");

response.sendRedirect("Delicious/indexafterlogin.html");
%>
</body>
</html>