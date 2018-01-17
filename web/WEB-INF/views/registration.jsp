<%--
  Created by IntelliJ IDEA.
  User: David
  Date: 17.01.2018
  Time: 14:16
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
    <title>index</title>
</head>
<body>
<div class="container">
<form>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="inputFirstName">Jméno</label>
            <input type="text" class="form-control" id="inputFirstName" placeholder="Jméno" required>
        </div>
        <div class="form-group col-md-6">
            <label for="inputLastName">Příjmení</label>
            <input type="text" class="form-control" id="inputLastName" placeholder="Příjmení" required>
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="inputPassword">Password</label>
            <input type="password" class="form-control" id="inputPassword" placeholder="Password" required>
        </div>
        <div class="form-group col-md-6">
            <label for="inputPassword2">Password</label>
            <input type="password" class="form-control" id="inputPassword2" placeholder="Password" required>
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="inputEmail">Email</label>
            <input type="email" class="form-control" id="inputEmail" placeholder="Email" required>
        </div>
        <div class="form-group col-md-6">
            <label for="inputPhone">Tel. číslo</label>
            <input type="number" class="form-control" id="inputPhone" placeholder="Tel. číslo">
        </div>
    </div>
    <div class="form-group">
        <label for="inputAddress">Addresa</label>
        <input type="text" class="form-control" id="inputAddress" placeholder="Rokitanského 62" required>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="inputCity">Město</label>
            <input type="text" class="form-control" id="inputCity" placeholder="Hradec Králové" required>
        </div>
        <div class="form-group col-md-2">
            <label for="inputZip">PSČ</label>
            <input type="text" class="form-control" id="inputZip" placeholder="500 03" required>
        </div>
    </div>

    <button type="submit" class="btn btn-primary">Registrovat</button>
</form>
</div>
</body>
</html>
