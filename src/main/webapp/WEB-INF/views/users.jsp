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
      <div class="jumbotron text-center">
          <h2>List existing of Users</h2>
      </div>



            <c:if test="${!empty listUsers}">
                <table>
                    <tr>
                        <td>Id</td><td>NAME</td><td>Created Date</td><td>Age</td><td>Admin</td><td></td>
                    </tr>
                    <c:forEach items="${listUsers.pageList}" var="user">
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
                </table>


                <nav>
                    <ul class="pager">
                        <li><a href=${listUsers.page-1>0?listUsers.page:1}>Previous</a></li>

                            <%--${listUsers.nextPage()}--%>

                        <li><a href=${listUsers.page+1}>Next</a></li>
                    </ul>
                </nav>

            </c:if>




      <%--Test field can remove--%>
      <h3>Search user by name</h3>
        <form method="POST" action="/findUserByName/" accept-charset="UTF-8">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name">
            <button type="submit">Search</button>
        </form>

        <h3>Search user by ID</h3>
        <form role="form" method="post" action="/findUserById/" accept-charset="UTF-8">
            <label for="id">ID:</label>
            <input type="text" id="id" placeholder="Enter id" name="id">
            <button type="submit">Search</button>
        </form>


      <%--Test field can remove--%>

      <br/>
      <a href="<c:url value='/new' />">Add new user</a>
    </main>
    <footer></footer>
  </body>
</html>