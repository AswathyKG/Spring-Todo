<!-- Spring's form tag library -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
	    <!-- -----------------------Incude header------------------- -->
	    <%@ include file="common/header.jspf" %>
        <style>
        <!-- ------------------------------ style for the form -------------------------------- -->
        #feedback-form {
		  width: 280px;
		  margin: 0 auto;
		  background-color: #fcfcfc;
		  padding: 20px 50px 40px;
		  box-shadow: 1px 4px 10px 1px #aaa;
		  font-family: sans-serif;
		}
		
		#feedback-form * {
		    box-sizing: border-box;
		}
		
		#feedback-form h2{
		  text-align: center;
		  margin-bottom: 30px;
		}
		
		#feedback-form input {
		  margin-bottom: 15px;
		}
		
		#feedback-form input[type=text] {
		  display: block;
		  height: 32px;
		  padding: 6px 16px;
		  width: 100%;
		  border: none;
		  background-color: #f3f3f3;
		}
		
		#feedback-form input[type=date] {
		  display: block;
		  height: 32px;
		  padding: 6px 16px;
		  width: 100%;
		  border: none;
		  background-color: #f3f3f3;
		}
		
		#feedback-form label {
		  color: #777;
		  font-size: 0.8em;
		}
		
		#feedback-form input[type=checkbox] {
		  float: left;
		}
		
		#feedback-form input:not(:checked) + #feedback-phone {
		  height: 0;
		  padding-top: 0;
		  padding-bottom: 0;
		}
		
		#feedback-form #feedback-phone {
		  transition: .3s;
		}
		
		#feedback-form button[type=submit] {
		  display: block;
		  margin: 20px auto 0;
		  width: 150px;
		  height: 40px;
		  border-radius: 25px;
		  border: none;
		  color: #eee;
		  font-weight: 700;
		  box-shadow: 1px 4px 10px 1px #aaa;
		  
		  background: #207cca; /* Old browsers */
		  background: -moz-linear-gradient(left, ##2c4755 0%, #10cab7 100%); /* FF3.6-15 */
		  background: -webkit-linear-gradient(left, #2c4755 0%,#10cab7 100%); /* Chrome10-25,Safari5.1-6 */
		  background: linear-gradient(to right, #2c4755 0%,#10cab7 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
		  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#207cca', endColorstr='#9f58a3',GradientType=1 ); /* IE6-9 */
		}
		.error{
		color: red;
		}
        
        </style>
	</head>
    <body>
    <!-- -----------------------Incude navigation------------------- -->
    <%@ include file="common/navigation.jspf" %>
    
    <div class="hero">
        <div class="container">
            <h1>Create ${name}'s Task</h1>
            <p>making your path unique the way you are</p>
        </div>
    </div>
    <section class="container content">
    <div id="feedback-form">
  		<h2 class="header">Add Your New Task</h2>
	 	<div>
		    <form:form method= "post" autocomplete="off" modelAttribute="todo">
		    	
			      <form:input path="task" type="text" name="task" placeholder="Task" required="required" />
			      <form:errors path="task" class="error"></form:errors>
			    
			      <form:input path="description" type="text"  name="description" placeholder="Description" required="required" rows="3" />
			      <form:errors path="description" class="error"></form:errors>
			    
			      <form:label path="targetDate" for="feedback-notify">Target Date </form:label>
			      <form:input path="targetDate" type="date" name="date" placeholder="Target Date" required="required"></form:input>
			      <!-- <input type="text" id="feedback-phone" name="phone" placeholder="Phone number"></input>  -->
			    
			      <form:input path="id" type="hidden"/>
			      <form:input path="status" type="hidden"/>
			      
			      <button type="submit">Add</button>
		    </form:form>
	 	</div>
	 </div>
	</section>
    
     <!-- -----------------------Incude footer------------------- -->
    <%@ include file="common/footer.jspf" %>    
    </body>
</html>
