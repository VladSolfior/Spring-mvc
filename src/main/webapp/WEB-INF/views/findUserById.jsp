<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Find users by ID</title>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <%--Test field can remove--%>
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
          <td>${user.id}</td>
          <td>${user.name}</td>
          <td>${user.createdDate}</td>
          <td>${user.age}</td>
          <td>${user.isAdmin()}</td>

          <td><a href="<c:url value='/edit-${user.name}-user' />">Edit ${user.name}</a></td>
          <td><a href="<c:url value='/delete-${user.name}-user' />">Delete</a></td>
        </tr>
      </table>
      <br/>
      <a href="<c:url value='/list' />">To all users</a>
    </main>
    <footer></footer>
  </body>
</html>
<%--Test field can remove--%>