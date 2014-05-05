<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
    body
        {
            background:url('./propellers.jpg') no-repeat center center fixed;
            background-size: cover;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            margin: 0;
            padding: 0;
        }
    p.ex1 {margin-left:2cm;}
     p.ex2 {align = "right" style="vertical-align: top;"}
     
     
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Weather Analyzer</title>
</head>
<h1 align = center> <font size="10" color="black" style="font-family:arial;"> Weather Analytics </font> </h1>
<body> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<form action="MyServlet" method="post">
<div style= height:200px;width:400px;float:left;font-family:arial;font-size:18px> 
<p class="ex1"> Weather Conditions  
	<p class="ex1">
		<input type="radio" name="sel1" value="temp">Temperatures<br>
        
		<input type="radio" name="sel1" value="dew">Dew<br>
		<input type="radio" name="sel1" value="wind_speed">Wind Speed<br>
		<input type="radio" name="sel1" value="slp">Sea Level Pressure<br>
		<input type="radio" name="sel1" value="visib">Visibility<br>
		<input type="radio" name="sel1" value="prcp">Precipitation<br>
		<input type="radio" name="sel1" value="snow_depth">Snow Depth<br><br>
	</div>
	<br>
<div style =font-family:arial;font-size:20px>Selection Criteria:<br><br>

		<input type="radio" class="year" value="year" name="sel2">Year 
		<select name="crt" class="yearMenu" disabled>
                            <option value="year">Year</option>
			  <option value="2012">2012</option>
			  <option value="2013">2013</option>
			  <option value="2014">2014</option>
		</select>

		<input type="radio" class="state" value="state" name="sel2" >State
		<select name="crt" class="stateMenu" disabled>
			  <option value="state">State</option>
			  <option value="california">California</option>
			  <option value="arizona">Arizona</option>
			  <option value="florida">Florida</option>
			  <option value="newyork">New York</option>
		</select>
		</div>
		<br><br>
		<div style=text-align:left;margin:10px;float:left;> 
		<input type="submit" value="Submit" style="font-family:'arial';font-size:20px" />
		</div>
		
		<script>
		$('.year').click(function(){
   		 if($('.year').is(':checked')){
       		 $('.yearMenu').attr("disabled",false);
       		 $('.stateMenu').attr("disabled",true);
       		}
		});
		$('.state').click(function(){
		 if($('.state').is(':checked')){
         	$('.yearMenu').attr("disabled",true);
         	$('.stateMenu').attr("disabled",false);
			}
		});
		</script>
		
	</form> 
</body>
</html>