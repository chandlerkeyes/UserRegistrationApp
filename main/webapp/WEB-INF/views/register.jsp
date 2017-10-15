<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 7/21/2017
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spring Demo</title>
    <style>
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
<form action="/addUserSuccess">
    <div class="container">
        <label><b>First Name</b></label>
        <input type="text" placeholder="Enter Name" name="firstName" required>

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
