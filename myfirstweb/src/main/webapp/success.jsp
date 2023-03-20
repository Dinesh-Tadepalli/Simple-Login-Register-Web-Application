<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.108.0">
    <title>Signin Template · Bootstrap v5.3</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">

<%
String message = (String)request.getAttribute("message");
if (message == null) {
	message = "";
}
%>

<body>
	<center>
    <h1 class="h3 mb-3 fw-normal"><%=message%></h1>
    <p>
    <a href="/myfirstweb/SuccessToLoginServlet">Go back to login page.</a>
    </center>
  </body>
</html>
