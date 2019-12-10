<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
String pwd=request.getParameter("pwd");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String dob=request.getParameter("dob");
String gender=request.getParameter("gender");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=latin1","root","password");
System.out.print("connected");
Statement st=con.createStatement();
ResultSet rs;
int i=st.executeUpdate("insert into first values('"+user+"','"+pwd+"','"+fname+"','"+lname+"','"+email+"','"+dob+"','"+gender+"')");

response.sendRedirect("log.html");

%>
<a href="log.html">LOGIN</a> 
<a href="index.html">HOME</a>
	
</body>
</html>