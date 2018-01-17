<%--
  Created by IntelliJ IDEA.
  User: Azze3
  Date: 03.01.2018
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style/css/bootstrap.css"/>
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/style/css/signin.css" rel="stylesheet">
</head>

<body>

<div class="container">

  <form class="form-signin">
    <h2 class="form-signin-heading">Příhlaste se:</h2>
    <label for="inputLogin" class="sr-only">Login</label>
    <input type="text" id="inputLogin" class="form-control" placeholder="Login" autofocus> <!-- required -->
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="Password" > <!-- required -->
    <button class="btn btn-lg btn-primary btn-block" type="submit">Přihlásit</button>
    <a href="${pageContext.request.contextPath}/registration" class="btn btn-lg btn-outline-success btn-block" type="">Registrovat</a>

    <!--delete tyhle dva radky + pridat k inputum nahore "required"-->
    <br />
    <a href="${pageContext.request.contextPath}/home" class="btn btn-danger " >vstoupit bez loginu :)</a>

  </form>

</div> <!-- /container -->
</body>
</html>
