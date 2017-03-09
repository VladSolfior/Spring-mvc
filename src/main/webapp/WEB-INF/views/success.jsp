<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User registration confirm</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
    <header></header>
    <main>
        <div class="container">
            <div class="alert alert-success alert-dismissable">
                message: ${success}
            </div>
            <a class="btn btn-info" href="<c:url value='/users/1' />">List of all users</a>
        </div>
    </main>
    <footer></footer>


</body>
</html>