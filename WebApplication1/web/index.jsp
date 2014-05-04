<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Weather Analyzer</title>
</head>
<h1>Weather Analyzer</h1>
<body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
What do you want to query? : <br><br>
	<form action="MyServlet" method="post">
		<input type="radio" name="sel1" value="max_temp">Max Temperatures<br>
                <input type="radio" name="sel1" value="min_temp">Min Temperatures<br>
		<input type="radio" name="sel1" value="dew">Dew<br>
		<input type="radio" name="sel1" value="wind_speed">Wind Speed<br>
		<input type="radio" name="sel1" value="slp">Sea Level Pressure<br>
		<input type="radio" name="sel1" value="visib">Visibility<br>
		<input type="radio" name="sel1" value="prcp">Precipitation<br>
		<input type="radio" name="sel1" value="snow_depth">Snow Depth<br><br>
	
Selection Criteria:<br><br>

		<input type="radio" class="year" value="year" name="sel2">Year 
		<select name="crt" class="yearMenu" disabled>
			  <option value="year">Year</option>
			  <option value="2010">2010</option>
			  <option value="2011">2011</option>
			  <option value="2012">2012</option>
			  <option value="2013">2013</option>
		</select>

		<input type="radio" class="state" value="state" name="sel2" >State
		<select name="crt" class="stateMenu" disabled>
			  <option value="state">State</option>
			  <option value="california">California</option>
			  <option value="arizona">Arizona</option>
			  <option value="florida">Florida</option>
			  <option value="newyork">New York</option>
		</select>
		<br><br>
		<input type="submit" value="submit" />
		
		
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