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
     h3{
      color: #1f2073;
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
                  <li class="nav-item mx-2">
                    <a class="nav-link active text-white" aria-current="page" href="#">Home</a>
                  </li>
                  <li class="nav-item mx-2">
                    <a class="nav-link" href="#">About us</a>
                  </li>
                  <li class="nav-item mx-2">
                    <a class="nav-link" href="#">Contact us</a>
                  </li>
                  
                </ul>

              
                 <button class="navbar-text mx-2 welcome">
                    Welcome <%= session.getAttribute("name") %>
                  </button>
              </div>
            </div>
           
          </nav>
     <h3 class="fail-status text-center mt-3">Sorry the rooms are not available at the specified dates. Try another dates</h3>
     <h3 class="success-status text-center mt-3">The rooms have been booked Successfully.</h3>
        <div class="container date-contents my-5">
        <form id="bookform" action=BookServlet method=post>
            <div class="row d-flex justify-content-center">
                 <div class="col-md-5">
                      <label class="date-form" for="fromdate">Check in Date: </label>
                       <input type="date" class="form-control" id="fromdate" name="checkin">
                 </div>
                 
                 <div class="col-md-5">
                                <label class="date-form" for="todate">Check out Date:  </label>
                                 <input type="date" class="form-control"  id="todate" name="checkout">
                 </div> 
                  <input type="hidden" id="fail" value="<%= request.getAttribute("status")%>">
            </div>
        </form>
        </div>
        <div class="container text-center my-3 p-3">
             <div class="row gx-5">
                 <div class="col ">
                    <div class="contents p-3 ">
                       <h6 class="text-center">Type A </h6>
                       <h6 class="text-center">INR 1000 <i>(Per Night)</i></h6><br>
                       <p class="p-2">32inch LCD TV, All basic Bathroom Amenities, Complimentary Drinking Water, Attached bathroom with cubical shower. Complementary Breakfast Included Complimentary Wireless Internet, In Room Safety Locker, Iron box Cum Board, Mini Bar, Twin / Double Bed rooms (317 Sq ft), Tea / Coffee maker, Wall mount hair Dryer.</p>
                           <br>  <div class="d-flex justify-content-center mt-2">
               
                                 <button  class="book-1" style="text-align: center;" >Click here</button>
                              </div>
                              <br>
                           <div class="check-1">   
                              <div class="d-flex justify-content-center">
                                  <label for="majesty"><b>Number of Rooms: </b></label><br>
                                  <select class="form-select form-select-sm mb-3 mx-3" id="booking" form="bookform" name="num_book-1" style="width:20%;" required>
                   
                                       <option value="1">1</option>
                                       <option value="2">2</option>
                                       <option value="3">3</option>
                                       <option value="4">4</option>
                                       <option value="5">5</option>
                                       <option value="6">6</option>
                                       <option value="7">7</option>
                                       <option value="8">8</option>
                                       <option value="9">9</option>
                                       <option value="10">10</option>
                    
                 
                                   </select>
               
                              </div>
                              <br>
                              <div class="d-flex justify-content-center mt-2">
               
                      <button type=submit value="Type-A" name="room-type" style="text-align: center;" form="bookform">Book Now</button>
                      </div>
                      </div>
                       
                    </div>
                 </div>
                 <div class="col">
                                        <div class="contents p-3 ">
                       <h6 class="text-center">Type B </h6>
                       <h6 class="text-center">INR 1500 <i>(Per Night)</i></h6><br>
                       <p class="p-2">32inch LCD TV, All basic Bathroom Amenities, Complimentary Drinking Water, Attached bathroom with cubical shower. Complementary Breakfast Included Complimentary Wireless Internet, In Room Safety Locker, Iron box Cum Board, Mini Bar, Twin / Double Bed rooms (317 Sq ft), Tea / Coffee maker, Wall mount hair Dryer.</p>
                            <br> <div class="d-flex justify-content-center mt-2">
               
                                 <button  class="book-2" style="text-align: center;" >Click here</button>
                              </div>
                              <br>
                           <div class="check-2">   
                              <div class="d-flex justify-content-center">
                                  <label for="majesty"><b>Number of Rooms: </b></label><br>
                                  <select class="form-select form-select-sm mb-3 mx-3" id="booking" form="bookform" name="num_book-2" style="width:20%;" required>
                   
                                       <option value="1">1</option>
                                       <option value="2">2</option>
                                       <option value="3">3</option>
                                       <option value="4">4</option>
                                       <option value="5">5</option>
                                       <option value="6">6</option>
                                       <option value="7">7</option>
                                       <option value="8">8</option>
                                       <option value="9">9</option>
                                       <option value="10">10</option>
                    
                 
                                   </select>
               
                              </div>
                              <br>
                              <div class="d-flex justify-content-center mt-2">
               
                      <button type=submit value="Type-B" name="room-type" style="text-align: center;" form="bookform">Book Now</button>
                      </div>
                      </div>
                       
                    </div>

                 </div>
                 <div class="col">
                         <div class="contents p-3">
                       <h6 class="text-center">Type C </h6>
                       <h6 class="text-center">INR 1700 <i>(Per Night)</i></h6><br>
                       <p class="p-2">32inch LCD TV, All basic Bathroom Amenities, Complimentary Drinking Water, Attached bathroom with cubical shower. Complementary Breakfast Included Complimentary Wireless Internet, In Room Safety Locker, Iron box Cum Board, Mini Bar, Twin / Double Bed rooms (317 Sq ft), Tea / Coffee maker, Wall mount hair Dryer.</p>
                          <br>   <div class="d-flex justify-content-center mt-2">
               
                                 <button  class="book-3" style="text-align: center;" >Click here</button>
                              </div>
                              <br>
                           <div class="check-3">   
                              <div class="d-flex justify-content-center">
                                  <label for="majesty"><b>Number of Rooms: </b></label><br>
                                  <select class="form-select form-select-sm mb-3 mx-3" id="booking" form="bookform" name="num_book-3" style="width:20%;" required>
                   
                                       <option value="1">1</option>
                                       <option value="2">2</option>
                                       <option value="3">3</option>
                                       <option value="4">4</option>
                                       <option value="5">5</option>
                                       <option value="6">6</option>
                                       <option value="7">7</option>
                                       <option value="8">8</option>
                                       <option value="9">9</option>
                                       <option value="10">10</option>
                    
                 
                                   </select>
               
                              </div>
                              <br>
                              <div class="d-flex justify-content-center mt-2">
               
                      <button type=submit value="Type-C" name="room-type" style="text-align: center;" form="bookform">Book Now</button>
                      </div>
                      </div>
                       
                    </div>

                 </div>
                
             </div>
          
        </div>
           
 
      
 <script>
     $(".fail-status").hide();
     $(".success-status").hide();
     $(".check-1").hide();
     $(".check-2").hide();
     $(".check-3").hide();
     $(document).ready(function() {
    	 $(".book-1").click(function(){
    		 
    		 $(".check-1").slideDown("slow","linear");
    		 $(".check-2").hide();
    	     $(".check-3").hide();
    	 });
    	 $(".book-2").click(function(){
    		 
    		 $(".check-2").slideDown("slow","linear");
    		 $(".check-1").hide();
    	     $(".check-3").hide();
    	 });
    	 
    	 $(".book-3").click(function(){
    		 
    		 $(".check-3").slideDown("slow","linear");
    		 $(".check-2").hide();
    	     $(".check-1").hide();
    	 });    	 
    	 
    	 if($("#fail").val() == 'failed'){
   		  $(".fail-status").show();
   		 $(".success-status").hide();
   	  }
    	 else if($("#fail").val() == 'success')
    		 {
    		 $(".fail-status").hide();
       		 $(".success-status").show();
    		 }
    	 
     });
  
 </script>
</body>
</html>