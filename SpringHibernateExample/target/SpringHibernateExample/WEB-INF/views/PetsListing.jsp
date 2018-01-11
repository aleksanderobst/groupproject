<%@ page contentType="text/html; charset=iso-8859-2" language="java"
         import="java.sql.*" errorPage="" %>
<%
    request.setCharacterEncoding("8859_2");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>" />
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Zadania</title>

    <style>
        #demotext {
            background: #A4BEE6;
            color: white;
            text-shadow: 0 1px 0 #ccc, 0 2px 0 #c9c9c9, 0 3px 0 #bbb, 0 4px 0 #b9b9b9, 0 5px 0 #aaa, 0 6px 1px rgba(0,0,0,.1), 0 0 5px rgba(0,0,0,.1), 0 1px 3px rgba(0,0,0,.3), 0 3px 5px rgba(0,0,0,.2), 0 5px 10px rgba(0,0,0,.25), 0 10px 10px rgba(0,0,0,.2), 0 20px 20px rgba(0,0,0,.15);
        }
        #demotext2 {
            background: #A4BEE6;
            color: white;
            text-shadow: 0 1px 0 #ccc, 0 2px 0 #c9c9c9, 0 3px 0 #bbb, 0 4px 0 #b9b9b9, 0 5px 0 #aaa, 0 6px 1px rgba(0,0,0,.1), 0 0 5px rgba(0,0,0,.1), 0 1px 3px rgba(0,0,0,.3), 0 3px 5px rgba(0,0,0,.2), 0 5px 10px rgba(0,0,0,.25), 0 10px 10px rgba(0,0,0,.2), 0 20px 20px rgba(0,0,0,.15);
        }
        div.blueTable {
            border: 1px solid #1C6EA4;
            background-color: #A4BEE6;
            width: 100%;
            text-align: left;
            border-collapse: collapse;
        }
        .divTable.blueTable .divTableCell, .divTable.blueTable .divTableHead {
            border: 1px solid #AAAAAA;
            padding: 3px 2px;
        }
        .divTable.blueTable .divTableBody .divTableCell {
            font-size: 13px;
            color: #333333;
            vertical-align:top;
            margin: 5px;
        }
        .divTable.blueTable .divTableRow:nth-child(even) {
            background: #D0E4F5;
        }
        .divTable.blueTable .divTableHeading {
            background: #693AA4;
            background: -moz-linear-gradient(top, #614ab2 0%, #4126a3 66%, #2C0E99 100%);
            background: -webkit-linear-gradient(top, #614ab2 0%, #4126a3 66%, #2C0E99 100%);
            background: linear-gradient(to bottom, #614ab2 0%, #4126a3 66%, #2C0E99 100%);
            border-bottom: 2px solid #444444;
        }
        .divTable.blueTable .divTableHeading .divTableHead {
            font-size: 15px;
            font-weight: bold;
            color: #FFFDE3;
            border-left: 2px solid #D0E4F5;
        }
        .divTable.blueTable .divTableHeading .divTableHead:first-child {
            border-left: none;
        }

        .blueTable .tableFootStyle {
            font-size: 14px;
        }
        .blueTable .tableFootStyle .links {
            text-align: right;
        }
        .blueTable .tableFootStyle .links a{
            display: inline-block;
            background: #1C6EA4;
            color: #FFFFFF;
            padding: 2px 8px;
            border-radius: 5px;
        }
        .blueTable.outerTableFooter {
            border-top: none;
        }
        .blueTable.outerTableFooter .tableFootStyle {
            padding: 3px 5px;
        }
        /* DivTable.com */
        .divTable{ display: table; }
        .divTableRow { display: table-row; }
        .divTableHeading { display: table-header-group;}
        .divTableCell, .divTableHead {
            display: table-cell;}
        .divTableHeading { display: table-header-group;}
        .divTableFoot { display: table-footer-group;}
        .divTableBody { display: table-row-group;}
    </style>

</head>


<body>
<div class="container">
<div class="divTable blueTable">
    <div class="divTableHeading">
        <div class="divTableRow">
            <div class="divTableHead"> <img src="https://i.imgur.com/OYKtzIc.png" alt="dogs logo" height="100" width="150"> </div>
            <div class="divTableHead"></div>
            <div class="divTableHead"></div>

        </div>
    </div>

    <div class="divTableBody">
        <div class="divTableRow">
            <div class="divTableCell">
                <br><br><br>
                <a href="<c:url value='/new' />"><button type="button" class="delete">Dodaj nowe zadanie</button></a>
                <br>
                <a href="<c:url value='/' />"><button type="button" class="delete">Odswie¿</button></a>

            </div>
            <div class="divTableCell">

                <table class="table table-striped">
                    <tbody>
                    <tr>
                        <td>
                            <div id="demotext"><center><h2>Lista zadan wykonanych</h2></center></div>


                            <table  class="table table-striped" border="1">
                                <tr>
                                    <td>Tytu³</td><td>Tre¶æ</td><td>Termin wykonania</td>
                                </tr>
                                <c:forEach items="${pets}" var="pet">
                                    <tr>
                                        <c:choose>
                                            <c:when test="${pet.active=='true'}">
                                                <td>${pet.name}</td>
                                                <td>${pet.text}</td>
                                                <td>${pet.joiningDate}</td>


                                            </c:when>

                                        </c:choose>
                            </td>

                                    </tr>
                                </c:forEach>
                            </table>
            </div>

            <div class="divTableCell">
                <td>
                    <div id="demotext2"><center><h2>Lista zadan niewykonanych</h2></center></div>



                    <table class="table table-striped">
                        <tbody>
                        <tr>
                            <td><table border="1" class="table table-striped">
                                <tr>
                                    <td>Tytu³</td><td>Tre¶æ</td><td>Termin wykonania</td>
                                </tr>
                                <c:forEach items="${pets}" var="pet">
                                    <tr>
                                        <c:choose>
                                            <c:when test="${pet.active=='false'}">
                                                <td>${pet.name}</td>
                                                <td>${pet.text}</td>
                                                <td>${pet.joiningDate}</td>
                                            </c:when>

                                        </c:choose>


                                    </tr>
                                </c:forEach>
                            </table></td>


                            <td><table border="1" class="table table-striped">
                                <tr>


                                    <td>Zadanie</td>
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



                                    <td><a href="/?id=<%=resultSet.getString("id") %>"><button type="button" class="delete">Wykonano</button></a></td>
                                </tr>
                                <%
                                            i++;
                                        }
                                        connection.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </table></td>
                        </tr>
                        </tbody>
                    </table></td>
                </tr>
                </tbody></table>
            </div>


        </div>
    </div>


<br/>

</div>
</body>
</html>