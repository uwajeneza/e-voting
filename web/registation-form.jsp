<%-- 
    Document   : registation-form
    Created on : May 4, 2022, 4:43:22 PM
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
    <link rel="stylesheet" href="cssfile.css">
    <body>
    <center>
        <h1>E-vot Registation Form</h1>
        <div>
            <form action="registration.jsp" method="post">
                <label for="nationalid">National Id</label>
             <input type="text" id="nationalid" name="nationalid" placeholder="Your nationalid..">
             
             <label for="fname">First Name</label>
             <input type="text" id="fname" name="firstname" placeholder="Your name..">

             <label for="lname">Last Name</label>
             <input type="text" id="lname" name="lastname" placeholder="Your last name..">

             <label for="gender">Gender</label>
             <select id="gender" name="gender">
               <option value="female">Female</option>
               <option value="male">Male</option>
             </select>
             <label for="location">Location</label>
             <select id="location" name="location">
                <% 
//                    fench data in database
                ConnectionToDB connector = new ConnectionToDB();
                connector.getConnection();
                String get_data_in_db ="SELECT * FROM district";
                connector.s = connector.con.createStatement();
                connector.rs = connector.s.executeQuery(get_data_in_db);
                
                while (connector.rs.next()) {                        
                        out.print(" <option>"+connector.rs.getString("name") + "</option>");
                    }
                connector.getDisconnection();
                %>
             </select>
              <label for="dateofbirth">Date of Birth</label>
              <input type="date" id="dateofbirth" name="dateofbirth">


             <input type="submit" value="Save">
             <input type="reset" value="Reset">
             <a href="voting-list.jsp">Voting list</a>
           </form>
         </div>
    </center>

</body>

</html>
    </body>
</html>
