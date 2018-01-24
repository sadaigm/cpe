<html lang="en">
<head>
	<title>Codeigniter 3</title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Fonts -->
	<link href='app/3party/css/family_OpenSans.css' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="app/3party/cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="app/3party/netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	<script src="app/3party/cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="app/3party/cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>
	<!-- Angular JS -->
	<!-- <script src="app/3party/ajax.googleapis.com/ajax/libs/angularjs/1.3.2/angular.min.js"></script>
	<script src="app/3party/ajax.googleapis.com/ajax/libs/angularjs/1.3.2/angular-route.min.js"></script> -->
	<!-- MY App -->
	<!-- <link rel="stylesheet" href="app/3party/maxcdn.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css"> -->
		<script src="app/3party/ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.js"></script>
		<script src="app/3party/ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-route.min.js"></script>
		<link rel="stylesheet" href="app/3party/angular-growl.min.css">
		<script src="app/3party/angular-growl.min.js"></script>
		<script src="app/3party/cdnjs.cloudflare.com/ajax/libs/angular-smart-table/2.1.8/smart-table.min.js"></script>
		<link rel="stylesheet" href="app/3party/css/family_Roboto.css" />
	<script src="app/packages/dirPagination.js"></script>
	<script src="app/routes.js"></script>
	<script src="app/services/myServices.js"></script>
	<script src="app/services/user.js"></script>
	<script src="app/helper/myHelper.js"></script>
	<!-- for datatables
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
	       <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.1.3/css/fixedHeader.bootstrap.min.css">
	       <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.0/css/responsive.bootstrap.min.css">
	       <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	        <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
	        <script src="https://cdn.datatables.net/fixedheader/3.1.3/js/dataTables.fixedHeader.min.js"></script>
	        <script src="https://cdn.datatables.net/responsive/2.2.0/js/dataTables.responsive.min.js"></script>
	        <script src="https://cdn.datatables.net/responsive/2.2.0/js/responsive.bootstrap.min.js"></script> -->


	<!-- App Controller -->
	<script src="app/controllers/ItemController.js"></script>
	<script src="app/controllers/smart_table.js"></script>
	 <script src="app/controllers/login.js"></script>
	 <script src="app/controllers/register.js"></script>
	<!-- Including the scripts -->
	<script src="app/3party/alasql.min.js"></script>
	<script src="app/3party/js/menu.js"></script>
	<script src="app/3party/xlsx.core.min.js"></script>
	<script src="app/3party/cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
 	<script src="app/3party/cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/angularjs-datepicker/2.1.23/angular-datepicker.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/angularjs-datepicker/2.1.23/angular-datepicker.min.js"></script>
<link rel="stylesheet"  href="app/3party/css/product_item.css">

</head>
<body ng-app="main-App">
	<nav class="navbar navbar-default navbar-default-panel">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle Navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#/">{{title}}</a>
			</div>
			<div ng-if="isloggedin" class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#/">Home</a></li>
					<!-- <li><a href="#/smarttable">Smart Table</a></li> -->
					<li><a href="#/listitems">Item</a></li>
					<li><a href="#/items">List of Items</a></li>
					<li ><a href="#/logout">Logout</a></li>
				</ul>
			</div>
			<div ng-if="!isloggedin" class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#/register">Register</a></li>
					<li><a href="#/login">Login</a></li>
					</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div growl></div>
		<ng-view></ng-view>
	</div>
</body>
</html>
