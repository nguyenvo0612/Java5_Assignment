<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login V8</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../css/util.css">
    <link rel="stylesheet" type="text/css" href="../css/main2.css">
    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form p-l-55 p-r-55 p-t-178"
                  action="/assignment/update/acount/${Detail.maTaiKhoan}" method="post">
					<span class="login100-form-title">
						Update infor
					</span>
                <p>Ten tai khoan:</p>
                <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                    <input class="input100" type="text" name="tenTaiKhoan" placeholder="Username"
                           value="${Detail.tenTaiKhoan}">
                    <span class="focus-input100"></span>
                </div>
                <p>Ho ten:</p>
                <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter password">
                    <input class="input100" type="text" name="hoTen" placeholder="Password"
                           value="${Detail.hoTen}">
                    <span class="focus-input100"></span>
                </div>
                <p>Gmail:</p>

                <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter password">
                    <input class="input100" type="text" name="gmail" placeholder="Password"
                           value="${Detail.gmail}">
                    <span class="focus-input100"></span>
                </div>
                <p>Noi o:</p>

                <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter password">
                    <input class="input100" type="text" name="noiO" placeholder="Password"
                           value="${Detail.noiO}">
                    <span class="focus-input100"></span>
                </div>
                <p>Mat khau:</p>

                <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter password">
                    <input class="input100" type="text" name="matKhau" placeholder="Password"
                           value="${Detail.matKhau}">
                    <span class="focus-input100"></span>
                </div>


                <div class="container-login100-form-btn m-b-16">
                    <button class="login100-form-btn" type="submit">
                        Update
                    </button>
                </div>
                <div>
                    <p class="mb-2 text-center" style="color: red">${thongBao}</p>
                </div>
                <p></p>
                <div>
                    <a href="/assignment/trang-chu" class="login100-form-btn m-b-16" style="color: #fff">Back</a>
                </div>

            </form>
        </div>
    </div>
</div>


<!--===============================================================================================-->
<script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"
></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
        integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
        crossorigin="anonymous"
></script>

</body>
</html>