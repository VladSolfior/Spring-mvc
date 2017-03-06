<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>User register</title>

  <style>

    .error {
      color: #ff0000;
    }
  </style>

</head>
  <body>
    <header></header>
    <main>
        <h2>Registration Form</h2>
        <form:form method="POST" modelAttribute="user">
            <form:input type="hidden" path="id" id="id"/>
            <table>
                <tr>
                    <td><label for="name">Name: </label> </td>
                    <td><form:input path="name" id="name"/></td>
                    <td><form:errors path="name" cssClass="error"/></td>
                </tr>

                <tr>
                    <td><label for="createdDate">Created date: </label> </td>
                    <td><form:input path="createdDate" id="createdDate"/></td>
                    <td><form:errors path="createdDate" cssClass="error"/></td>
                </tr>

                <tr>
                    <td><label for="age">Age: </label> </td>
                    <td><form:input path="age" id="age"/></td>
                    <td><form:errors path="age" cssClass="error"/></td>
                </tr>

                <tr>
                    <td><label for="admin">User is admin: </label> </td>
                    <td><form:input path="admin" /></td>
                    <td><form:errors path="admin" cssClass="error"/></td>
                </tr>

                <tr>
                    <td colspan="3">
                        <c:choose>
                            <c:when test="${edit}">
                                <input type="submit" value="Update"/>
                            </c:when>
                            <c:otherwise>
                                <input type="submit" value="Register"/>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </table>
        </form:form>

        Go back to <a href="<c:url value='/list' />">List of all users</a>
    </main>
    <footer></footer>
  </body>
</html>
