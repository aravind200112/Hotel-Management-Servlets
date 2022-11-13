<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

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
     table{
       font-size: 18px;
       
     }
     
     thead{
       background-color: #1f207c;
       color: coral;
     }
     td {
       background-color: #1f207c;
     }
     .tables{
       
     }
     h2{
       color: #1f207c;
       margin-top: 2%;
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
         
     <div align ="center">
        <h2>Update or Delete rooms</h2>
       
    </div>
    <div class="container-fluid tables my-5" align="center">
        <table class="table table-striped" >
           
   <thead>
    <tr>
      <th scope="col">Booking ID</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Checkin</th>
      <th scope="col">Checkout</th>
      <th scope="col">RoomType</th>
      <th scope="col">No. of Rooms</th>
      <th scope="col">Per Room Cost</th>
      <th scope="col">Amount</th>
      <th scope = "col"> </th>
    </tr>
  </thead>
    
            <c:forEach var="hotel" items="${listUser}">
                <tr class="p-3">
                    <td class="p-3"><c:out value="${hotel.id}" /></td>
                    <td class="p-3"><c:out value="${hotel.name}" /></td>
                    <td class="p-3"><c:out value="${hotel.email}" /></td>
                    <td class="p-3"><c:out value="${hotel.checkin}" /></td>
                    <td class="p-3"><c:out value="${hotel.checkout}" /></td>
                    <td class="p-3"><c:out value="${hotel.roomtype}" /></td>
                    <td class="p-3"><c:out value="${hotel.room_num}" /></td>
                    <td class="p-3"><c:out value="${hotel.rate}" /></td>
                    <td class="p-3"><c:out value="${hotel.cost}" /></td>
                    <td class="table-buttons p-3">
                        <div class="d-flex justify-content-center">
               
                      <a href="/edit?id=<c:out value='${hotel.id}' />"><button class="mx-1" style="text-align: center;" >Edit</button></a>
                      <a href="/delete?id=<c:out value='${hotel.id}' />"><button class="mx-1" style="text-align: center;" >Delete</button></a>
                      
                      </div>
                                      
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>            
     
</body>
</html>


