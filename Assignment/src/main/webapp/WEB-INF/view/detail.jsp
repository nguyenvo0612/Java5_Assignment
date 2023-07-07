<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bat Dong San Vo 6868</title>
    <link rel="stylesheet" href="../../css/index.css">
    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/footer.css">
    <link rel="stylesheet" href="../../css/style.css">

    <link rel="stylesheet" href="../../css/bootstrap.min.css">
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
<header>
    <%@include file="./layout/header.jsp" %>
</header>
<section>
    <div class="container">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="room-item shadow rounded overflow-hidden">
                    <div class="position-relative">
                        <img class="img-fluid" src="../../img/${nhaDetail.anhNha}" alt="">

                    </div>
                    <div class="p-4 mt-2">
                        <div class="d-flex justify-content-between mb-3">
                            <p><i class="fa-solid fa-money-check-dollar fa-bounce fa-2xl"></i> ${nhaDetail.giaNha} $
                            </p>

                        </div>

                        <c:if test="${ nhaDetail.giaCu != null}">
                            <div class="d-flex justify-content-between mb-3">
                                <p class="text-decoration-line-through">
                                    <i class="fa-sharp fa-solid fa-tag fa-2xl" style="color: #ff0000;" ></i> ${nhaDetail.giaCu}
                                    $
                                </p></div>
                        </c:if>


                        <div class="d-flex justify-content-between mb-3">

                            <h5 class="mb-0 fs-3">${nhaDetail.tenNha}</h5>

                            <div class="ps-2">

                                <small class="fa-solid fa-star fa-bounce" style="color: #00d6d3;"></small>
                                <small class="fa-solid fa-star fa-bounce" style="color: #00d6d3;"></small>
                                <small class="fa-solid fa-star fa-bounce" style="color: #00d6d3;"></small>
                                <small class="fa-solid fa-star fa-bounce" style="color: #00d6d3;"></small>
                                <small class="fa-solid fa-star fa-bounce" style="color: #00d6d3;"></small>

                            </div>
                        </div>
                        <div class="d-flex mb-3">

                            <small class="border-end me-5 pe-5"><i
                                    class="fa-solid fa-arrows-to-circle fa-beat fa-2xl"
                                    style="color: #00d6d3;"></i> <span class="fs-5">  ${nhaDetail.dienTich}
                                m^2</span></small>
                            <small class="border-end me-5 pe-5"><i class="fa-solid fa-layer-group fa-beat fa-2xl"
                                                                   style="color: #00d6d3;"></i> <span class="fs-5">
                                ${nhaDetail.soTang}
                                floor </span></small>
                            <small class="border-end me-5 pe-5"><i class="fa-solid fa-bath fa-beat fa-2xl"
                                                                   style="color: #00d6d3;"></i></i> <span class="fs-5">
                                ${nhaDetail.soPhongTam}
                                Bath </span></small>
                            <small class="border-end me-5 pe-5"><i class="fa-solid fa-bed fa-beat fa-2xl"
                                                                   style="color: #00d6d3;"></i> <span class="fs-5">
                                ${nhaDetail.soPhongNgu}
                                Bed</span></span>
                            </small>

                        </div>
                        <p class="text-body mb-3">${nhaDetail.moTa}</p>
                        <p class="text-body mb-3">Call me when you want help: 0988762923 *** Mr Vo.</p>
                        <div class="d-flex justify-content-between">
                            <a class="btn btn-sm btn-dark rounded py-2 px-4" href="">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3"></div>
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
</body>
</html>