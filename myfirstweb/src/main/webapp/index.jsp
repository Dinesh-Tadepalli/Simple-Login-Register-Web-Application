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
<script src="js/bootstrap.bundle.min.js"></script>




<script type=text/javascript src="js/jquery.js"></script>
<script type=text/javascript src="js/jquery.validate.min.js"></script>
<script>
$.validator.setDefaults({
    errorPlacement: function (error, element) {
    	error.insertAfter(element.parent());
    }
  });
  
$().ready(function(){
	$('#loginform').validate({
		  rules: {
		    emailId: {
		      required: true,
		      email: true
		    },
	  		password: {
		  	  required: true
	  		}
		  },
		  messages: {
			  emailId: {
				  required: "Please enter your email address."
			  },
			  password: {
				  required: "Please enter your password."
			  } 
		  }
		});
		
	$('#loginbutton').click(function(){
		console.log('I am here');
		var val = $('#loginform').valid();
		if (val){
			
		}
		});
	
});


	
</script>


<%
String message = (String)request.getAttribute("message");

if (message == null) { 
	message = "<br>"; 
}
%>

<link href="css/bootstrap.min.css" rel="stylesheet">

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
    </style>

    
    <!-- Custom styles for this template -->
    <link href="css/sign-in.css" rel="stylesheet">
  </head>
  <body class="text-center">
<main class="form-signin w-100 m-auto">
  <div id="message-container"></div>
  <form action="/myfirstweb/LoginServlet" method="post" id="loginform">
   <p>
   <%=message%>
   </p>
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
    <br>
    <div class="form-floating">
      <input class="form-control" id="emailId" name="emailId" placeholder="name@example.com">
      <label for="floatingInput">Email address</label>
    </div>
    <p>
    <div class="form-floating">
      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
      <label for="floatingPassword">Password</label>

    </div>
	<p>
    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>

    <button class="w-100 btn btn-lg btn-primary" id="loginbutton" name="loginbutton">Sign in</button>
    <p>
    <p><a href="/myfirstweb/RegisterServlet">Create an account</a> </p>
  </form>
</main>
    
  </body>
</html>
