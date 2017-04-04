<%--
  Created by IntelliJ IDEA.
  User: kkata
  Date: 03.04.2017
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>

<table border="1">
    <thead>
    <tr>
        <th>meno</th>
        <th>dátum narodenia</th>
        <th>telefónne číslo</th>
    </tr>
    </thead>
    <c:forEach items="${guests}" var="guest">
        <tr>
            <td><c:out value="${guest.name}"/></td>
            <td><c:out value="${guest.dateOfBirth}"/></td>
            <td><c:out value="${guest.phoneNumber}"/></td>
            <td><form method="post" action="${pageContext.request.contextPath}/guests/delete?id=${guest.id}"
                      style="margin-bottom: 0;"><input type="submit" value="Zmatať"></form></td>
        </tr>
    </c:forEach>
</table>

<h2>Zadajte hosťa</h2>
<c:if test="${not empty chyba}">
    <div style="border: solid 1px red; background-color: yellow; padding: 10px">
        <c:out value="${chyba}"/>
    </div>
</c:if>
<form action="${pageContext.request.contextPath}/guests/add" method="post">
    <table>
        <tr>
            <th>Meno hosťa:</th>
            <td><input type="text" name="name" value="<c:out value='${param.name}'/>"/></td>
        </tr>
        <tr>
            <th>dátum narodenia:</th>
            <td><input type="text" name="dateOfBirth" value="<c:out value='${param.dateOfBirth}'/>"/></td>
        </tr>
        <tr>
            <th>telefónne číslo:</th>
            <td><input type="text" name="phoneNumber" value="<c:out value='${param.phoneNumber}'/>"/></td>
        </tr>
    </table>
    <input type="Submit" value="Zadať" />
</form>

</body>
</html>
</html>
