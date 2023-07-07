<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/index.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bat Dong San Vo 6868</title>
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/style.css">


    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Link css bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <!-- Icon Font Stylesheet -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
            integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
</head>

<body>
<%@include file="./layout/header.jsp" %>
<div class="container">
    <div class="">


        <div class="">
            <form action="/assignment/forgot-password" method="post">
                <div class="w-100">
                    <div class="">
                        <div class="border-right-signin">

                            <div>
                                <div class="header-signin">Password Recovery</div>
                            </div>
                            <label class="title-signin">
                                Please enter your email and we'll send you a link to create a new password
                            </label>
                            <input class="input-signin mt-3" type="text" placeholder="Please enter your email..."
                            name="gmail">
                            <% String forgot = (String) session.getAttribute("forgotPassword"); %>

                            <div class="text-center mt-4">
                                <button type="submit" class="btn-signin">Confirm Email
                                    <i class="fa-solid fa-arrow-right-to-bracket ms-2"></i></button>
                            </div>
                            <% if (forgot != null) { %>
                                <div style="color: green">
                                    ${forgotPassword}
                                </div>
                            <% }  else { %>
                                <div style="color: red">
                                    ${err}
                                </div>
                            <% } %>

                            <div class="d-flex justify-content-end mt-3">
                                <a class="link-signup me-2" href="/assignment/login">Login</a>
                                <div>or</div>
                                <a class="link-signup" href="">Register</a>
                            </div>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>


<script src="https://kit.fontawesome.com/6189a5b91e.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>
</body>
</html>