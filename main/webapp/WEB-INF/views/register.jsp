<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 7/21/2017
  Time: 11:04 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <!-- This validates the zip code, the rest of the fields in the form are required,
    so the user wont be allowed to continue unless they enter their information -->

    <script>
        function validateForm() {
            var x = document.forms["registerForm"]["zipCode"].value;
            if (x.length < 5 || x.length > 9) {
                alert("invalid zip code");
                return false;
            }
            var y = document.forms["registerForm"]["country"].value;
            if (!(y == "US")) {
                alert("US only");
                return false
            }
        }
    </script>
    <!-- CSS TEMPLATE FOUND ON CODEPEN.IO-->
    <style>
        h3 {
            position: relative;
            color: #323C50;
            padding-left: 645px;
            font-family: 'Open Sans', sans-serif;
            top: 25px;
        }
        form {
            border: 1px solid black;
            margin: 50px 500px;
            padding: 0px 50px;
            background-color: #323C50;
        }
        label {
            color: tomato;
            font-family: 'Open Sans', sans-serif;
        }
        /* Full-width input fields */
        input[type=text], input[type=date] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        /* Set a style for all buttons */
        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        /* Extra styles for the cancel button */
        .cancel {
            padding: 14px 20px;
            background-color: #f44336;
        }

        /* Float cancel and signup buttons and add an equal width */
        .cancel,.signup {
            float: left;
            width: 50%;
        }

        /* Add padding to container elements */
        .container {
            padding: 16px;
        }

        /* Clear floats */
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }

        /* Change styles for cancel button and signup button on extra small screens */
        @media screen and (max-width: 300px) {
            .cancel, .signup {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<h3> Please enter your information in the required fields</h3>
<!-- Form that collects the user's information, and is then placed into mySQL database -->
<form name = "registerForm" onsubmit="return validateForm()" action="/addUserSuccess" method="get">
    <div class="container">
        <label><b>First Name</b></label>
        <input type="text" placeholder="Enter First Name" name="firstName" required>
        <label><b>Last Name</b></label>
        <input type="text" placeholder="Enter Last Name" name="lastName" required>
        <label><b>Address 1</b></label>
        <input type="text" placeholder="Enter Address" name="address1" required>
        <label><b>Address 2</b></label>
        <input type="text" placeholder="optional" name="address2">
        <label><b>City</b></label>
        <input type="text" placeholder="Enter City" name="city" required>
        <label><b>State</b></label>
        <input type="text" placeholder="Enter Address" name="state" required>
        <label><b>Zip</b></label>
        <input type="text" placeholder="Enter Zip Code" name="zipCode" required>
        <label><b>Country</b></label>
        <input type="text" placeholder="Enter Country" name="country" required>

        <div class="clearfix">
            <button type="button"  class="cancel">Cancel</button>
            <button type="submit" class="signup">Register</button>
        </div>
    </div>
</form>
</body>
</html>
