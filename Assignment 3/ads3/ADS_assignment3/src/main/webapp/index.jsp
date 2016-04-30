<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<%-- <c:set var="contextPath" value="${pageContext.request.contextPath}"/> --%>
</head>
<body>

<!-- <div class="container-fluid">
		<ul class="nav nav-tabs">
		  <li class="active"><a href="#">Home</a></li>
		  <li><a href="https://public.tableau.com/views/myboston/2?:embed=y&:display_count=yes&:showTabs=y">Visualization</a></li>
		  <li><a href="/views/macro">Marco-Analysis</a></li>
		  <li><a href="#">Micro-Analysis</a></li>
		</ul>
</div> -->
<p><b></b><font size="5" face="verdana" color="green">Welcome to the home page.</font></b></p>
<!-- <b>We Are Crazy Analyst.</b> -->

<!-- <form action="addInput.htm" method="post">
  <button type="submit" name="test" value="your_value" class="btn-link">Go</button>
</form> -->
 
 
 

	<div class="container-fluid">
		<ul class="nav nav-tabs">
		  <li class="active"><a href="#">Home</a></li>
		  <li><a href="https://public.tableau.com/views/myboston/2?:embed=y&:display_count=yes&:showTabs=y">Visualization</a></li>
		  <li><a href="#">Marco-Analysis</a></li>
		  <li><a href="#">Micro-Analysis</a></li>
		</ul>
		<div class="row-fluid">
			<div class="span12">
				<fieldset>
				<legend>We Are Crazy Analyst</legend>
				<form class="form-horizontal" method="post" action='addInput.htm' name="inputForm" id="inputForm">
					<div class="control-group">
						<label class="control-label">Date</label>
						<div class="controls">
							<input type="text" name="date" id="date" title="Date" value="">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Category</label>
						<div class="controls">
							<select name="category_dd" id="category_dd">
							
							  <option value="BCYF">BCYF</option>
							  <option value="BPD">BPD</option>
							  <option value="BPL">BPL</option>
							  <option value="DND">DND</option>
							  <option value="PARKS">PARKS</option>
							  <option value="PROP">PROP</option>
							  <option value="PWD">PWD</option>
							  <option value="SCH">SCH</option>
							</select>
							<!-- <input type="text" name="category" id="category" title="Category" value=""> -->
						</div>
					</div>
					
				
					<div class="control-group">
						<label class="control-label">Building</label>
						<div class="controls">
						<select name="building_dd" id="building_dd">
							 
							  <option value="AGASSIZ">AGASSIZ</option>
							  <option value="ArtsJan">ArtsJan</option>
							  <option value="Blackstone Jan">Blackstone Jan</option>
							  <option value="BlackstoneJul">BlackstoneJul</option>
							  <option value="BLDG">BLDG</option>
							  <option value="BOSTN LATIN ACDMY">BOSTN LATIN ACDMY</option>
							  <option value="BOSTON LATIN">BOSTON LATIN</option>							  
							  <option value="CAMPBELL">CAMPBELL</option>
							  <option value="CENTRAL KITCHEN">CENTRAL KITCHEN</option>
							  <option value="CHARLESTOWN HIGH">CHARLESTOWN HIGH</option>
							  <option value="CLEVELAND NEW">CLEVELAND NEW</option>
							  <option value="CLEVELAND OLD">CLEVELAND OLD</option>
							  <option value="COPLEY SQUARE">COPLEY SQUARE</option>
							  <option value="COURT ST">COURT ST</option>
							  <option value="CURLEY CMTY CTR">CURLEY CMTY CTR</option>
							  <option value="DEVER">DEVER</option>
							  <option value="DISTRICT 1 AREA A">DISTRICT 1 AREA A</option>
							  <option value="DORCHESTER HIGH">DORCHESTER HIGH</option>
							  <option value="DUDLEY SQ">DUDLEY SQ</option>
							  <option value="EEC">EEC</option>
							  <option value="EECEASTBOSTON">EECEASTBOSTON</option>
							  <option value="ENGLISH HIGH">ENGLISH HIGH</option>
							  <option value="HARVARD ST">HARVARD ST</option>
							  <option value="HEADQUARTERS">HEADQUARTERS</option>
			  
							  <option value="HEMENWAY">HEMENWAY</option>
							  <option value="HYDE PARK HIGH">HYDE PARK HIGH</option>
							  <option value="HYDE PARK2014">HYDE PARK2014</option>
							  <option value="JACKSON MANN">JACKSON MANN</option>
							  <option value="JAMES F CONDON">JAMES F CONDON</option>
							  <option value="JAMES W HENNIGAN">JAMES W HENNIGAN</option>
							  <option value="JERIMAH BURKE">JERIMAH BURKE</option>
							  <option value="JOSEPH LEE">JOSEPH LEE</option>
							  <option value="JOSIAH QUINCY">JOSIAH QUINCY</option>
							  <option value="LILLA FREDRICK">LILLA FREDRICK</option>
							  <option value="MATTAHUNT">MATTAHUNT</option>
							  <option value="MATTAPAN">MATTAPAN</option>
							  <option value="MGMT">MGMT</option>
							  <option value="MGMT_1481TREMONT_TOBIN COMMUNITY CENTER">MGMT_1481TREMONT_TOBIN COMMUNITY CENTER</option>
							  <option value="MILDRED SCHOOL">MILDRED SCHOOL</option>
							  <option value="MISSION HIGH">MISSION HIGH</option>
							  <option value="MURPHY">MURPHY</option>
							  <option value="NATHAN HALE">NATHAN HALE</option>
							  <option value="ORCHARDGARDENS">ORCHARDGARDENS</option>
							  <option value="PARIS ST COMM CT">PARIS ST COMM CT</option>
							  <option value="RICHARD J MURPHY">RICHARD J MURPHY</option>
							  <option value="STATION 11 AREA C">STATION 11 AREA C</option>
							  <option value="STRATTON">STRATTON</option>
							  <option value="TROTTER">TROTTER</option>
							  <option value="W H OHRENBERGER">W H OHRENBERGER</option>
							  <option value="WEST ROXBURY">WEST ROXBURY</option>
							  <option value="WILLIAM H TAFT">WILLIAM H TAFT</option>
							  <option value="WILLIAM RUSSELL">WILLIAM RUSSELL</option>
							  <option value="WM H KENT">WM H KENT</option>
							  
							</select>
							
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">Temperature</label>
						<div class="controls">
							<input type="text" name="temperature" id="temperature" title="Temperature" value="">
						</div>
					</div>
					
					
					<div class="control-group">
						<label class="control-label">Humidity</label>
						<div class="controls">
							<input type="text" name="humidity" id="humidity" title="Humidity" value="">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Events</label>
						<div class="controls">
						
							<select name="events_dd" id="events_dd">
							
							  <option value="Fog">Fog</option>
							  <option value="Fog-Rain">Fog-Rain</option>
							  <option value="Fog-Rain-Snow">Fog-Rain-Snow</option>
							  <option value="Fog-Rain-Thunderstorm">Fog-Rain-Thunderstorm</option>
							  <option value="Fog-Snow">Fog-Snow</option>
							  <option value="Rain">Rain</option>
							  <option value="Rain-Snow">Rain-Snow</option>
							  <option value="Rain-Thunderstorm">Rain-Thunderstorm</option>
							  <option value="Snow">Snow</option>
							</select>
							<!-- <input type="text" name="events" id="events" title="Events" value=""> -->
						</div>
					</div>
				
					<div class="control-group">
						<label class="control-label">Working Day</label>
						<div class="controls">
							<input type="text" name="workingDay" id="workingDay" title="Working Day" value="">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Holiday</label>
						<div class="controls">
							<input type="text" name="holiday" id="holiday" title="Holiday" value="">
						</div>
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-success">Submit</button>
						<button type="button" class="btn">Cancel</button>
					</div>
				</form>
				</fieldset>
			</div>
		</div>
	</div>		

 


</body>
</html>