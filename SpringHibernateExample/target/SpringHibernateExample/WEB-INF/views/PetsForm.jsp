<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Dodawanie zadania</title>

    <style>

        .error {
            color: #ff0000;
        }
    </style>

</head>

<body>

<h2>Dodaj zadanie</h2>

<form:form method="POST" modelAttribute="pet">
    <form:input type="hidden" path="id" id="id"/>
    <table>
        <tr>
            <td><label for="name">Tytul: </label> </td>
            <td><form:input path="name" id="name"/></td>
            <td><form:errors path="name" cssClass="error"/></td>
        </tr>
        <tr>
            <td><label for="joiningDate">Data: </label> </td>
            <td><form:input path="joiningDate" id="joiningDate"/></td>
            <td><form:errors path="joiningDate" cssClass="error"/></td>
        </tr>

        <tr>
            <td><label for="text">Tekst:  </label> </td>
            <td><form:input path="text" id="text"/></td>
            <td><form:errors path="text" cssClass="error"/></td>
        </tr>

        <tr>
            <td><label for="active">Zrobione:  </label> </td>
            <td><form:input  value="false" path="active" id="active"/></td>
            <td><form:errors path="active" cssClass="error"/></td>
        </tr>








        <tr>
            <td colspan="3">
                <c:choose>
                    <c:when test="${edit}">
                        <input type="submit" value="Update"/>
                    </c:when>
                    <c:otherwise>
                        <input type="submit" value="Dodaj"/>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </table>
</form:form>
<br/>
<br/>
</body>
</html>
<br/>
<br/>

</body>
</html>