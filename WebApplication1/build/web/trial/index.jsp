<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="ico/favicon.png">

<title>Weather Analyzer | Home</title>

<!-- Bootstrap core CSS -->
<link href="bootstrap.css" rel="stylesheet">
<link href="theme.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="magnific-popup.css" rel="stylesheet">

<!-- Font Awesome -->
<link href="View/font-awesome-4.0.3/css/font-awesome.min.css"
	rel="stylesheet">

<link href='Montserrat.css' rel='stylesheet' type='text/css'>
<link href='Sans.css' rel='stylesheet' type='text/css'>

<script src="custom.js"></script>
</head>

<body>
	<div class="navbar-wrapper cbp-af-header">
		<div class="container">
			<!-- Fixed navbar -->
			<div class="navbar cbp-af-inner" role="navigation">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<h1>
							<a class="navbar-brand scroll" href="#intro">Weather Analyzer</a>
						</h1>
					</div>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav pull-right">
							<li><a href="#about">About</a></li>
							<li><a href="#analyze">Analyze</a></li>
							<li><a href="#contact">Contact</a></li>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="intro" class="owl-carousel owl-theme-featured"
		style="width: 1425px; height: 477px; opacity: 1; display: block;">
		<div class="owl-wrapper-outer">
			<div class="owl-wrapper"
				style="width: 2850px; left: 0px; display: block;">
				<div class="owl-item" style="width: 1425px">
					<div class="item background-cover"
						style='background: url("one-day.jpg") repeat scroll 0% 0% transparent; width: 1425px; height: 750px;'>
						<div class="container">
							<div class="row">
								<div class="carousel-caption-center colour-white">
									<br> <br>
									<h2>You are the sky. Everything else – it’s just the
										weather.</h2>
									<p>
										<a class="btn btn-lg btn-primary signup" href="#analyze"
											role="button">Get started</a>
									</p>
								</div>
							</div>
						</div>
						<div class="overlay-bg"></div>
					</div>
				</div>
			</div>
		</div>
	<!--  ABOUT -->
		<section id="about" class="content text-center light">

			<div class="container">
				<!-- Three columns of text below the carousel -->
				<div class="row">
					<div class="col-lg-12 overlay-text">
						<br> <br>
						<h2>Weather Analyzer helps you escape the grind of searching
							different sites for past weather data</h2>
						<br> <br>

					</div>
					<!-- /.col-lg-12 -->
				</div>
			</div>
		</section>

		<!-- Analyze
    ================================================== -->
		<section id="analyze" class="dark with-bg">

			<div class="owl-wrapper-outer">
				<div class="owl-wrapper"
					style="width: 2850px; left: 0px; display: block;">
					<div class="owl-item" style="width: 1425px">
						<div class="item background-cover"
							style='background: url("Night-Sky.jpg") repeat scroll 0% 0% transparent; width: 1425px; height: 750px;'>
							<div class="container">
								<div class="row">
									<div class="carousel-caption-center colour-white" style = align:center>
										<br> <br> <br> What do you want to query? <br>
										<br>
									
										<form action="MyServlet" method="post">
									<div style= "margin-left:50px; margin-right:-230px">
											<div class="col-sm-3 col-md-3">
												<div class="footer-logo">
													<h3>Type</h3>
				<select name="options" style="color: black">
					<option value="type">Type</option>
					<option value="temp">Temperatures</option>
					<option value="dew" selected="1">Dew</option>
					<option value="wind_speed">Wind Speed</option>
					<option value="slp">Sea Level Pressure</option>
					<option value="visib">Visibility</option>
					<option value="prcp">Precipitation</option>
					<option value="snow_depth">Snow Depth</option>
				</select> <br>
				</div>
			</div>
				<div class="col-sm-3 col-md-3">
				<div class="footer-logo">
				<h3>Select Year</h3>
				<select name="options" class="yearMenu" style="color: black">
				<option value="year">Year</option>
				<option value="2010">2010</option>
				<option value="2011">2011</option>
				<option value="2012">2012</option>
				<option value="2013">2013</option>
				</select>					
			</div>
			</div>
			
			<div class="col-sm-3 col-md-3">
		<h3>Select State</h3>
		<select name="options" class="stateMenu" style="color: black">
			<option value="state">State</option>
			<option value="ca">California</option>
			<option value="az">Arizona</option>
			<option value="fl">Florida</option>
			<option value="ny">New York</option>
			
			</select>
			</div> 
			</div>
			<br> <br> 
											
			<br>
			<br>
			<input
				class="btn btn-lg btn-primary signup" role="button"
				type="submit" value="Submit" />


	<script>
		$('.year')
				.click(
						function() {
							if ($(
									'.year')
									.is(
											':checked')) {
								$(
										'.yearMenu')
										.attr(
												"disabled",
												false);
								$(
										'.stateMenu')
										.attr(
												"disabled",
												true);
							}
						});
		$('.state')
				.click(
						function() {
							if ($(
									'.state')
									.is(
											':checked')) {
								$(
										'.yearMenu')
										.attr(
												"disabled",
												true);
								$(
										'.stateMenu')
										.attr(
												"disabled",
												false);
							}
						});
	</script>

										</form>
									<!-- </div> -->
								</div>
							</div>
							<div class="overlay-bg"></div>

						</div>
					</div>
				</div>
			</div>
		</section>

		<script src="js/jquery-1.10.2.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/classie.js"></script>
		<script src="js/cbpAnimatedHeader.min.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/scrollReveal.js"></script>
		<script src="js/jquery.scrollTo.js" defer="defer"></script>
		<script src="js/jquery.nav.js" defer="defer"></script>
		<script src="js/imagesloaded.pkgd.min.js" defer="defer"></script>
		<script src="js/isotope.min.js" defer="defer"></script>
		<script src="js/jquery.magnific-popup.min.js" defer="defer"></script>
		<script src="js/jqBootstrapValidation.js" defer="defer"></script>
		<script src="js/custom.js"></script>

		<script src="js/less-1.6.1.min.js"></script>

		<script>
			$(document).ready(function() {

				isotope();
				signupOverlay();
				loginOverlay();

				$('.theme-option').click(function(event) {
					event.preventDefault();
					less.modifyVars({
						'@theme-cta' : $(this).attr('data-theme')
					});

					less.refreshStyles();
				});

			});

			$.each([ 'css/theme.less' ], function(index, fileName) {
				var $sheet = $('<link />', {
					href : fileName,
					rel : 'stylesheet/less',
					type : 'text/css'
				}).appendTo('head');
				less.sheets.push($sheet[0]);
			});
			less.refresh();
		</script>

		<script>
			$(function() {
				$('[name=options]').val('');
			})
		</script>

	<script type="text/javascript">
			try {
				Typekit.load();
			} catch (e) {
			}
		</script>
</body>
</html>