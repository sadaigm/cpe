<link rel="stylesheet" href="<?php echo base_url();?>artifacts/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo base_url();?>artifacts/assets/css/user.css">
<link rel="stylesheet" href="<?php echo base_url();?>artifacts/assets/bootstrap/fonts/font-awesome.min.css">
<style>
.navbar-default {
    background-color: #CDDC39 !important;
    border-color: #eeeeee !important;
    font-weight: bolder;
}
.navbar-link:hover{
  background-color: #4f5604 !important;
    color: #fff !important;
    border-color: #021423 !important;
}
.navbar-nav a:hover{
  background-color: #4f5604 !important;
    color: #fff !important;
    border-color: #021423 !important;
}
.navbar-toggle {
    background-color: #a1af15;

}
.navbar-default .navbar-toggle:hover, .navbar-default .navbar-toggle:focus{
      background-color: #737d0b;
}
</style>
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button><a class="navbar-brand navbar-link" href="index.php"><span class="glyphicon glyphicon-time"></span> Work Hours</a></div>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">TimeSheets <b class="caret"></b>
                  </a>
                  <ul class="dropdown-menu">
                    <li><a href="add_weekly_timesheet.php">Add</a></li>
                    <li><a href="#tabs">Update</a></li>
                  </ul>
                </li>
                <li role="presentation"><a href="#">Admin </a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    Employee Hours <b class="caret"></b>
                  </a>
                  <ul class="dropdown-menu">
                    <li><a href="weekly_hrs.php">Weekly</a></li>
                    <li><a href="timesheet_entries.php">Daily</a></li>
                  </ul>
                </li>
                  <li role="presentation"><a href="#">About Us</a></li>
            </ul>
        </div>
    </div>
</nav>
