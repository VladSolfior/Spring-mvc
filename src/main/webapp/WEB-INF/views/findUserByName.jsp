<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Users found by name</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
  <body>
    <header></header>
    <main>
        <div class="container">
            <div class="row">
                <div class="col-sm-2"> </div>
                <div class="col-sm-8">
                    <h2 class="text-center text-muted">Users found searching by name</h2>

                    <div class="table-responsive">

                        <table class="table table-hover table-condensed">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Created date</th>
                                <th>Age</th>
                                <th>Is admin</th>
                                <td></td>
                            </tr>
                            </thead>

                            <c:forEach items="${usersByName}" var="user">
                                <tbody>
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.name}</td>
                                    <td>${user.createdDate}</td>
                                    <td>${user.age}</td>
                                    <td>${user.isAdmin()}</td>

                                    <td>
                                        <a class="btn btn-warning" style="text-decoration: none!important;" href="<c:url value='/edit-${user.id}-user' />">Edit ${user.name}</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-danger" style="text-decoration: none!important;" href="<c:url value='/delete-${user.id}-user' />">Delete</a>
                                    </td>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                    <a class="btn btn-info" href="<c:url value='/users/1' />">List of all users</a>
                </div>
                <div class="col-sm-2"> </div>
            </div>
        </div>
    </main>
    <footer></footer>
  </body>
</html>