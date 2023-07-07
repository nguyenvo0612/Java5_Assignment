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
        <h1 class="text-center">Sale san pham ton kho</h1>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <form action="/assignment/sale/update-gia/${nhaDetail.maNha}" method="post">
                    <p>Ten nha:</p>
                    <p><input type="text" name="tenNha" class="w-100" value="${nhaDetail.tenNha}"></p>
                    <p>So luong:</p>
                    <p><input type="text" name="soLuong" class="w-25" value="${nhaDetail.soLuong}"></p>
                    <p>Gia hien tai:</p>
                    <p><input type="text" name="giaNha" class="w-25" value="${nhaDetail.giaNha}"></p>
                    <p>Gia moi:</p>
                    <p><input type="text" name="giaMoi" class="w-25"></p>

                    <button type="submit" class="btn btn-success" onclick="return xacnhanadd()">Update</button>
                </form>
            </div>
            <div class="col-3"></div>
        </div>

        <c:if test="${danhSachNha.isEmpty()}">
            <h2>Not found any record!!</h2>
        </c:if>
        <c:if test="${not danhSachNha.isEmpty()}">
            <p>Found ${danhSachNha.getTotalElements()} records</p>
            <table class="table">
                <thead>
                <tr class="table-secondary">
                    <th>Ma</th>
                    <th>Ten</th>
                    <th>So luong</th>
                    <th>Anh</th>
                    <th>Gia cu</th>
                    <th>Gia hien tai</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${danhSachNha.getContent()}" var="nha">
                    <tr>
                        <td> ${nha.maNha} </td>
                        <td> ${nha.tenNha} </td>
                        <td> ${nha.soLuong} </td>
                        <td><img src="../../img/${nha.anhNha}" alt="" width="100px" height="80px"></td>
                        <td> ${nha.giaCu} </td>
                        <td> ${nha.giaNha} </td>
                        <td><a href="/assignment/sale/detail/${nha.maNha}"
                               class="text-decoration-none btn btn-success">Detail</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- Phan trang -->
            <div>
                <nav aria-label="..." class="col-12 text-center">
                    <ul class="pagination">
                        <c:if test="${danhSachNha.getNumber() + 1 > 1}">
                            <li class="page-item ">
                                <a class="page-link" href="?page=${danhSachNha.getNumber()}&tenNha=${param.tenNha}">
                                    Previous
                                </a>
                            </li>
                        </c:if>
                        <li>
                            <span class="page-item"> ${danhSachNha.getNumber() + 1} / ${danhSachNha.getTotalPages()} </span>
                        </li>
                        <c:if test="${danhSachNha.getNumber() + 1 lt danhSachNha.getTotalPages()}">
                            <li class="page-item">
                                <a class="page-link" href="?page=${danhSachNha.getNumber() + 2}&tenNha=${param.tenNha}">
                                    Next
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <!-- End Phan trang -->
        </c:if>
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
    function xacnhanadd() {
        if (confirm("Ban co muon sale khong?")) {
            return true;
        } else {
            return false;
        }
    }


</script>
</body>
</html>