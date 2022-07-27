<%-- 
    Document   : registration
    Created on : May 4, 2022, 6:13:43 PM
    Author     : nicole
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="util.ConnectionToDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String message = "";
  String bgroud = "";
  ConnectionToDB connector = new ConnectionToDB();
  
  String nationalId = request.getParameter("nationalid");
  String firstname = request.getParameter("firstname");
  String lastname = request.getParameter("lastname");
  String gender = request.getParameter("gender");
  String location = request.getParameter("location");
  String date = request.getParameter("dateofbirth");
  
//  date conditions
  DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
  LocalDate DoB = LocalDate.parse(date, format);
  LocalDate todaydate = LocalDate.now();
  
  int age = todaydate.getYear() - DoB.getYear();
  System.out.println(age);
  if (age < 18) {
          message = "you need to get older enough to vote";
          bgroud = "pink";
      } else if(nationalId.length()!=16){
          message = "digits must be 16!";
          bgroud = "pink";
      
      } else if(firstname.length()<3 || lastname.length()<3){
      message = "the name must have atleast 3 digits";
      bgroud = "pink";
      
      } else {
          try {
                connector.getConnection();
                String Save = "INSERT INTO citizen (nationalId, firstname, lastname,sex,dateofbirth,location) VALUES (?,?,?,?,?,?);";
                
                connector.ps = connector.con.prepareCall(Save);
                
                connector.ps.setString(1, nationalId);
                connector.ps.setString(2, firstname);
                connector.ps.setString(3, lastname);
                connector.ps.setString(4, gender);
                connector.ps.setString(5, DoB.format(format));
                connector.ps.setString(6, location);
                
                int affectedRows = connector.ps.executeUpdate();
                if(affectedRows < 0){
                message = "register the citizen is unable";
                bgroud = "pink";
                } else{
                message ="registration successfully!";
                bgroud ="skyblue";
                }  
                
              } catch (Exception e) {
                 message = "register the citizen is unable : "+e.getMessage()+"";
                bgroud = "pink";
              } finally{
               connector.getDisconnection();
                 }
      }


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uwajeneza Nicole</title>
    </head>
    <body>
        <h1>Voting</h1>
        <br><br>
        <p style="background: <% out.println(bgroud); %>;" > <% out.println(message); %> </p>
    </body>
</html>
