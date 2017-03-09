<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>User registration</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <%--<style>--%>

    <%--.error {--%>
      <%--color: #ff0000;--%>
    <%--}--%>
  <%--</style>--%>

</head>
<body>
    <header></header>
    <main>
        <div class="container">
            <div class="row">
                <div class="col-sm-4"> </div>
                <div class="col-sm-4">
                    <div>
                        <h2 class="text-muted text-center">Registration Form</h2>

                        <form:form method="POST" modelAttribute="user">
                            <form:input type="hidden" path="id" id="id"/>
                            <div class="form-group form-horizontal">
                                <div>
                                    <label for="name">Name: </label>
                                    <form:input class="form-control" path="name" id="name"/>
                                    <form:errors path="name" cssClass="error"/>
                                </div>

                                <div>
                                    <label for="createdDate">Created date: </label>
                                    <form:input class="form-control" path="createdDate" id="createdDate"/>
                                    <form:errors path="createdDate" cssClass="error"/>
                                </div>

                                <div>
                                    <label for="age">Age: </label>
                                    <form:input class="form-control" path="age" id="age"/>
                                    <form:errors path="age" cssClass="error"/>
                                </div>

                                <div>
                                    <label for="admin">User is admin: </label>
                                    <form:input class="form-control" path="admin" />
                                    <form:errors path="admin" cssClass="error"/>
                                </div>


                            </div>
                            <div>
                                <div>
                                    <c:choose>
                                        <c:when test="${edit}">
                                            <input class="btn btn-default" type="submit" value="Update"/>
                                        </c:when>
                                        <c:otherwise>
                                            <input class="btn btn-default" type="submit" value="Register"/>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </form:form>

                        <a class="btn btn-info" href="<c:url value='/users/1' />">List of all users</a>
                    </div>
                </div>

                <div class="col-sm-4"> </div>
            </div>
        </div>



    </main>
    <footer></footer>
</body>
</html>
