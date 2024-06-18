<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
    <script src="assets/js/color-modes.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function validateForm() {
            const password = document.getElementById("Password").value;
            const confirmPassword = document.getElementById("check-floatingPassword").value;
            const errorElement = document.getElementById("passwordCheckError");
            console.log(password, confirmPassword, errorElement)
            if (password !== confirmPassword) {
                errorElement.textContent = "패스워트가 일치하지 않습니다.";
                return false;
            } else {
                return true;
            }
        }
    </script>
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">
</svg>
<main class="form-signin w-100 m-auto">
    <form:form onsubmit="return validateForm()" action="/sign-up" method="post" modelAttribute="pwdChangeRequest">
        <img class="mb-4" src="assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
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
        <button class="btn btn-primary w-100 py-2" type="submit">변경하기</button>
        <p class="mt-5 mb-3 text-body-secondary">&copy; 2017–2024</p>
    </form:form>
</main>
<script src="assets/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
