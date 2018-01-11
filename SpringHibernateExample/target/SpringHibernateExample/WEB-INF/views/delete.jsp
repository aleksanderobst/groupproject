<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "websystique";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "myuser";
    String password = "mypassword";

    Class.forName(driver).newInstance();

    Connection conn = DriverManager.getConnection(url + dbName, userName, password);
    Statement st = conn.createStatement();

    String id =request.getParameter("id");

    st.executeUpdate("UPDATE pet SET active = NOT active WHERE ID=id");
%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body>
<h1>Retrieve data from database in jsp</h1>
<table border="1">
    <tr>
        <td>first name</td>
        <td>last name</td>
        <td>City name</td>
        <td>Email</td>
        <td>Action</td>
    </tr>



</table>
</body>
</html>