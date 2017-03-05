<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User registration confirmation</title>


</head>
<body>
message : ${success}
<br/>
<br/>
Go back to <a href="<c:url value='/list' />">List of all users</a>

</body>
</html>