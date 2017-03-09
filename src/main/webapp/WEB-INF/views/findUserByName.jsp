<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>All users</title>

</head>
  <body>
    <header></header>
    <main>
        <h1>User details</h1>
      <table>
        <tr>
            <td>Id</td><td>NAME</td><td>Created Date</td><td>Age</td><td>Admin</td><td></td>
        </tr>

        <tr>
            <c:forEach items="${usersByName}" var="user">
          <tr>
          <td>${user.id}</td>
          <td>${user.name}</td>
          <td>${user.createdDate}</td>
          <td>${user.age}</td>
          <td>${user.isAdmin()}</td>

          <td><a href="<c:url value='/edit-${user.id}-user' />">Edit ${user.name}</a></td>
          <td><a href="<c:url value='/delete-${user.id}-user' />">Delete</a></td>
          </tr>
            </c:forEach>
        </tr>
      </table>
      <br/>
      <a href="<c:url value='/users/1' />">To all users</a>
    </main>
    <footer></footer>
  </body>
</html>
<%--Test field can remove--%>