<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

      <%
      javax.sql.DataSource ds = InitialContext.doLookup("java:comp/env/jdbc/javaweb");
      java.sql.Connection conn = ds.getConnection();
      %>

      <h1><%= conn.getCatalog() %></h1>

</body>
</html>