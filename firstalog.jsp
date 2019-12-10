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

String user=request.getParameter("usr");
session.setAttribute("userid",user);
String ph=request.getParameter("ph");
String email=request.getParameter("email");
String address=request.getParameter("address");
String ci=request.getParameter("ci");
String co=request.getParameter("co");
String adult=request.getParameter("adult");
String child=request.getParameter("child");
String message=request.getParameter("message");


Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=latin1","root","password");
System.out.print("connected");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT id FROM resort");
int id=100;
if(rs.last()){
id=rs.getInt("id")+1;
}
int i=st.executeUpdate("insert into resort values('"+id+"','"+user+"','"+ph+"','"+email+"','"+address+"','"+ci+"','"+co+"','"+adult+"','"+child+"','"+message+"')");

response.sendRedirect("roomalog.html");
%>
</body>
</html>