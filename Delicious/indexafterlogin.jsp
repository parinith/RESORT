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

String name=request.getParameter("name");
session.setAttribute("name",name);
String date=request.getParameter("date");
String email=request.getParameter("email");
String time=request.getParameter("time");
String phone=request.getParameter("phone");
String people=request.getParameter("people");

String message=request.getParameter("message");


Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=latin1","root","password");
System.out.print("connected");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT id FROM resort");
long countLong = 0; 

for (; rs.next();) {
   countLong = rs.getLong(1);
}
int i=st.executeUpdate("insert into hotel values('"+countLong+"','"+name+"','"+date+"','"+email+"','"+time+"','"+phone+"','"+people+"','"+message+"')");

response.sendRedirect("../Payment.jsp");

%>
</body>
</html>