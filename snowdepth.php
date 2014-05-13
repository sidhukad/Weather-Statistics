<?php
$state = $_GET["state"];
$year = $_GET["year"];

$con = mysql_connect("mysql-weatheranalytics.jelastic.servint.net","root","N7wEqmtKjI") or die("Failed to connect mySql ".mysql_error());
$selectDB = mysql_select_db("climate",$con) or die("\nError in selecting db ".mysql_error()); 

$qry = "select MAX(Snow) as 'MaxSnow' from climate1 where State='$state' and Year='$year' group by Month ";
$result=mysql_query($qry,$con) or die("\nError in execution: ".mysql_error());
$rows = array();
$rows['name'] = 'Maximum' ;
while($r = mysql_fetch_array($result)) {
	$rows['data'][] = $r['MaxSnow'] ;
}

$qry = "select MIN(Snow) as 'MinSnow' from climate1 where State='$state' and Year='$year' group by Month";
$result=mysql_query($qry,$con) or die("\nError in execution: ".mysql_error());
$rows1 = array();
$rows1['name'] = 'Minimum' ;
while($rr = mysql_fetch_assoc($result)) {
	$rows1['data'][] = $rr['MinSnow'] ;
}

$finalResult = array();
array_push($finalResult, $rows);
array_push($finalResult, $rows1);

//var_dump($finalResult);
//print json_encode($finalResult, JSON_NUMERIC_CHECK);

mysql_close($con);
//header('Location: final.php');
?>




<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
    var chart;
    var datum = '<?php echo json_encode($finalResult,JSON_NUMERIC_CHECK)?>';

    //alert(datum[0]);
    $(document).ready(function() {
        //alert(datum);
            var datum1 = jQuery.parseJSON(datum);
            //alert(datum1);
            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'container1',
                    type: 'column',
                    margin: 75,
                    options3d: {
                        enabled: true,
                        alpha: 15,
                        beta: 15,
                        depth: 50,
                        viewDistance: 25
                    }
                },
                title: {
                    text: '',
                    x: -20 //center
                },
                subtitle: {
                    text: '',
                    x: -20
                },
                 plotOptions: {
                        column: {
                            depth: 25
                         }
                  },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                },
                yAxis: {
                    title: {
                        text: 'Feet'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    formatter: function() {
                            return '<b>'+ this.series.name +'</b><br/>'+
                            this.x +': '+ this.y;
                    }
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'top',
                    x: -10,
                    y: 100,
                    borderWidth: 0
                },
                series: datum1
            });
     // Activate the sliders
    $('#R0').on('change', function(){
        chart.options.chart.options3d.alpha = this.value;
        showValues();
        chart.redraw(false);
    });
    $('#R1').on('change', function(){
        chart.options.chart.options3d.beta = this.value;
        showValues();
        chart.redraw(false);
    });

    function showValues() {
        $('#R0-value').html(chart.options.chart.options3d.alpha);
        $('#R1-value').html(chart.options.chart.options3d.beta);
    }
    showValues();

    });
    
});
        </script>
        <title>Chart</title>
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/justified-nav.css" rel="stylesheet">
    <link href="css/cover1.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>
    <body>
  <script src="http://code.highcharts.com/highcharts.js"></script>
  <script src="http://code.highcharts.com/highcharts-3d.js"></script>
  <script src="http://code.highcharts.com/modules/exporting.js"></script>
  <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand">WeatherAnalytics</h3>
              <ul class="nav masthead-nav">
                <li class="active"><a href="index.html">Home</a></li>
              </ul>
            </div>
          </div>
<div class="container">

      <div class="masthead">
        <h3 class="text-muted"><?php echo "Statistics for $state in $year"?></h3>
        <ul class="nav nav-justified">
          <li ><a href="controller.php?state=<?php echo $state?>&year=<?php echo $year?>&button=submit">Temperature</a></li>
          <li><a href="rainfall.php?state=<?php echo $state?>&year=<?php echo $year?>&button=submit">Rain Fall</a></li>
          <li><a href="windspeed.php?state=<?php echo $state?>&year=<?php echo $year?>&button=submit">Wind Speed</a></li>
          <li class="active"><a href="snowdepth.php?state=<?php echo $state?>&year=<?php echo $year?>&button=submit">Snow Depth</a></li>
        </ul>
      </div>

      <!-- Jumbotron -->
      <br/>

      <div id="container1" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
      <div id="sliders">
    <table>
        <tr><td>Alpha Angle</td><td><input id="R0" type="range" min="0" max="45" value="15"/> <span id="R0-value" class="value"></span></td></tr>
        <tr><td>Beta Angle</td><td><input id="R1" type="range" min="0" max="45" value="15"/> <span id="R1-value" class="value"></span></td></tr>
    </table>
</div>
      <!-- Site footer -->
      <div class="footer">
        <p>&copy; CMPE 272 Spring 2014 Team 22</p>
      </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="/js/docs.min.js"></script>
  </body>
</html>


