<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
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
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/v4-font-face.min.css"--%>
    <%--          integrity="sha512-9zJZv7L1yjQ8D5y5lJfZJzV+RzqWvYX6K3bT7r2w8VxjM5f7d+1pGJQwT9L0i2tNqj8N2gVwY3lWmK6aFZgXOQ=="--%>
    <%--          crossorigin="anonymous" referrerpolicy="no-referrer"/>--%>
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">--%>


</head>
<body>
<!--Menu-->
<header>
    <%@include file="./layout/header.jsp" %>
</header>

<!--end menu-->
<section>
    <div class="container">
        <h1 class="text-center">Gio hang mua ban nha dat</h1>


        <table class="table">
            <thead>
            <tr class="table-secondary">
                <th>Ma</th>
                <th>Anh</th>
                <th>Ten</th>
                <th>So luong</th>
                <th>Don gia</th>
                <th>Thanh tien</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <form id="formSoLuong" method="post">

            <c:forEach items="${danhSachNhaTrongGio}" var="nha">

                <tr>
                    <td> ${nha.maNha} </td>
                    <td><img src="../../img/${nha.anhNha}" alt="" width="100px" height="80px"></td>
                    <td> ${nha.tenNha} </td>
                    <td>
                            <button type="submit" class="btn" onclick="giam(${nha.maNha})">-</button>
                                ${nha.soLuong}
                            <button type="submit" class="btn" onclick="tang(${nha.maNha})">+</button>

                    </td>
                    <td> ${nha.giaNha} </td>


                    <td> ${nha.soLuong * nha.giaNha} </td>
                    <td><a href="/assignment/removeCart/${nha.maNha}"
                           class="text-decoration-none btn"><i class="fa-solid fa-trash-can"></i></a>
                    </td>
                </tr>

            </c:forEach>
            </form>

            </tbody>
        </table>

        <div class="row">
<%--            <p><a href="/assignment/buy-cart" class="text-decoration-none text-right btn btn-danger">${tongTien}</a></p>--%>
            <p><a href="/assignment/buy-cart" class="text-decoration-none text-right btn btn-danger">Thanh toan</a></p>
            <p><a href="/assignment/clear-cart" class="text-decoration-none text-right btn btn-danger">Clear all</a></p>

        </div>


    </div>
</section>


<!-- Footer -->
<footer>
    <%@include file="./layout/footer.jsp" %>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script>
    function giam(ma) {
        document.getElementById("formSoLuong").action = "/assignment/giamSL/" + ma;

    }

    function tang(ma) {
        document.getElementById("formSoLuong").action = "/assignment/tangSL/" + ma;

    }
</script>
</body>
</html>