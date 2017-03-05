<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>All users</title>

  <%--<style>--%>
    <%--tr:first-child{--%>
      <%--font-weight: bold;--%>
      <%--background-color: #C6C9C4;--%>
    <%--}--%>
  <%--</style>--%>

</head>
  <body>
    <header></header>
    <main>
      <h2>List existing of Users</h2>
      <table>
        <tr>
            <td>Id</td><td>NAME</td><td>Created Date</td><td>Age</td><td>Admin</td><td></td>
        </tr>
        <c:forEach items="${users}" var="user">
          <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.createdDate}</td>
            <td>${user.age}</td>
            <td>${user.isAdmin}</td>

            <td><a href="<c:url value='/edit-${user.name}-user' />">Edit ${user.name}</a></td>
            <td><a href="<c:url value='/delete-${user.name}-user' />">delete</a></td>
          </tr>
        </c:forEach>
      </table>
      <br/>
      <a href="<c:url value='/new' />">Add new user</a>
    </main>
    <footer></footer>
  </body>
</html>
