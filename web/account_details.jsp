<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "java.sql.*" %>
<%@page import = "model.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">


    <title>Account details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        body {
            margin-top: 20px;
            background-color: #f2f6fc;
            color: #69707a;
        }

        .img-account-profile {
            height: 10rem;
        }

        .rounded-circle {
            border-radius: 50% !important;
        }

        .card {
            box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
        }

        .card .card-header {
            font-weight: 500;
        }

        .card-header:first-child {
            border-radius: 0.35rem 0.35rem 0 0;
        }

        .card-header {
            padding: 1rem 1.35rem;
            margin-bottom: 0;
            background-color: rgba(33, 40, 50, 0.03);
            border-bottom: 1px solid rgba(33, 40, 50, 0.125);
        }

        .form-control,
        .dataTable-input {
            display: block;
            width: 100%;
            padding: 0.875rem 1.125rem;
            font-size: 0.875rem;
            font-weight: 400;
            line-height: 1;
            color: #69707a;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #c5ccd6;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border-radius: 0.35rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .nav-borders .nav-link.active {
            color: #0061f2;
            border-bottom-color: #0061f2;
        }

        .nav-borders .nav-link {
            color: #69707a;
            border-bottom-width: 0.125rem;
            border-bottom-style: solid;
            border-bottom-color: transparent;
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
            padding-left: 0;
            padding-right: 0;
            margin-left: 1rem;
            margin-right: 1rem;
        }
    </style>
</head>

<body>
    <div class="container-xl px-4 mt-4">
        <%
        Account account = (Account) request.getAttribute("account");
        String readOnly = "", hidden = "";
        if (account != null) {
            if (account.getRollID() == 2) {
                readOnly = "readonly";
                hidden = "hidden";
            }
        %>

        <nav class="nav nav-borders col-11">
            <a class="nav-link active ms-0"
                href="userDetails"
                target="">Profile</a>
            <a class="nav-link" href=""
                target="" <%=hidden %>>Billing</a>
            <a class="nav-link" href="accountSecurity"
                target="">Security</a>
            <a class="nav-link" href=""
                target="">Notifications</a>
        </nav>
        
        <hr class="mt-0 mb-4">
        
            <div class="row">
                <div class="col-xl-4">
    
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Profile Picture</div>
                        <div class="card-body text-center">
    
                            <img class="img-account-profile rounded-circle mb-2"
                                src="http://bootdey.com/img/Content/avatar/avatar1.png" alt>
    
                            <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
    
                            <button class="btn btn-primary" type="button">Upload new image</button>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
    
                    <div class="card mb-4">
                        <div class="card-header">Account Details</div>
                        <div class="card-body">
                            <form action="userDetails" method="post" name="inputForm">
    
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputUsername">Username (how your name will appear to
                                        other users on the site)</label>
                                    <input class="form-control" id="inputUsername" type="text" name="inputUsername"
                                        placeholder="Enter your username" value="<%=account.getUsername() %>" <%=readOnly %>>
                                </div>
    
                                <div class="row gx-3 mb-3">
    
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputFirstName">First name</label>
                                        <input class="form-control" id="inputFirstName" type="text" name="inputFirstName"
                                            placeholder="Enter your first name" value="<%=account.getFirstname() %>" <%=readOnly %>>
                                    </div>
    
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputLastName">Last name</label>
                                        <input class="form-control" id="inputLastName" type="text" name="inputLastName"
                                            placeholder="Enter your last name" value="<%=account.getLastname() %>" <%=readOnly %>>
                                    </div>
                                </div>
    
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                    <input class="form-control" id="inputEmailAddress" type="email" name="inputEmailAddress"
                                        placeholder="Enter your email address" value="<%=account.getEmail() %>" <%=readOnly %>>
                                </div>
    
                                <div class="row gx-3 mb-3">
    
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputPhone">Phone number</label>
                                        <input class="form-control" id="inputPhone" type="tel" name="inputPhone"
                                            placeholder="Enter your phone number" value="<%=account.getPhoneNumber() %>" <%=readOnly %>>
                                    </div>
    
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputBirthday">Birthday</label>
                                        <input class="form-control" id="inputBirthday" type="date" name="inputBirthday"
                                            placeholder="Enter your birthday" value="<%=account.getBirthDate() %>" <%=readOnly %>>
                                    </div>
                                </div>
    
                                <button class="btn btn-primary" type="submit" name="saveChanges" value="saveChanges" <%=hidden %>>Save changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        <%
        } else {
        %>
            <script>location.href="login.jsp"</script>
        <%
        }
        %>
    </div>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">

    </script>
</body>

</html>