<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Paradize-Booking</title>

        <meta charset="UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
       
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
</head>
<style>
    
    
    .contents{
        background-color: #242582;
    }
    h6{
      font-size: 19px;
      color: coral;
    }
    .contents p{
      font-size:15px;
      color: white;
    }
    .contents .text-light{
       color: coral;
    }   
    nav {
      background-color: #242582;
    }
    button{
      border-color: coral;
      padding: 10px;
      background-color: #1f207c;
      border-radius: 3px;
      color: coral;
    }
    label{
      color: white;
    }
    .date-form{
      color: #1f207c;
      font-weight: bold;
    }
    
    button:hover{
      background-color: coral;
      color: white;
    }
    button .navbar-text:hover{
      color: white;
    }
    a{
      text-decoration: none;
      
    }
    
    
    .nav-item a:hover{
        
        border-bottom-style: solid;
        border-color: white;
        color: white;
    }
    nav{
      font-size: 16px;
      
    }
    nav .active {
    
       border-bottom-style: solid;
        border-color: white;
    }
    .navbar-collapse .active a{
    
       color:white;
    }
     .navbar-text{
       color: coral;
     }
     .nav-item a{
       color: white;
       font-weight: 30px;
     }
     .card{
       background-color: #1f207c;
     }
     h4{
       color: coral;
     }
     .create-button{
       border-top-style: solid;
       border-color: white;
     }
     p{
      color: coral;
      font-size: 16px;
     }
    
    
</style>
<body>
  
  <nav class="navbar navbar-expand-lg ">
            <div class="container-fluid ">
              <a class="navbar-brand" href="#"><img src="logo.png" alt="logo"></a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <%--<li class="nav-item mx-2">
                    <a class="nav-link active text-white" aria-current="page" href="#">Home</a>
                  </li> --%>
                  <li class="nav-item mx-2">
                    <a class="nav-link" href="#">Home</a>
                  </li>
                  <li class="nav-item mx-2">
                    <a class="nav-link" href="#">About us</a>
                  </li>
                  <li class="nav-item mx-2">
                    <a class="nav-link" href="#">Contact us</a>
                  </li>
                  
                </ul>

               <a href="book.jsp"> <button class="navbar-text mx-2">
                    Book Now
                  </button></a>
                 <a href="login.jsp"> <button class="navbar-text mx-2">
                    Login/SignUp
                  </button></a>
              </div>
            </div>
           
          </nav>
     
       
    <div class="container mt-4">
       <div class="row d-flex justify-content-center column" >
           <div class = "col-md-4">
              <div class="card px-3">
                <div class="card-body">
                <form action=LoginServlet method=post id="loginform">
                   <h4 class="text-center">Login</h4><br>
                  <div class="class mb-3">
                     
                     <input type="email" class="form-control" name="txtname" id="InputName1" placeholder="Enter your email" required>
                  </div><br>
                  <div class="class mb-3">
                   
                    <input type="password" class="form-control" name="txtpwd" id="InputPwd1" placeholder="Enter your password" required>
                  </div>
 
                      
                 
                  <input type="hidden" id="fail" value="<%= request.getAttribute("status")%>">
                  
                <p class="disp mt-2 text-center" id="disp"></p>

             </form>
             
                      <div class="d-flex justify-content-center mt-4">
               
                      <button type=submit name="room-type" form="loginform" style="text-align: center;" >Submit</button>
                      <a href="forgot.jsp"><button class="mx-3" style="text-align: center;" >Forgot Password</button></a>
                      
                      </div>
             
                </div>
                <div class="create-button d-flex justify-content-center mb-4">
               
                      <a href="register.jsp"><button  class="mt-4" style="text-align: center;" >Are you a new member? Sign up</button></a>
                      </div>
              </div>
             
           </div>
       </div>
    </div>
 
      
 <script>
 $(document).ready(function() {
	   
	 
	  if($("#fail").val() == 'failed'){
		  $("p").text("Your username and password is incorrect.");
	  }
	
	  
  });
  
 </script>
</body>
</html>