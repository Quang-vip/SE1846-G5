<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "java.sql.*" %>
<%@page import = "model.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">


    <title>Account security</title>
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

        .btn-danger-soft {
            color: #000;
            background-color: #f1e0e3;
            border-color: #f1e0e3;
        }
        
    </style>
</head>

<body>
    <div class="container-xl px-4 mt-4">
        <%
        Account account = (Account) request.getAttribute("account");
        String hidden = "";
        if (account != null) {
            if (account.getRollID() == 2) {
                hidden = "hidden";
            }
        %>
        <!-- Account page navigation-->
        <nav class="nav nav-borders">
        <a class="nav-link  ms-0" href="userDetails" target="">Profile</a>
        <a class="nav-link" href="" target="" <%=hidden %>>Billing</a>
        <a class="nav-link active" href="accountSecurity" target="">Security</a>
        <a class="nav-link" href=""  target="">Notifications</a>
        </nav>
        <hr class="mt-0 mb-4">
        
        <div class="row">
            <div class="col-lg-8">
                <!-- Change password card-->
                <div class="card mb-4">
                    <div class="card-header">Change Password</div>
                    <div class="card-body">
                        <form action="accountSecurity" method="post">
                            <!-- Form Group (current password)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="currentPassword">Current Password</label>
                                <input class="form-control" id="currentPassword" name="currentPassword" type="password" placeholder="Enter current password">
                            </div>
                            <!-- Form Group (new password)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="newPassword">New Password</label>
                                <input class="form-control" id="newPassword" name="newPassword" type="password" placeholder="Enter new password">
                            </div>
                            <!-- Form Group (confirm password)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="confirmPassword">Confirm Password</label>
                                <input class="form-control" id="confirmPassword" name="confirmPassword" type="password" placeholder="Confirm new password">
                            </div>
                            <button class="btn btn-primary" type="submit" name="savePassword" value="savePassword">Save</button>
                        </form>
                    </div>
                </div>
                <!-- Security preferences card-->
                <!-- <div class="card mb-4">
                    <div class="card-header">Security Preferences</div>
                    <div class="card-body">
                        <!- - Account privacy optinos- ->
                        <h5 class="mb-1">Account Privacy</h5>
                        <p class="small text-muted">By setting your account to private, your profile information and posts will not be visible to users outside of your user groups.</p>
                        <form>
                            <div class="form-check">
                                <input class="form-check-input" id="radioPrivacy1" type="radio" name="radioPrivacy" checked="">
                                <label class="form-check-label" for="radioPrivacy1">Public (posts are available to all users)</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" id="radioPrivacy2" type="radio" name="radioPrivacy">
                                <label class="form-check-label" for="radioPrivacy2">Private (posts are available to only users in your groups)</label>
                            </div>
                        </form>
                        <hr class="my-4">
                        <!- - Data sharing options- ->
                        <h5 class="mb-1">Data Sharing</h5>
                        <p class="small text-muted">Sharing usage data can help us to improve our products and better serve our users as they navigation through our application. When you agree to share usage data with us, crash reports and usage analytics will be automatically sent to our development team for investigation.</p>
                        <form>
                            <div class="form-check">
                                <input class="form-check-input" id="radioUsage1" type="radio" name="radioUsage" checked="">
                                <label class="form-check-label" for="radioUsage1">Yes, share data and crash reports with app developers</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" id="radioUsage2" type="radio" name="radioUsage">
                                <label class="form-check-label" for="radioUsage2">No, limit my data sharing with app developers</label>
                            </div>
                        </form>
                    </div>
                </div> -->
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

     <!-- <div class="col-xl-4">

                
            </div>
            <div class="col-xl-8">

                <div class="card mb-4">
                    <div class="card-header">せんたくします</div>
                    <div class="card-body">
                        <form>

                            <div class="mb-3">
                                <label class="small mb-1" for="inputOldPassword">Old password</label>
                                <input class="form-control" id="inputOldPassword" type="password"
                                    placeholder="Enter your old password" value="">
                            </div>

                            <button class="btn btn-primary" type="button">Update password</button>
                        </form>
                    </div>
                </div>
            </div> -->
</body>

</html>