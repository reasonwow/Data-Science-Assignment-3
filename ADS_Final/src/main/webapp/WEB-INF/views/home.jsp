<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Bootstrap Form With Spring Mvc Example</title>
<%-- <link type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet"/>
 --%>
 </head>
<body>

	<div class="container-fluid">
		<ul class="nav nav-tabs">
		  <li class="active"><a href="#">Home</a></li>
		  <li><a href="#">Menu 1</a></li>
		  <li><a href="#">Menu 2</a></li>
		  <li><a href="#">Menu 3</a></li>
		</ul>
		<div class="row-fluid">
			<div class="span12">
				<fieldset>
				<legend>Bootstrap Form With Spring Mvc Example</legend>
				<form class="form-horizontal" method="post" action='employee/add.htm' name="employeeForm" id="employeeForm">
					<div class="control-group">
						<label class="control-label">First Name</label>
						<div class="controls">
							<input type="text" name="date" id="date" title="Date" value="">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Last Name</label>
						<div class="controls">
							<input type="text" name="Temperature" id="lastName" title="Last Name" value="">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Email</label>
						<div class="controls">
							<input type="text" name="email" id="email" title="Email" value="">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Last Name</label>
						<div class="controls">
							<input type="text" name="lastName" id="lastName" title="Last Name" value="">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Last Name</label>
						<div class="controls">
							<input type="text" name="lastName" id="lastName" title="Last Name" value="">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Last Name</label>
						<div class="controls">
							<input type="text" name="lastName" id="lastName" title="Last Name" value="">
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