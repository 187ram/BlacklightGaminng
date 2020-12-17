<%-- 
    Document   : execute-update
    Created on : 04-Dec-2020, 12:02:30 am
    Author     : RAM
--%>

<%@page import = "java.sql.*" %>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.Connection" %>
<%@page import = "java.sql.Statement" %>
<%@page import = "java.sql.ResultSet" %>

<%    
      String id = request.getParameter("userid");
      String name = request.getParameter("name");
      String driverName = "com.mysql.jdbc.Driver";
      String connectionUrl = "jdbc:mysql://localhost:3306/";
      String dbName = "blacklight";
      String userId = "root";    
      String password = "";
      boolean alpha = false;

     try{
        Class.forName(driverName);
        }catch(ClassNotFoundException e){
        e.printStackTrace();
        out.println(e);
        }
        
    if(name != null && !name.isEmpty()){
         try {
             int num = Integer.parseInt(name);
             } catch (NumberFormatException e) {
             alpha = true;
              %>
                    <script>alert("Enter Valid Name");</script>
              <%
             }}
        

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        if(name != null && !name.isEmpty() && alpha){
        try{
        connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        statement = connection.createStatement();
        String sql ="UPDATE blacklightuser SET name = '"+name+"' WHERE id = '"+id+"'";
        int result = statement.executeUpdate(sql);
        
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blacklight</title>
    </head>
    <body>
        <h1>Update User Name</h1>
            <%if(result>0){
                String redirectURL = "http://localhost:8080/Blacklight/index.jsp?userid="+id;
                response.sendRedirect(redirectURL);
                }else{
                    out.println("Record Not Updated");
                }
            }catch(SQLException ex){
        out.println(ex);
        }
        }
       %>
    </body>
</html>

