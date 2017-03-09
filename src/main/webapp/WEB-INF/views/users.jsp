<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Paged users</title>
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

                    <h2 class="text-muted text-center">List of existing of Users</h2>

                    <div class="table-responsive">
                        <c:if test="${!empty listUsers}">
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

                                <c:forEach items="${listUsers.pageList}" var="user">
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

                            <nav>
                                <ul class="pager">

                                    <li><a href=${listUsers.page - 1>0?listUsers.page:1}>Previous</a></li>

                                        ${listUsers.nextPage()}

                                    <li><a href=${listUsers.page + 1}>Next</a></li>
                                </ul>
                            </nav>

                        </c:if>
                    </div>

                </div>
                <div class="col-sm-2"> </div>
            </div>


            <div class="container row text-center">
                <a class="btn btn-default" href="<c:url value='/new' />">Add new user</a>
            </div>

            <div class="container row">
                <div class="col-sm-4"> </div>

                <div class="col-sm-4">
                    <h3 class="text-muted text-center">Search users by name</h3>

                    <form method="POST" action="/findUserByName/" accept-charset="UTF-8">
                        <div class="form-group form-horizontal">
                            <label for="name">Name:</label>
                            <input class="form-control" type="text" id="name" placeholder="Enter name" name="name">
                        </div>
                        <button class="btn btn-default" type="submit">Search</button>

                    </form>
                </div>
                <div class="col-sm-4"> </div>
            </div>

            <div class="container row">
                <div class="col-sm-4"> </div>

                <div class="col-sm-4">
                    <h3 class="text-muted text-center">Or, search user by ID</h3>
                    <form role="form" method="post" action="/findUserById/" accept-charset="UTF-8">
                        <div class="form-group form-horizontal">
                            <label for="id">ID:</label>
                            <input class="form-control" type="text" id="id" placeholder="Enter id" name="id">
                        </div>
                        <button class="btn btn-default" type="submit">Search</button>

                    </form>
                </div>

                <div class="col-sm-4"> </div>
            </div>
        </div>



      <%--Test field can remove--%>




      <%--Test field can remove--%>

      <br/>

    </main>
    <footer></footer>
  </body>
</html>