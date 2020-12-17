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
<%@page import="java.util.ArrayList"%>


<%
            String id = request.getParameter("matchid");
            String date = request.getParameter("matchtime");
            String user1 = request.getParameter("user1");
            String user2 = request.getParameter("user2");
            String winner = request.getParameter("winner");
       
            
      
            
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

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $( document ).ready(function(){
                var select1 = $( '#user1' );                
                var select2 = $( '#user2' );
                var select3 = $('#winner');
                var options = select2.find( 'option' );
                var u1 = '';
                var u2='';
                console.log(options);
                
                $('#user1').change(function() {
                        select2.html( options.not( '[value="' + $(this).val() + '"]' ));
                        u1 = $(this).val();
                        u2 = $('#user2').val();
                        select3.html( '<option value="'+u1+'">'+u1+'</option><option value="'+u2+'">'+u2+'</option>' );
                 } ).trigger( 'change' );
                 
                $('#user2').change(function() {
                        u2 = $('#user2').val();
                        u1 = $('#user1').val();
                        select3.html( '<option value="'+u2+'">'+u2+'</option><option value="'+u1+'">'+u1+'</option>' );
                 } ).trigger( 'change' );
                 
               });
            
        </script>
        <title>Blacklight New Registration</title>
        <style>
        .myDiv{
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
            <h1 style="text-align: center; background-color: yellow">New Match Entry</h1>
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
                    <table style ="width:75%;margin-bottom: 210px;margin-left: 115px;">
                    <div class="mydiv">
                    <form action="match-entry.jsp" method="post">
                        <tr>
                            <td id ="tddata">Match Id</td>
                            <td id="tdshow"><input class="form-control" style="display: inline-block;width: 50%;" type="text" name ="matchid" value="" ></td>
                        </tr>
                        <tr>
                            <td id ="tddata">Match Start Time</td>
                            <td id="tdshow"><input class="form-control" style="display: inline-block;width: 50%;" type="text" name ="matchtime" value="" ></td>
                        </tr>
                        <%
                        ArrayList<Integer> userList1 = new ArrayList<Integer>();
                        ArrayList<Integer> userList2 = new ArrayList<Integer>();
                        ArrayList<Integer> userWon = new ArrayList<Integer>();
                        try{
                      
                        connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                        statement=connection.createStatement();
                        String sql ="SELECT * FROM blacklightuser";
                        resultSet = statement.executeQuery(sql);
                        while(resultSet.next())
                        {
                        userList1.add(resultSet.getInt("id"));
                        userList2.add(resultSet.getInt("id"));
                        //userWon.add(resultSet.getInt("id"));
                        }
                        }catch(SQLException e){}
                        int size = userList1.size(); 
                        %>
                        <tr>
                            <td id ="tddata">USER 1</td>
                            <td id ="tddata">
                                <select class="form-control" style="display: inline-block;width: 50%;" name="user1" id="user1" style="">
                                    <%
                                    for (int i=0;i<size;i++) {
                                      int s = userList1.get(i);
                                    %>
                                    <option value="<%=s%>" ><%=s%></option>
                                    <%
                                    }
                                    %>
                                </select>
                
                                
                            </td>
                            
                        </tr>
                        <tr>
                            <td id ="tddata">USER 2</td>
                            <td id ="tddata">
                            <select class="form-control" style="display: inline-block;width: 50%;" name="user2" id="user2" >
                                <%
                                    for (int i=0;i<size;i++) {
                                      int s2 = userList2.get(i);
                                %>
                                    <option value="<%=s2%>" ><%=s2%></option>
                                    <%
                                    }
                                    %>
                                </select>
                            
                            
                            </td>
                        </tr>
                        <tr>
                            <td id ="tddata">Match Won</td>
                            <td id ="tddata">
                                <select class="form-control" style="display: inline-block;width: 50%;" name="winner" id="winner">

                                </select>
                            </td>
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
                    String sql ="SELECT * FROM blacklightmatch WHERE matchid = '"+id+"'";
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
                    String sqlInsert = "INSERT INTO `blacklight`.`blacklightmatch` (`matchid`, `matchstartime`, `player1`, `player2`,`matchwon`) VALUES ('"+id+"','"+date+"', '"+user1+"', '"+user2+"', '"+winner+"')";
                    int result = statement.executeUpdate(sqlInsert);
                    

                    String sqlUpdate1 = "update blacklightuser set gamesplayed=gamesplayed+1 WHERE id = '"+user1+"' ";
                    String sqlUpdate2 = "update blacklightuser set gamesplayed=gamesplayed+1 WHERE id = '"+user2+"'";
                    String sqlUpdate3 = "update blacklightuser set lastgameid='"+id+"' WHERE id = '"+user1+"'";
                    String sqlUpdate4 = "update blacklightuser set lastgameid='"+id+"' WHERE id = '"+user2+"'";
                    String sqlUpdate5 = "update blacklightuser set gameswon=gameswon+1 WHERE id = '"+winner+"'";
                    
                    int result1 = statement.executeUpdate(sqlUpdate1);
                    int result2 = statement.executeUpdate(sqlUpdate2);
                    int result3 = statement.executeUpdate(sqlUpdate3);
                    int result4 = statement.executeUpdate(sqlUpdate4);
                    int result5 = statement.executeUpdate(sqlUpdate5);
                    if(result > 0){
                    String redirectURL = "http://localhost:8080/Blacklight/matchData.jsp?matchid="+id;
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

