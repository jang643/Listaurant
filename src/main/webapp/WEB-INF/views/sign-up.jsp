<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

    <!doctype html>
<html lang="en" data-bs-theme="auto">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>회원가입</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">



    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
    <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            width: 100%;
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }

        .btn-bd-primary {
            --bd-violet-bg: #712cf9;
            --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

            --bs-btn-font-weight: 600;
            --bs-btn-color: var(--bs-white);
            --bs-btn-bg: var(--bd-violet-bg);
            --bs-btn-border-color: var(--bd-violet-bg);
            --bs-btn-hover-color: var(--bs-white);
            --bs-btn-hover-bg: #6528e0;
            --bs-btn-hover-border-color: #6528e0;
            --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
            --bs-btn-active-color: var(--bs-btn-hover-color);
            --bs-btn-active-bg: #5a23c8;
            --bs-btn-active-border-color: #5a23c8;
        }

        .bd-mode-toggle {
            z-index: 1500;
        }

        .bd-mode-toggle .dropdown-menu .active .bi {
            display: block !important;
        }
    </style>
    <script>
        let nickname;
        let email;
        function validateForm() {
            const password = document.getElementById("Password").value;
            const confirmPassword = document.getElementById("check-floatingPassword").value;
            const errorElement = document.getElementById("passwordCheckError");
            console.log(password, confirmPassword, errorElement)
            if(nickname.result === true){
                alert("닉네임 중복은 불가능 합니다.")
                return false;
            }
            if (password !== confirmPassword) {
                errorElement.textContent = "비밀번호가 일치하지 않습니다.";
                return false;
            } else {
                return true;
            }
        }

        $(document).ready(function() {
            $("#nickname").keyup(function () {
                console.log("입력되는지 확인");
                $.ajax({
                    url: '/nickname-check',
                    method: 'get',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    dataType: "json",
                    // dataType: "text",
                    data: {
                        "nickname": $(this).val()
                    },
                    success: function (result, status, xhr) {
                        nickname = result
                        if (nickname.result === true){
                            $("#nickname-check").text(nickname.txt).css('color','red')
                        }else if(nickname.result === false){
                            $("#nickname-check").text(nickname.txt).css('color','blue')
                        }

                    },
                    error: function () {
                    }
                });
            });

            $("#floatingInput").keyup(function () {
                console.log("입력되는지 확인");
                $.ajax({
                    url: '/email-check',
                    method: 'get',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    dataType: "json",
                    // dataType: "text",
                    data: {
                        "email": $(this).val()
                    },
                    success: function (result, status, xhr) {
                        email = result
                        if (email.result === true){
                            $("#emailCheckError").text(email.txt).css('color','red')
                        }else if(email.result === false){
                            $("#emailCheckError").text(email.txt).css('color','blue')
                        }

                    },
                    error: function () {
                    }
                });
            });

            $("#Password").keyup(function () {
                console.log("입력되는지 확인");
                let password = document.getElementById("Password").value;
                let confirmPassword = document.getElementById("check-floatingPassword").value;
                const errorElement = document.getElementById("passwordCheckError");
                if(password === ""){
                    errorElement.textContent = "";
                }else {
                    if (password !== confirmPassword) {
                        errorElement.style.color = "red";
                        errorElement.textContent = "비밀번호가 일치하지 않습니다.";
                    }
                    if(password === confirmPassword){
                        errorElement.style.color = "blue";
                        errorElement.textContent = "비밀번호 일치"
                    }
                }
            })

            $("#check-floatingPassword").keyup(function () {
                console.log("입력되는지 확인");
                let password = document.getElementById("Password").value;
                let confirmPassword = document.getElementById("check-floatingPassword").value;
                const errorElement = document.getElementById("passwordCheckError");
                if(password === ""){
                    errorElement.textContent = "";
                }else{
                    if (password !== confirmPassword) {
                        errorElement.style.color = "red";
                        errorElement.textContent = "비밀번호가 일치하지 않습니다.";
                    }
                    if(password === confirmPassword){
                        errorElement.style.color = "blue";
                        errorElement.textContent = "비밀번호 일치"
                    }
                }
            })
        });

    </script>

    <!-- Custom styles for this template -->
    <link href="css/login.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="d-flex align-items-center py-4 bg-body-tertiary">
    <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
        <symbol id="check2" viewBox="0 0 16 16">
            <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
    </symbol>
    <symbol id="circle-half" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"/>
    </symbol>
    <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"/>
        <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
    </symbol>
    <symbol id="sun-fill" viewBox="0 0 16 16">
        <path d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
    </symbol>
</svg>
<main class="form-signin w-100 m-auto">

    <form:form onsubmit="return validateForm()" action="/sign-up" method="post" modelAttribute="signUpRequest">
        <div class="d-flex align-items-center">
            <img class="mb-4" src="assets/brand/logo.png" alt="" width="72" height="57" style="border-radius: 50%;">
            <h1 class="h3 mb-3 fw-normal">회원가입</h1>
        </div>
        <div class="form-floating mb-3">
            <form:input type="email" path="email" class="form-control" id="floatingInput" placeholder="name@example.com"/>
            <label for="floatingInput">Email address</label>
            <form:errors path="email" cssStyle=" color : red" id="email-check"/>
            <div id="emailCheckError" style="color: red;"></div>
        </div>
        <spring:hasBindErrors name="signUpRequest">
            <c:forEach var="error" items="${errors.globalErrors}">
                <div class="error" style="color : red">${error.defaultMessage}</div>
            </c:forEach>
        </spring:hasBindErrors>

        <div class="form-floating mb-3">
            <form:input path="nickname" class="form-control" id="nickname" placeholder="nickname"/>
            <label for="nickname">Nickname</label>
            <form:errors path="nickname" cssStyle=" color : red"/>
            <p id ="nickname-check"></p>
        </div>

        <div class="form-floating mb-3">
            <form:password path="passwd" class="form-control" id="Password" placeholder="Password"/>
            <label for="Password">Password</label>
            <form:errors path="passwd" cssStyle=" color : red"/>
        </div>

        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="check-floatingPassword" placeholder="Password"/>
            <label for="check-floatingPassword">Password-Check</label>
            <div id="passwordCheckError" style="color: red;"></div>
        </div>

        <div class="form-floating mb-3">
            <form:input type="tel" path="pno" class="form-control" id="Phone-Number" placeholder="Phone-Number"/>
            <label for="Phone-Number">Phone-Number</label>
            <form:errors path="pno" cssStyle="color: red"/>
        </div>

        <button class="btn btn-primary w-100 py-2" type="submit">회원가입</button>

        <a href="/login" class="btn btn-primary w-100 py-2" type="submit" style="margin-top: 10px">로그인</a>
    </form:form>

</main>
<script src="assets/dist/js/bootstrap.bundle.min.js"></script>

</div>
</body>
</html>
