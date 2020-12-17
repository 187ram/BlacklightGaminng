<%-- 
    Document   : index
    Created on : 25-Nov-2020, 9:35:05 pm
    Author     : RAM
--%>


<%
            String id = request.getParameter("userid");
            String name = request.getParameter("name");
            
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
                    <div class="myDiv" style="padding-top:17px">
                        <table style ="width:75%;margin-top: 7px;margin: auto;">
                            <form  action ="execute-update.jsp" method="post">
                                <tr>
                                    <td style="width:20%;height:41px;text-align: center;">
                                                Enter User Name&nbsp; 
                                            </td>
                                            <td style="width:50%;height:41px;text-align: center;">
                                                <input type="hidden" name="userid" value="<%=id%>">
                                                <input class="form-control" style="display: inline-block;width: 50%;"type="text" name ="name" value="<%=name%>" >
                                                <button type="submit" class="btn btn-success">&nbsp;&nbsp;GO&nbsp;&nbsp;</button>
                                            </td>
                                        </tr>
                                    </form>
                        </table>
                                <hr style="height:2px;border-width:0;color:black;background-color:black">
                        
                        <table  style ="width:75%;margin-top: 7px;margin: auto;">
                                <tr>                
                                    <td id = "tddata">User ID</td>
                                    <td id = "tdshow"><%=id%></td>
                                </tr>
                                <tr>
                                    <td id = "tddata">Name</td>
                                    <td id = "tdshow"><%=request.getParameter("name") %></td>
                                </tr>
                        </table>     
                    </div>
                </td>
            </table>
        </div>
    </body>
</html>

