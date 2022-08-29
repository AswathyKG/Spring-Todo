<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
	    <!-- -----------------------Incude header------------------- -->
	    <%@ include file="common/header.jspf" %>
	       
        <style>
        <!-- ----------------------- style for the table ------------------------------- -->
        @import 'https://fonts.googleapis.com/css?family=Open+Sans:600,700';
		
		* {font-family: 'Open Sans', sans-serif;}
		
		.rwd-table {
		  margin: auto;
		  min-width: 300px;
		  max-width: 100%;
		  border-collapse: collapse;
		}

		
		.rwd-table tr {
		  border-top: 1px solid #ddd;
		  border-bottom: 1px solid #ddd;
		}
		
		.rwd-table td:first-child {
		  margin-top: .5em;
		}
		
		.rwd-table td:last-child {
		  margin-bottom: .5em;
		}
		
		.rwd-table td:before {
		  content: attr(data-th) ": ";
		  font-weight: bold;
		  width: 120px;
		  display: inline-block;
		  color: #000;
		}
		
		.rwd-table th,
		.rwd-table td {
		  text-align: left;
		}
		
		.rwd-table {
		  color: #333;
		  border-radius: .4em;
		  overflow: hidden;
		}
		
		.rwd-table tr {
		  border-color: #bfbfbf;
		}
		
		.rwd-table th,
		.rwd-table td {
		  padding: .5em 1em;
		}
		@media screen and (max-width: 601px) {
		  .rwd-table tr:nth-child(2) {
		    border-top: none;
		  }
		}
		@media screen and (min-width: 600px) {
		  .rwd-table tr:hover:not(:first-child) {
		  }
		  .rwd-table td:before {
		    display: none;
		  }
		  .rwd-table th,
		  .rwd-table td {
		    display: table-cell;
		    padding: .25em .5em;
		  }
		  .rwd-table th:first-child,
		  .rwd-table td:first-child {
		    padding-left: 0;
		  }
		  .rwd-table th:last-child,
		  .rwd-table td:last-child {
		    padding-right: 0;
		  }
		  .rwd-table th,
		  .rwd-table td {
		    padding: 1em !important;
		  }
		}
		
		
		/* THE END OF THE IMPORTANT STUFF */
		
		/* Basic Styling */

		h1 {
		  text-align: center;
		  font-size: 2.4em;
		  color: #f2f2f2;
		}
		.container {
		  display: block;
		  text-align: center;
		}
		h3 {
		  display: inline-block;
		  position: relative;
		  text-align: center;
		  font-size: 1.5em;
		  color: #cecece;
		}
		h3:before {
		  content: "\25C0";
		  position: absolute;
		  left: -50px;
		  -webkit-animation: leftRight 2s linear infinite;
		  animation: leftRight 2s linear infinite;
		}
		h3:after {
		  content: "\25b6";
		  position: absolute;
		  right: -50px;
		  -webkit-animation: leftRight 2s linear infinite reverse;
		  animation: leftRight 2s linear infinite reverse;
		}
		@-webkit-keyframes leftRight {
		  0%    { -webkit-transform: translateX(0)}
		  25%   { -webkit-transform: translateX(-10px)}
		  75%   { -webkit-transform: translateX(10px)}
		  100%  { -webkit-transform: translateX(0)}
		}
		@keyframes leftRight {
		  0%    { transform: translateX(0)}
		  25%   { transform: translateX(-10px)}
		  75%   { transform: translateX(10px)}
		  100%  { transform: translateX(0)}
		}
		
		/*
		    Don't look at this last part. It's unnecessary. I was just playing with pixel gradients... Don't judge.
		*/
		/*
		@media screen and (max-width: 601px) {
		  .rwd-table tr {
		    background-image: -webkit-linear-gradient(left, #428bca 137px, #f5f9fc 1px, #f5f9fc 100%);
		    background-image: -moz-linear-gradient(left, #428bca 137px, #f5f9fc 1px, #f5f9fc 100%);
		    background-image: -o-linear-gradient(left, #428bca 137px, #f5f9fc 1px, #f5f9fc 100%);
		    background-image: -ms-linear-gradient(left, #428bca 137px, #f5f9fc 1px, #f5f9fc 100%);
		    background-image: linear-gradient(left, #428bca 137px, #f5f9fc 1px, #f5f9fc 100%);
		  }
		  .rwd-table tr:nth-child(odd) {
		    background-image: -webkit-linear-gradient(left, #428bca 137px, #ebf3f9 1px, #ebf3f9 100%);
		    background-image: -moz-linear-gradient(left, #428bca 137px, #ebf3f9 1px, #ebf3f9 100%);
		    background-image: -o-linear-gradient(left, #428bca 137px, #ebf3f9 1px, #ebf3f9 100%);
		    background-image: -ms-linear-gradient(left, #428bca 137px, #ebf3f9 1px, #ebf3f9 100%);
		    background-image: linear-gradient(left, #428bca 137px, #ebf3f9 1px, #ebf3f9 100%);
		  }
		}*/
       
        </style>
	</head>
    <body>
    <!-- -----------------------Incude navigation------------------- -->
    <%@ include file="common/navigation.jspf" %>
    
    <div class="hero">
        <div class="container">
            <h1>${name}'s Todo List</h1>
            <p>making your path unique the way you are</p>
        </div>
    </div>
    <section class="container content">	        
    	<div class="container">
		  <table class="rwd-table">	
		  	<thead>
		  		<tr>
			        <th>ID</th>
			        <th>Task</th>
			        <th>Description</th>
			        <th>Target Date</th>
			        <th>Status</th>
			        <th colspan="2">Action</th>
		      	</tr>
		  	</thead>
		    <tbody>
		    <c:forEach items="${todos}" var="todo">
		      <tr>
		        <td>${todo.id}</td>
		        <td>${todo.task}</td>
		        <td>${todo.description}</td>
		        <td>${todo.targetDate}</td>
		        <td>${todo.status}</td>
		        <td><a href="update-todo?id=${todo.id}"><i class="bi-pencil" style="font-size: 24px;"></i></a></td>
		        <td><a href="delete-todo?id=${todo.id}"><i class="bi-trash" style="font-size: 24px; color: red;"></i></a></td>
		      </tr>
			</c:forEach>
		    </tbody>			  
		  </table>
		  <br>
		  <h3><a href="add-todos"  class="btn btn-info">Add Todo</a></h3>
		</div>
    
     </section>
     <!-- -----------------------Incude footer------------------- -->
    <%@ include file="common/footer.jspf" %>
   
    </body>
</html>
