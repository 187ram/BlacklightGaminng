<%-- 
    Document   : create-user
    Created on : 04-Dec-2020, 11:52:16 am
    Author     : RAM
--%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
            String id = request.getParameter("userid");
            String name = request.getParameter("name");
            String driverName = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String dbName = "blacklight";
            String userId = "root";    
            String password = "";
            boolean numeric = true;
            int flag = 0;

            try {
            Class.forName(driverName);
            } catch (ClassNotFoundException e) {
            e.printStackTrace();
            }

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
              
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blacklight New Registration</title>
        <style>
                .myDiv {
            height: 500px;
            background-color: lightgray;
        }


        .myTable {
            width: 100%;
        }
        p{
            text-align: center;
            color: cornflowerblue;
            margin-top: 15px;
            margin-bottom: 1rem;
        }
        #tddata{
            height:41px;
            width:30%;
            border-style: solid;
            border-width: 1px; 
            border-color: black;
            text-align: center;
        }
        #tdshow{
            height:41px;
            width:50%;
            border-style: solid;
            border-width: 1px; 
            border-color: black;
            text-align: center;
        }
        a:link{
            background-color: lightgray;
            color: blue;
            padding: 4px 4px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
          }
        a:visited {
            background-color: lightgray;
            border: 2px solid cornflowerblue;
            color: blue;
            padding: 4px 4px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
          }

        a:hover{
            background-color: blue;
            color: lightgray;
            
        }
        a:active{
            background-color: lightgray;
            border: 2px solid cornflowerblue;
            color: blue;
            padding: 4px 4px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }
        
        </style>
    </head>
    <body >
        <div class="container" style="background-color: yellow;padding:20px 0px 0px 0px;">
            <h1 style="text-align: center; background-color: yellow">New Registration</h1>
            <table class="myTable"style = "margin: auto;background-color: lightgray">
                <td style="width:20%;  border-right:solid; background-color: lightgray; ">
                    <p>
                        <a class="btn btn-primary"href="index.jsp" >User Details >></a>
                    </p>
                    <p>
                        <a class="btn btn-primary"href="matchData.jsp" >Match Details >></a>
                    </p>
                    <p>
                        <a class="btn btn-primary"href="create-user.jsp" >New Registration >></a>
                    </p>
                    <p>
                        <a class="btn btn-primary"href="match-entry.jsp" >Match Entry >></a>
                    </p>
                    <p style ="color: cornflowerblue; font-size: x-small;margin-top: 270px;" >Version 1.1</p>
                </td>
                <td style="width:80%;  border-right:solid; background-color: lightgray; ">
                    <table style ="width:75%;margin-bottom: 340px;margin-left: 115px;">
                    <div class="mydiv">
                    <form action="create-user.jsp" method="post">
                    <tr>
                        <td id ="tddata">User Id</td>
                        <td id="tdshow"><input class="form-control" style="display: inline-block;width: 50%;" type="text" name ="userid" value="" ></td>
                    </tr>
                    <tr>
                        <td id ="tddata">Name</td>
                        <td id ="tddata"><input class="form-control" style="display: inline-block;width: 50%;" type="text" name ="name" value="" ></td>
                    </tr>
                    <tr>
                        <td><button type="submit" class="btn btn-success" style="margin-top:8px">&nbsp;&nbsp;GO&nbsp;&nbsp;</button></td>
                    </tr>
                </form>
                <%
            if(id != null && !id.isEmpty()){
            try {
                int num = Integer.parseInt(id);
                } catch (NumberFormatException e) {
                numeric = false;
                %>
                    <script>alert("Enter User Id as Number");</script>
                <%
                }
               }
             
                try{
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="SELECT * FROM blacklightuser WHERE id = '"+id+"'";
                    resultSet = statement.executeQuery(sql);
                    while(resultSet.next()){
                        flag=1;
                        }
                    if(flag == 1){
                    %>
                    <script>alert("User Id Already Exist");</script>
                    <%
                    }
                   else{
                    //String sql ="INSERT INTO `blacklight`.`blacklightuser` (`id`, `name`, `gamesplayed`, `gameswon`, `lastgameid`) VALUES ('9999', 'Manish', '50', '35', '9444');'";
                    String sqlInsert = "INSERT INTO `blacklight`.`blacklightuser` (`id`, `name`, `gamesplayed`, `gameswon`, `lastgameid`) VALUES ('"+id+"', '"+name+"', '0', '0', '0')";
                    int result = statement.executeUpdate(sqlInsert);
                    
                    if(result > 0){
                    String redirectURL = "http://localhost:8080/Blacklight/index.jsp?userid="+id;
                    response.sendRedirect(redirectURL);
                    }else{
                    out.println("Record Not Updated");
                    }
                    }
                  

                    }catch (SQLException se){} 
                    %>
                  </div>
                  </table>
                </td>
            </table>
        </div>
    </body>
</html>
