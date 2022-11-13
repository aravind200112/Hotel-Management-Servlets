<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Paradize-User Dashboard</title>

        <meta charset="UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
       
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
</head>
<style>
    
    
    .contents{
        background-color: #242582;
        border-radius: 10px;
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
      padding: 15px;
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
     
</style>
<body>
  <input type="hidden" id="fail-v" value="<%= request.getAttribute("user")%>">
  <nav class="navbar navbar-expand-lg ">
            <div class="container-fluid ">
              <a class="navbar-brand" href="#"><img src="logo.png" alt="logo"></a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item mx-2">
                    <a class="nav-link active text-white" aria-current="page" href="#">Dashboard</a>
                  </li>
                  <li class="nav-item mx-2">
                    <a class="nav-link" href="#">Help</a>
                  </li>
                 
                  
                </ul>

               
                 <button class="navbar-text mx-2 welcome">
                    Welcome <%= session.getAttribute("name") %>
                  </button>
              </div>
            </div>
           
          </nav>
     
       
        <div class="container text-center my-3 p-3">
             <div class="row gx-5">
                 <div class="col ">
                    <div class="contents p-3 ">
                       <h6 class="text-center">New Bookings</h6>
                       
                       <p class="p-2">Click the below button to reserve new rooms for your journey</p>
                           <br>  <div class="d-flex justify-content-center mt-2">
               
                                <a href="book.jsp"><button  class="book-1" style="text-align: center;" >Click here</button></a> 
                              </div>
                              <br>
                           
                       
                    </div>
                 </div>
                 <div class="col">
                                        <div class="contents p-3 ">
                       <h6 class="text-center">Update Bookings </h6>
                       
                       <p class="p-2">Click the below button to extend or update your previous bookings. </p>
                            <br> <div class="d-flex justify-content-center mt-2">
               
                                <a href="<%= request.getContextPath() %>/list" ><button  class="book-2" style="text-align: center;" >Click here</button></a>
                              </div>
                              <br>
                           
                    </div>

                 </div>
                 <div class="col">
                         <div class="contents p-3">
                       <h6 class="text-center">Cancel Bookings </h6>
                       
                       <p class="p-2">Click the below button to cancel the rooms or to totally cancel the bookings. </p>
                          <br>   <div class="d-flex justify-content-center mt-2">
               
                                 <button  class="book-3" style="text-align: center;" >Click here</button>
                              </div>
                              <br>
                              
                          
                       
                    </div>

                 </div>
                
             </div>
          
        </div>
           
 
      
 <script>
 
 </script>
</body>
</html>