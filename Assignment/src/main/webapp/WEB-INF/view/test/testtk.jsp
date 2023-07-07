<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>Danh sach san pham</h1>
<table border="1">
    <form action="" id="">
        <label>Loc:</label>
        <input type="date" name="locNgay" value="date">

    </form>
    <tr>
        <th>Ten san pham</th>
        <th>So luong ton</th>


    </tr>
    <c:forEach items="${thongKe}" var="tk">
        <tr>
            <td>${tk.tenMatHang}</td>
            <td>${tk.soLuong}</td>


        </tr>
    </c:forEach>

</table>