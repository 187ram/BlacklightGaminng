<%-- 
    Document   : index
    Created on : 25-Nov-2020, 9:35:05 pm
    Author     : RAM
--%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
            String id = request.getParameter("userid");
            String driverName = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String dbName = "blacklight";
            String userId = "root";    
            String password = "";
            boolean numeric = true;

            try {
            Class.forName(driverName);
            } catch (ClassNotFoundException e) {
            e.printStackTrace();
            }

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            int flag = 0;
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
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blacklight</title>

    </head>
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
    <body>
        <div class="container" style="background-color: yellow;padding:20px 0px 0px 0px;">
            <h1 style="text-align: center; background-color: yellow">BLACKLIGHT PANEL</h1>
            <table class="myTable"style = "margin: auto;">                
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
                <td style="width:80%;  border-left: solid;">
                    <div class="myDiv">
                        <div>
                            <form  action ="index.jsp" method="post">
                                <table style = "margin: auto;">
                                    <div style = "padding:10px;">
                                        <tr>
                                            <td style="width:20%;height:41px;text-align: center;">
                                                Enter User Id&nbsp;&nbsp;&nbsp; 
                                            </td>
                                            <td style="width:50%;height:41px;text-align: center;">
                                                <input class="form-control" style="display: inline-block;width: 50%;"type="text" name ="userid">
                                                <button type="submit" class="btn btn-success">&nbsp;&nbsp;GO&nbsp;&nbsp;</button>
                                            </td>
                                        </tr>
                                    </div>
                                </table>
                                <hr style="height:2px;border-width:0;color:black;background-color:black">
                            </form>
                            
                            <%  
                                if(id != null && !id.isEmpty() && numeric ){
                                    try{
                                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                                    statement=connection.createStatement();
                          
                                    String sql ="SELECT * FROM blacklightuser WHERE id = '"+id+"'";
                                    resultSet = statement.executeQuery(sql);
						    %> 
                            <table class="" style="width:80%; margin: auto;border-style: solid;border-width: 1px; border-color: black;">
                                <%
                                 while(resultSet.next()){
                                 flag = 1;
                                %>

                                <tr>
                                    <td id = "tddata">User ID</td>
                                    <td id = "tdshow"><%=resultSet.getInt("id") %>
                                    </td>
                                </tr>
                                <tr>
                                <form method="post" action ="updateUser.jsp">
                                    <td id = "tddata">Name</td>
                                    <td id = "tdshow">
                                        <span style ="margin-left: 84px;">
                                            <%=resultSet.getString("name") %>
                                        </span>
                                        <input type="hidden" name="name" value=<%=resultSet.getString("name") %>>
                                        <input type="hidden" name="userid" value=<%=resultSet.getInt("id") %>>
                                        <button style="float:right;" type="submit" class="btn btn-success">UPDATE</button>
                                    </td>
                                </form>
                                </tr>
                                <tr>
                                    <td id = "tddata">Games Played</td>
                                    <td id = "tdshow"> <%=resultSet.getInt("gamesplayed") %></td>

                                </tr>
                                <tr>
                                    <td id = "tddata">Games Won</td>
                                    <td id = "tdshow"><%=resultSet.getInt("gameswon") %></td>
                                </tr>
                                <tr>
                                <form method="post" action ="matchData.jsp">
                                    <td id = "tddata">Last Game ID</td>
                                    <td  id = "tdshow">
                                        <span style ="margin-left: 118px;">
                                            <%=resultSet.getInt("lastgameid") %>
                                        </span>
                                        <input type="hidden" name="matchid" value=<%=resultSet.getInt("lastgameid") %>>
                                        <button style="float:right;" type="submit" class="btn btn-success">SEE DETAILS</button>
                                    </td>
                                </form>
                                </tr>
                                <% 
                                }
                            }   catch (SQLException se) {
                                } if(flag==0){   %>
                                <script>alert("Record Not Found");</script>
                                <%}}
                                %>
                            </table>
                        </div>
                    </div>
                </td>
            </table> 
        </div>     
    </body>
</html>

