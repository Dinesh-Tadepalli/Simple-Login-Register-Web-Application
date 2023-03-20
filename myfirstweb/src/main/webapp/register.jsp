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
	
	$.validator.addMethod('strongUsername', function(value, element) {
	    return this.optional(element) 
	      || value.length >= 3
	  }, 'Your username must be at least 3 characters long')
	
	$.validator.addMethod('strongPassword', function(value, element) {
	    return this.optional(element) 
	      || value.length >= 6
	      && /\d/.test(value)
	      && /[a-z]/i.test(value);
	  }, 'Your password must be at least 6 characters long and contain at least one number and one character.')
	  
	$.validator.addMethod("validDOB", function(value, element) {              
            var from = value.split("-"); // YYYY,MM,DD
            
            var year = Number(from[0]);
            var month = Number(from[1]);
			var day = Number(from[2]);
            var age = 18;
			
            var setDate = new Date(year + age, month - 1, day);
            var currdate = new Date();
            console.log(currdate)
            console.log(setDate)
            if (currdate >= setDate) {
              // you are above 18
              return true;     
            } else {
              return false;
            }
        },
        "You must be at least 18 years old to register."
    );
	  
	$('#registerform').validate({
		  rules: {
		    emailId: {
		      required: true,
		      email: true
		    },
	  		username: {
		  	  required: true,
		  	  strongUsername: true
	  		},
	  		password: {
			  	  required: true,
			  	  strongPassword: true
		  	},
		  	password2: {
			  	  required: true,
			  	  equalTo: "#password"
		  	},
		  	DOB: {
			  	  required: true,
			  	  validDOB: true
		  	}		  			
		  },
		  
		  messages: {
			  emailId: {
				  required: "Please enter an email address."
			  },
			  username: {
				  required: "Please enter a username."
			  },
			  password: {
				  required: "Please enter a password."
			  },
			  password2: {
				  required: "Please confirm your password."
			  },
			  DOB: {
				  required: "Please enter your birthday."
			  }
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
  <form action="/myfirstweb/RegisterToSuccessServlet" method="post" id="registerform">
   <p>
   <%=message%>
   </p>
    <h1 class="h3 mb-3 fw-normal">Create your account</h1>
    <br>
    <div class="form-floating">
      <input class="form-control" id="emailId" name="emailId" placeholder="name@example.com">
      <label for="floatingInput">Email address</label>
    </div>
    <p>
    <div class="form-floating">
      <input class="form-control" id="username" name="username" placeholder="Username">
      <label for="floatingInput">Username</label>
    </div>
    <p>
    <div class="form-floating">
      <input type=password class="form-control" id="password" name="password" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>
    <p>
    <div class="form-floating">
      <input class="form-control" id="password2" name="password2" placeholder="Password2">
      <label for="floatingPassword">Confirm Password</label>
    </div>
    <p>
    <div class="form-floating">
      <input type="date" class="form-control" id="DOB" name="DOB" placeholder="mm/dd/yyyy">
      <label for="floatingInput">Date of Birth</label>
    </div>
	<p>
	<p>
    <button class="w-100 btn btn-lg btn-primary" id="registerbutton" name="registerbutton">Register</button>
    <p>
    <p><a href="/myfirstweb/RegisterToLoginServlet">Already have an account? Log in</a> </p>
  </form>
</main>
    
  </body>
</html>
