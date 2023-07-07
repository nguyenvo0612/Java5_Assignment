<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<c:set var="tenMatHang" value=""/>--%>
<%--<c:forEach items="${thongKe}" var="element" varStatus="status">--%>
<%--    <c:set var="tenMatHang" value="${tenMatHang}${element.tenMatHang}"/>--%>
<%--    <c:if test="${!status.last}">--%>
<%--        <c:set var="tenMatHang" value="${tenMatHang}, "/>--%>
<%--    </c:if>--%>
<%--</c:forEach>--%>
<c:set var="soLuong" value=""/>
<c:forEach items="${thongKe}" var="element" varStatus="status">
    <c:set var="soLuong" value="${soLuong}${element.soLuong}"/>
    <c:if test="${!status.last}">
        <c:set var="soLuong" value="${soLuong}, "/>
    </c:if>
</c:forEach>
<c:set var="tenMatHang" value=""/>
<c:forEach items="${thongKe}" var="element" varStatus="status">
    <c:set var="temp" value="${element.tenMatHang.split(',')}"/>
    <c:forEach items="${temp}" var="item">
        <c:set var="formattedItem" value="${item.trim()}"/>
        <c:set var="tenMatHang" value="${tenMatHang}'${formattedItem}'"/>
        <c:if test="${!status.last}">
            <c:set var="tenMatHang" value="${tenMatHang}, "/>
        </c:if>
    </c:forEach>
</c:forEach>


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
    <%@include file="../layout/header.jsp" %>
</header>

<!--end menu-->
<div class="container">
    <br>
    <br>
    <form id="formLoc">
        Enter something: <input name="locNgay" type="date" value="${param.locNgay}" />
        <input type="submit" value="Search"/>
    </form>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>

    <figure class="highcharts-figure">
        <div id="container"></div>

    </figure>
    <br>
    <br>


    <h2 class="text-center">Thong ke mat hang ton kho</h2>
    <table class="table">
        <thead>
        <tr class="table-secondary">
            <th>Anh nha</th>
            <th>Ten nha</th>
            <th>Gia</th>
            <th>So luong</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${thongKeTonKho}" var="tk">
            <tr>
                <td>${tk.anh}</td>
                <td>${tk.tenMatHang}</td>
                <td>${tk.gia}</td>
                <td>${tk.soLuong}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<br>
<br>
<script>
    Highcharts.chart('container', {
        chart: {
            type: 'spline'
        },
        title: {
            text: 'Thong ke mat hang ban chay'
        },
        // subtitle: {
        //     text: 'Source: ' +
        //         '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
        //         'target="_blank">Wikipedia.com</a>'
        // },
        xAxis: {
            categories:

                [${tenMatHang}],
            accessibility: {
                description: 'Months of the year'
            }
        },
        yAxis: {
            title: {
                text: 'So luong'
            },
            // labels: {
            //     format: '{value}°'
            // }
        },
        tooltip: {
            crosshairs: true,
            shared: true
        },
        plotOptions: {
            spline: {
                marker: {
                    radius: 4,
                    lineColor: '#666666',
                    lineWidth: 1
                }
            }
        },
        series: [{
            name: 'Quantity',
            marker: {
                symbol: 'square'
            },
            data:
                [${soLuong}]

        }]
    });</script>

</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script>
    function locSP() {
        document.getElementById("formLoc").submit();
    }
</script>
</body>
<!-- Footer -->
<footer>
    <%@include file="../layout/footer.jsp" %>
</footer>
</html>
