<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP List Users Records</title>
</head>
<body>
<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/websystique"
        user="myuser" password="mypassword"
/>

<sql:query var="listUsers"   dataSource="${myDS}">
    SELECT * FROM task;
</sql:query>

<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>Zadania wykonane</h2></caption>
        <tr>
            <th>id</th>
            <th>JOINING_DATE</th>
            <th>name</th>
            <th>text</th>
        </tr>
        <c:forEach var="task" items="${listUsers.rows}">
            <tr>
                <td><c:out value="${task.id}" /></td>
                <td><c:out value="${task.JOINING_DATE}" /></td>
                <td><c:out value="${task.name}" /></td>
                <td><c:out value="${task.text}" /></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>