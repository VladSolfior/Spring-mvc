<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>User found by ID</title>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <%--Test field can remove--%>
</head>
  <body>
    <header></header>
    <main>
        <div class="container">
            <div class="row">
                <div class="col-sm-2"> </div>
                <div class="col-sm-8">
                    <h2 class="text-center text-muted">User found searching by ID</h2>

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

                            <c:if test="${user != null}">
                                <tbody>
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.name}</td>
                                    <td>${user.createdDate}</td>
                                    <td>${user.age}</td>
                                    <td>${user.isAdmin()}</td>

                                    <td>
                                        <a class="btn btn-warning" style="text-decoration: none!important;" href="<c:url value='/edit-${user.id}-user' />">Edit</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-danger" style="text-decoration: none!important;" href="<c:url value='/delete-${user.id}-user' />">Delete</a>
                                    </td>
                                </tr>
                                </tbody>

                            </c:if>
                            <c:if test="${user == null}">
                                <div class="well">
                                    message: ${notFound}
                                </div>
                            </c:if>


                        </table>
                    </div>
                    <a class="btn btn-default" href="<c:url value='/users/1' />">List of all users</a>
                </div>
                <div class="col-sm-2"> </div>
            </div>
        </div>
    </main>
    <footer></footer>
  </body>
</html>
<%--Test field can remove--%>