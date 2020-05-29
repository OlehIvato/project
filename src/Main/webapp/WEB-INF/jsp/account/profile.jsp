<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
<head>
    <style> .redLine {
        border: 4px solid red;
    }

    .bs-example {
        margin: 0px;
    }

    textarea {
        font-size: .8rem;
        letter-spacing: 1px;
    }

    textarea {
        padding: 10px;
        line-height: 1.5;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-shadow: 1px 1px 1px #999;
    }

    label {
        display: block;
        margin-bottom: 10px;
    }


    .image {
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: center;
        border: 5px solid red;
    }

    .imagePosition {
        position: absolute;
        top: 80px;
        left: 600px;
    }

    </style>


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Profile</title>

</head>
<body>
<div class="bs-example">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a href="#" class="navbar-brand">L O G O</a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav">
                <a href="/welcome" class="nav-item nav-link active">Home</a>
                <a href="/info" class="nav-item nav-link">About Game</a>
                <sec:authorize access="hasRole('ADMIN')">
                    <a href="/admin/userlist" class="nav-item nav-link">List of Users</a>
                </sec:authorize>
            </div>
        </div>

        <div class="navbar-nav" style="align-content: end">
            <a class="nav-item nav-link"
               href="${pageContext.request.contextPath}/account/user/<c:out value='${user.id}'/>">Profile</a>
            <a class="nav-item nav-link active" style="color: gold">${user.username}</a>
            <sec:authorize access="isAuthenticated()">
                <a class="nav-item nav-link" style="color: #ff3030"
                   href="${pageContext.request.contextPath}/logout">Log out</a>
            </sec:authorize>
        </div>
    </nav>
    <hr class="redLine" style="margin-top:0px">
</div>


<div style="margin-left: 50px">
    <c:forEach items="${user.profile}" var="profile">
        <form method="post">
            <fieldset>

                <h1>Account</h1>
                <th><strong> Username:</strong> ${user.username}</th>
                <br>
                <div class="btn-group">
                    <a style="width: 250px" class="btn btn-primary"
                       href="${pageContext.request.contextPath}/account/edit-username/<c:out value='${user.id}'/>">Change
                        username</a>
                    <a style="width: 250px" class="btn btn-primary"
                       href="${pageContext.request.contextPath}/account/edit-password/<c:out value='${user.id}'/>">Change
                        password</a>
                </div>

                <h1 style="margin-top: 30px">Contact Information</h1>
                <th><strong> Name:</strong> ${profile.name}</th>
                <br>
                <th><strong> Surname:</strong> ${profile.surname}</th>
                <br>
                <th><strong> Email:</strong> ${user.email}</th>
                <br>
                <th><strong> Birthday:</strong> ${profile.birthday}</th>
                <br>
                <th><strong> Gender:</strong> ${profile.gender}</th>
                <br>
                <th><strong> Phone:</strong> ${profile.phone}</th>
                <br>
                <th><strong> Country:</strong> ${profile.country}</th>
                <br>
                <th><strong> City:</strong> ${profile.city}</th>
                <br>
                <th><strong> Zip:</strong> ${profile.zip}</th>
                <br>
            </fieldset>

            <fieldset>
                <th><strong>Bio:</strong>
                    <label>
                        <textarea readonly rows="5" cols="60"> ${profile.bio} </textarea>
                    </label>
                </th>
            </fieldset>

            <div class="imagePosition">
                <h1> Avatar</h1>
                <div class="image">
                    <img style="width: 350px" alt="User Avatar" src="<c:url value="/ava/${profile.avatar}"/>"/>
                </div>
                <a style="width: 250px" class="btn btn-primary" href="/account/edit-avatar/<c:out value='${user.id}'/>">Edit
                    Avatar</a>
            </div>

        </form>

    </c:forEach>
    <a style="width: 250px" class="btn btn-primary"
       href="/account/edit-info/<c:out value='${user.id}'/>">Edit Contact Information</a>


</div>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>
</html>