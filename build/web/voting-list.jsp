<%-- 
    Document   : voting-list
    Created on : May 4, 2022, 5:08:10 PM
    Author     : nicole
--%>

<%@page import="util.ConnectionToDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <center>
    <body>
        <h1>Voting List</h1>
        <table>
            <caption>Voting list</caption>
            <thead>
              <tr>
                <th scope="col">citizen</th>
                <th scope="col">Nationa id</th>
                <th scope="col">Location</th>
                <th scope="col">DoB</th>
                <th scope="col">Age</th>
              </tr>
            </thead>
            <tbody>
                <% 
                String message = "";
                String bgroud = "";
                ConnectionToDB connector = new ConnectionToDB();
                try {
                    String get_data_in_db ="SELECT * FROM district";
                    connector.s = connector.con.createStatement();
                    connector.rs = connector.s.executeQuery(get_data_in_db);

                    while (connector.rs.next()) {
                        String firstname = connector.rs.getString("firstName");
                    }                        

                    } catch (Exception e) {
                    }

                %>
            </tbody>
          </table>
        </center>
    </body>
    
</html>
