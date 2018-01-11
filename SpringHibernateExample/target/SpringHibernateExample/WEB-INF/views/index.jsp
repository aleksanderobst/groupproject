<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "websystique";
    String userid = "myuser";
    String password = "mypassword";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

%>
<% if (request.getParameter("id") != null){
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "websystique";

    String userName = "myuser";


    Class.forName(driver).newInstance();

    Connection conn = DriverManager.getConnection(url + dbName, userName, password);
    Statement st = conn.createStatement();

    String zmienna =request.getParameter("id");

    st.executeUpdate("UPDATE pet SET active = NOT active WHERE ID=" + zmienna);
}
else {
    System.out.println("nic");
}
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
    <%
        try{
            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
            statement=connection.createStatement();
            String sql ="select * from pet where active = 'false'";
            resultSet = statement.executeQuery(sql);
            int i=0;
            while(resultSet.next()){
    %>
    <tr>
        <td><%=resultSet.getString("id") %></td>
        <td><%=resultSet.getString("name") %></td>
        <td><%=resultSet.getString("joiningDate") %></td>
        <td><a href="/new2?id=<%=resultSet.getString("id") %>"><button type="button" class="delete">Wykonano</button></a></td>
    </tr>
    <%
                i++;
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>

</body>
</html> 