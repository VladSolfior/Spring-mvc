<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

  <head>
    <title>Users app</title>
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  </head>
  <body>

  <header></header>
  <main>
      <div style="text-align: center" class="page-header"> A simple users CRUD app
          <div class="row">
              <div class="col-sm-4"> </div>
              <div class="col-sm-4">
                  <a class="btn btn-primary btn-block" href="<c:url value='/list' />">All users</a>
              </div>
              <div class="col-sm-4"> </div>
          </div>
      </div>

  </main>
  <footer></footer>
  </body>
</html>
