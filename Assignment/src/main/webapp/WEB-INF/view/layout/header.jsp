<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header-wrap">

    <p class="slogan">
        WELLCOME | BAT DONG SAN NGUYEN VO 6868| FPOLY
    </p>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class="dflex">
                    <div class="batdongsan_logomenu">
                        <a class="navbar-brand" href="#home"
                        ><img src="../img/logo_batdongsan.png" alt="" srcset=""
                        />
                        </a>
                    </div>

                    <ul class="header__nav-list">
                        <li class="header__nav-item--wrap">
                                <span><i class="fa-regular fa-user fa-lg"></i> <a
                                        class="text-decoration-none text-white font-monospace"
                                >Hi ${taiKhoan.hoTen} ${taiKhoan.vaiTro} </a>
                                </span>
                            <ul class="header__nav-item-list">

                                <li class="header__nav-item-item">
                                    <a href="/assignment/logout"
                                       class="lsn text-decoration-none text-white font-monospace">Log out</a>
                                </li>
                                <li class="header__nav-item-item">
                                    <a href="/assignment/account"
                                       class="lsn text-decoration-none text-white font-monospace">Reset
                                        password</a>
                                </li>
                            </ul>
                        </li>
                        <li class="header__nav-item--wrap">
                                <span> <a class="text-decoration-none text-white" href="/assignment/trang-chu">Home</a>
                                </span>
                        </li>
                        <li class="header__nav-item--wrap">
                                <span> <a class="text-decoration-none text-white" href="/assignment/sale">Sale</a>
                                </span>


                        </li>
                        <li class="header__nav-item--wrap">
                                <span> <a class="text-decoration-none text-white" href="/assignment/thong-ke">statistical</a>
                                </span>


                        </li>
                        <li class="header__nav-item--wrap">
                                <span> <a class="text-decoration-none text-white" href="/assignment/quan-ly-nha">
                                    Real Estate
                                    Management</a> </span>

                        </li>

                    </ul>

                </div>

                <div class="icon__header-wrap">
                    <div class="optionUser align">

                        <div class="search-wrap">
                            <form action="" class="form">
                                <input
                                        type="text"
                                        class="search-input"
                                        placeholder="Search..."
                                        name="tenNha"
                                        value="${param.tenNha}"

                                />
                                <span class="search-btn" type="submit"
                                ><i class="fa-solid fa-magnifying-glass fa-lg icon-search"></i
                                ></span>
                            </form>
                        </div>
                        <a href=""><i class="fa-regular fa-heart fa-lg"></i></a>
                        <a href="/assignment/cart"><i class="fa-solid fa-bag-shopping fa-lg"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>
