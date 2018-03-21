<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<html>
    <head>
        <title>Create a Database using JSP</title>
    </head>
    <body>
        <h1>Create a Database using JSP</h1>
        <%
        Connection connection = null;
        String name=request.getParameter("name");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection("jdbc:mysql://localhost:8080/webEng", "mukul", "1504");
        out.println("Connection Established<p>");
        try{
            Statement st=connection.createStatement();
            String insert = "insert into users(name, username, email, password)"+
                                    "values('"+name+"','"+username+"','"+email+"','"+password+"')";
            out.println(insert+"<p>");
            int i=st.executeUpdate( insert);
            out.println("Insertion Done! <p>");
        }
        catch(Exception e){
            System.out.print(e);
            e.printStackTrace();
        }finally{
            connection.close();
        }
        %>
    </body>
</html>