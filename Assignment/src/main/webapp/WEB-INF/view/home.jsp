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
        <p></p>
        <p></p>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <form action="">
                    <span>Name:
                        <input
                                type="text"
                                class="search-input"
                                placeholder="Nhap ten nha"
                                name="tenNha"
                                value="${param.tenNha}"

                        /></span>
                    <span>Start: <input type="text" class="search-input " name="giaBatDau" placeholder="Gia bat dau"
                                        value="${param.giaBatDau}"></span>
                    <span class="mar">-End: <input
                            type="text" class="search-input" name="giaKetThuc" placeholder="Gia ket thuc"
                            value="${param.giaKetThuc}"></span>
                    <button class="search-input" type="submit"><i
                            class="fa-solid fa-magnifying-glass fa-lg icon-search"></i></button>
                </form>


            </div>
            <div class="col-3"></div>
        </div>
        <!-- Room Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-info text-uppercase">Our House</h6>
                    <h1 class="mb-5">Explore Our <span class="text-info text-uppercase">House</span></h1>
                </div>
                <div class="row g-4">
                    <c:forEach items="${danhSachNha.getContent()}" var="nha">
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="room-item shadow rounded overflow-hidden">
                                <div class="position-relative">
                                    <img class="img-fluid" src="../img/${nha.anhNha}" alt="">
                                    <small class="position-absolute start-0 top-100 translate-middle-y bg-info text-black
                                rounded py-1 px-3 ms-4">${nha.giaNha}
                                        $</small>
                                </div>
                                <div class="p-4 mt-2">
                                    <div class="d-flex justify-content-between mb-3">
                                        <h5 class="mb-0">${nha.tenNha}</h5>
                                        <div class="ps-2">

                                            <small class="fa-solid fa-star fa-bounce" style="color: #00d6d3;"></small>
                                            <small class="fa-solid fa-star fa-bounce" style="color: #00d6d3;"></small>
                                            <small class="fa-solid fa-star fa-bounce" style="color: #00d6d3;"></small>
                                            <small class="fa-solid fa-star fa-bounce" style="color: #00d6d3;"></small>
                                            <small class="fa-solid fa-star fa-bounce" style="color: #00d6d3;"></small>

                                        </div>
                                    </div>
                                    <div class="d-flex mb-3">

                                        <small class="border-end me-3 pe-3"><i
                                                class="fa-solid fa-arrows-to-circle fa-beat"
                                                style="color: #00d6d3;"></i> ${nha.dienTich}
                                            m^2</small>
                                        <small class="border-end me-3 pe-3"><i class="fa-solid fa-layer-group fa-beat"
                                                                               style="color: #00d6d3;"></i> ${nha.soTang}
                                            floor</small>
                                        <small class="border-end me-3 pe-3"><i class="fa-solid fa-bath fa-beat"
                                                                               style="color: #00d6d3;"></i></i>
                                                ${nha.soPhongTam}
                                            Bath</small>
                                        <small class="border-end me-3 pe-3"><i class="fa-solid fa-bed fa-beat"
                                                                               style="color: #00d6d3;"></i>
                                                ${nha.soPhongNgu}
                                            Bed
                                        </small>

                                    </div>
                                    <p class="text-body mb-3">Call me when you want help: 0988762923 *** Mr Vo.</p>
                                    <div class="d-flex justify-content-between">
                                        <a class="btn btn-sm btn-info rounded py-2 px-4"
                                           href="/assignment/detail-nha/${nha.maNha}">View Detail</a>
                                        <a class="btn btn-sm btn-dark rounded py-2 px-4" href="">Add to Cart</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Room End -->

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
    </div>
</section>


<!-- Footer -->
<footer>
    <%@include file="./layout/footer.jsp" %>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>