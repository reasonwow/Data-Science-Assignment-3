<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--
	Horizons by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Horizons by TEMPLATED</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="/ads/resources/js/jquery.min.js"></script>
		<script src="/ads/resources/js/jquery.dropotron.min.js"></script>
		<script src="/ads/resources/js/skel.min.js"></script>
		<script src="/ads/resources/js/skel-layers.min.js"></script>
		<script src="/ads/resources/js/init.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<noscript>
			<link rel="stylesheet" href="/resources/css/skel.css" />
			<link rel="stylesheet" href="/resources/css/style.css" />
		</noscript>
		
			<link rel="stylesheet" href="/ads/resources/css/skel.css" />
			<link rel="stylesheet" href="/ads/resources/css/style.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	<body class="homepage">

		<!-- Header -->
			<div id="header3">
				<div class="container">
						
					<!-- Logo -->
						<h1><a href="mainInput.htm" id="logo">Horizons</a></h1>
					
					<a href="mainInput.htm">try</a>
					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="index.html">Home</a></li>
								<li>
									<a href="">Dropdown</a>
									<ul>
										<li><a href="#">111</a></li>
										<li><a href="#">222</a></li>
										<li><a href="#">333 </a></li>
										<li>
											<a href="">Phasellus consequat</a>
											<ul>
												<li><a href="#">Lorem ipsum dolor</a></li>
												<li><a href="#">Phasellus consequat</a></li>
												<li><a href="#">Magna phasellus</a></li>
												<li><a href="#">Etiam dolore nisl</a></li>
												<li><a href="#">Veroeros feugiat</a></li>
											</ul>
										</li>
										<li><a href="#">Veroeros feugiat</a></li>
									</ul>
								</li>
								<li><a href="dummyModel.htm">Model</a></li>
								<li><a href="right-sidebar.html">Right Sidebar</a></li>
								<li><a href="no-sidebar.html">No Sidebar</a></li>
							</ul>
						</nav>


					<!-- Banner -->
						<div id="banner">
							<div class="container">
								<section>
									<header class="major">
										<h2>Uber</h2>
										<span class="byline">&hellip; tag here <br/>1. date, zone, trips<br/>
										2. by days/hours <br/>
										3. by base</span>
									</header>
									<a href="#" class="button alt">Sign Up</a>
								</section>			
							</div>
						</div>

				</div>
			</div>

		<!-- Featured -->
			<div class="wrapper style2">
				<section class="container">
					<header class="major">
						<h2>Monthly Report</h2>
						<span class="byline">Predict the total trips in specific area</span>
					</header>

					<div class="container">

						<section class="4u" style="margin: 0 auto">
												
							<p>This is a form.</p>
							<form action="mainInput.htm" method ="post">
							<div class="controls">
							
							Zip Code: <select name="zipCode_dd" id="zipCode_dd">
							<!--BCYF, BPD, BPL, DND, PARKS, PROP, PWD, SCH  -->
							  
							  <c:forEach var="i1" begin="10001" end="10038">
							  	<c:if test="${i1 != 10007 && i1 != 10008 && i1 != 10015 && i1 != 10020 &&
							  	 i1 != 10021 && i1 != 10026 && i1 != 10030 && i1 != 10037}">
							  	<option value="${i1}">${i1}</option>
							  	</c:if>
							  </c:forEach>
							  
							  <option value="10044">10044</option>
							  <option value="10065">10065</option>
							  <option value="10075">10075</option>
							  <option value="10080">10080</option>
							  <option value="10176">10176</option>
							  
							  <c:forEach var="i2" begin="10301" end="10314">
							  	<c:if test="${i2 != 10302 && i2 != 10307 && i2 != 10311 && i2 != 10313}">
							  	<option value="${i2}">${i2}</option>
							  	</c:if>
							  </c:forEach>
							  
							  <c:forEach var="i3" begin="10451" end="10475">
							  	<c:if test="${i3 != 10456 && i3 != 10466 && i3 != 10468 && i3 != 10469}">
							  	<option value="${i3}">${i3}</option>
							  	</c:if>
							  </c:forEach>
							  <option value="11001">11001</option>
							  <option value="11004">11004</option>
							  <option value="11005">11005</option>
							  
							  <!--10001, 10002, 10003, 10004, 10005, 10006, 10009, 10010, 10011, 10012, 10013, 
							10014, 10016, 10017, 10018, 10019, 10022, 10023, 10024, 10025, 10027, 10028, 10029,
							 10031, 10032, 10033, 10034, 10035, 10036, 10038, 10044, 10065, 10075, 10080,
							10176, 10301, 10303, 10304, 10305, 10306, 10308, 10309, 10310, 10312, 10314, 10451,
							 10452, 10453, 10454, 10455, 10457, 10458, 10459, 10460, 10461, 10462, 10463, 10464,
							  10465, 10467, 10470, 10471, 10472, 10473, 10474, 10475, 11001, 11004, 11101,
							   11102, 11104, 11105, 11201, 11205, 11207, 11208, 11209, 11210, 11211, 11212,
							    11213, 11214, 11215, 11216, 11217, 11218, 11219, 11220, 11221, 11222, 11223,
							     11224, 11225, 11226, 11228, 11229, 11230, 11231, 11234, 11235, 11236, 11238,
							      11249, 11354, 11355, 11356, 11357, 11358, 11359, 11361, 11363, 11364, 11366, 
							      11367, 11368, 11371, 11372, 11373, 11374, 11375, 11377, 11378, 11379, 11385,
							       11411, 11413, 11414, 11415, 11417, 11418, 11420, 11421, 11422, 11423, 11429,
							        11430, 11433, 11434, 11691, 11693, 11694, 7114, 7302,  -->
							  
							  <c:forEach var="i4" begin="11201" end="11238">
							  	<c:if test="${i4 != 11202 && i4 != 11202 && i4 != 11203 && i4 != 11204
							  	 && i4 != 11206 && i4 != 11227 && i4 != 11232 && i4 != 11233 && i4 != 11237}">
							  	<option value="${i4}">${i4}</option>
							  	</c:if>
							  </c:forEach>
							  
							  <option value="11249">11249</option>
							  
							  <c:forEach var="i5" begin="11354" end="11379">
							  	<c:if test="${i5 != 11360 && i5 != 11362 && i5 != 11365 && i5 != 11369 
							  	&& i5 != 11370 && i5 != 11376}">
							  	<option value="${i5}">${i5}</option>
							  	</c:if>
							  </c:forEach>

							  <option value="11385">11385</option>
							  
							  <c:forEach var="i6" begin="11411" end="11423">
							  	<c:if test="${i6 != 11412 && i6 != 11416 && i6 != 11419}">
							  	<option value="${i6}">${i6}</option>
							  	</c:if>
							  </c:forEach>
							  
							  <option value="11429">11429</option>
							  <option value="11430">11430</option>
							  <option value="11433">11433</option>
							  <option value="11434">11434</option>
							  <option value="11691">11691</option>
							  <option value="11693">11693</option>
							  <option value="11694">11694</option>
							  <option value="7114">7114</option>
							  <option value="7302">7302</option>
							</select>
							</div>
							<div class="controls">
								Month: <select name="month_dd" id="month_dd">
									<c:forEach var="i7" begin="1" end="12">
							  				<option value="${i7}">${i7}</option>
							  		</c:forEach>
								</select>
							</div>
								<input type = "submit" value ="See">
							</form>
						</section>
					</div>
					
					
				</section>
			</div>

		
		<!-- Footer -->
			<div id="footer">
				<div class="container">

					

					<!-- Copyright -->
						<div class="copyright">
							Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
						</div>

				</div>
			</div>

	</body>
</html>