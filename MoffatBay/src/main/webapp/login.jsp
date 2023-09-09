<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.moffat.bay.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  


<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inria+Serif&family=Jim+Nightshade&display=swap"
        rel="stylesheet">
    <title>About Us</title>
    <style>
        /* Reset some default styles */
        body,
        h1,
        h2,
        h3,
        p,
        ul,
        li {
            margin: 0;
            padding: 0;
        }

        /* Global styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            color: #333;
            line-height: 1.6;
        }

        container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;

        }

        /* Header styles */
        header {
            background-color: #386E70;
            color: #fff;
            padding: 15px 0;
        }

        .hotel-title {
            font-family: 'Jim Nightshade', cursive;
            font-size: 40px;
            text-align: center;
            margin: 0;
        }

        /* Navigation styles */
        nav {
            background-color: #386E70;
            border-top: 3px solid #959FD6;
        }

        .navbar-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 15px 0;

        }

        .navbar {
            list-style: none;
            display: flex;
        }

        .navbar li {
            margin-right: 20px;
            position: relative;

        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease-in-out;
            padding: 10px;

        }

        .navbar a:hover {
            color: #959FD6;
        }

        /* Dropdown styles */
        .navbar li ul {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #386E70;
            padding: 0;
            z-index: 1;
            border-radius: 4px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            transition: opacity 0.3s ease-in-out;
        }

        .navbar li:hover ul {
            display: block;
            opacity: 1;
        }

        .navbar li ul li {
            display: block;
            width: 100%;
            margin: 0;
        }

        .navbar li ul li a {
            color: white;
            padding: 10px;
            display: block;
            text-decoration: none;
            transition: background-color 0.3s ease-in-out;
        }

        .navbar li ul li a:hover {
            background-color: #698F9E;
        }

        /* Modern-looking login button */
        .login-button a {
            background-color: #009688;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            transition: background-color 0.3s ease-in-out;
            text-decoration: none;
        }

        .login-button a:hover {
            background-color: #007a6d;
        }

        /* Main content styles */
        .about {
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .about-title {
            font-size: 36px;
            text-align: center;
            margin-bottom: 20px;
        }

        .slogan {
            font-size: 18px;
            text-align: center;
            margin-bottom: 30px;
        }

        /* Timeline styles */
        .container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
        }

        .timeline {
            border: 2px solid #009688;
            background-color: #fff;
            padding: 20px;
            margin: 10px;
            border-radius: 5px;
            max-width: 400px;
            margin-left: 100px;
        }

        .event {
            border: 2px solid #009688;
            background-color: #fff;
            padding: 20px;
            margin: 10px;
            border-radius: 5px;
            max-width: 400px;
            display: none;
        }

        .event h3 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .timeline-controls {
            margin-top: 20px;
            text-align: center;
            margin-bottom: 40px;
        }


        .timeline-controls button {
            background-color: #009688;
            color: #fff;
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            transition: background-color 0.3s ease-in-out;
            cursor: pointer;
        }

        .timeline-controls button:hover {
            background-color: #007a6d;
        }

        .picture {
            flex-grow: 1;

            margin-left: 480px;

        }

        .picture img {
            max-width: 100%;
            height: auto;
        }

        /* Styling for the container */
        .contact-location-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            margin-top: 20px;

        }

        /* Styling for the contact form container */
        .contact-form-container {
            width: 30%;
            background-color: #f4f4f4;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;

        }

        /* Styling for form fields */
        .contact-form label {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .contact-form button {
            background-color: #009688;
            color: #fff;
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .contact-form button:hover {
            background-color: #007a6d;
        }

        /* Styling for the location image container */
        .location-image-container {
            width: 100%;
            margin-top: 20px;
            display: flex;
            justify-content: center;

        }

        .location-image {
            max-width: 100%;
            height: auto;
        }

        /* Styling for the "Contact Us" heading box */
        .contact-heading {
            background-color: #009688;
            color: #fff;
            padding: 20px;
            border-radius: 10px 10px 0 0;
            /* Rounded top corners */
            text-align: center;
            font-weight: bold;
            font-size: 24px;
        }
		
		.center-container {
			text-align: center
		}

/* Center-align the form elements */
        form {
            display: inline-block; /* Ensures the form is centered */
            text-align: left; /* Reset text alignment within the form */
            max-width: 300px; /* Limit the width of the form for better readability */
            margin: 0 auto; /* Center the form horizontally within the container */
        }

        /* Style the labels for better alignment */
        label {
            display: block; /* Make labels appear on separate lines */
            margin-bottom: 5px; /* Add some vertical spacing between labels and inputs */
        }

        /* Style the text inputs */
        input[type="text"] {
            width: 100%; /* Make the text inputs take up the full width of the form */
            padding: 10px; /* Add some padding for better visual spacing */
            margin-bottom: 10px; /* Add some vertical spacing between inputs */
            border: 1px solid #ccc; /* Add a border for better visual separation */
            border-radius: 4px; /* Add rounded corners */
            box-sizing: border-box; /* Include padding and border in the total width */
        }
        
        .login-now-button {
    		background-color: #386E70;
    		color: white;
    		padding: 10px 20px;
    		border: none;
    		border-radius: 4px;
    		cursor: pointer;
    		font-size: 18px;
		}

        /* Footer styles */
        footer {
            background-color: #386E70;
            color: #fff;
            padding: 30px 0;
            text-align: center;
        }

        .footer-content {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .footer-section {
            width: 25%;
            padding: 0 15px;
            box-sizing: border-box;
        }

        .footer-section h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .footer-section p,
        .footer-section ul {
            font-size: 14px;
        }

        .footer-section ul {
            list-style: none;
            padding: 0;
        }

        .footer-section ul li {
            margin-bottom: 5px;
        }

        .footer-section ul li a {
            color: #fff;
            text-decoration: none;
        }

        .footer-section ul li a:hover {
            color: #959FD6;
        }

        .footer-bottom {
            margin-top: 20px;
            padding-top: 10px;
            border-top: 3px solid #959FD6;
        }

        .footer-bottom p {
            font-size: 12px;
        }
    </style>
</head>
<body>

	<nav>
	    <div class="navbar-container">
	        <h2 class="hotel-title">Moffat Bay</h2>
	        <ul class="navbar">
	            <li><a href="index.jsp">Home</a></li>
	            <li><a href="Aboutus.jsp">About</a></li>
	            <li><a href="#">Attractions</a> </li>
	
	            <li>
	                <a href="#">Reservation</a>
	                <ul>
	                    <li><a href="reservation.jsp">Book a Reservation</a></li>
	                    <li><a href="#">Reservation Look up</a></li>
	                    <li><a href="register.jsp">Create an Account</a></li>
	                </ul>
	            </li>
	            <li><a href="#">Contact</a></li>
	            <li class="login-button"><a href="login.jsp">Login</a></li>
	        </ul>
	    </div>

    </nav>
    <div class="center-container">
    
        <c:if test = "${not empty successfulRegistrationMessage}">
			<h2>${successfulRegistrationMessage}</h2>
		</c:if>	
        <h2 class>Please enter your credentials to login</h2>

        <form action="/MoffatBay/login" method="post">

            <label for="email">Email:  </label>
            <input type="text" name="email" id="email" required><br>
            <p>
            
            <label for="password">Password:</label>
            <input type="text" name="password" id="password" required><br>
            <p>
            <input type="submit" value="Submit" class="login-now-button">
            
            <%
                String error_msg = (String) request.getAttribute("message");
            %>
            
            <h3 style="color: red">${message}</h3>
            <br>
            <br>
            <br>
        </form>
    </div>
    
    <footer>
	    <div class="footer-content">
	        <div class="footer-section">
	            <h3>About Us</h3>
	            <p>Discover the beauty of Moffat Bay Resort, where nature meets luxury.</p>
	        </div>
	        <div class="footer-section">
	            <h3>Attractions</h3>
	            <ul>
	                <li><a href="#">Beaches</a></li>
	                <li><a href="#">Hiking Trails</a></li>
	                <li><a href="#">Wildlife Tours</a></li>
	            </ul>
	        </div>
	        <div class="footer-section">
	            <h3>Reservations</h3>
	            <ul>
	                <li><a href="reservation.jsp">Book Now</a></li>
	                <li><a href="#">Reservation Look up</a></li>
	            </ul>
	        </div>
	        <div class="footer-section">
	            <h3>Account</h3>
	            <ul>
	                <li><a href="login.jsp">Login</a></li>
	                <li><a href="registration.jsp">Create an account</a></li>
	            </ul>
	        </div>
	    </div>
	    <div class="footer-bottom">
	        <p>&copy; 2023 Moffat Bay Resort. All rights reserved.</p>
	    </div>
	</footer>


</body>
</html>
