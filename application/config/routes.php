<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'welcome';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
/*
$route['tasks'] = "Task_controller";
$route['task/add'] = 'Task_controller/add_task';
$route['task/update'] = 'Task_controller/update_task';
$route['task/delete/(\d+)'] = 'Task_controller/delete_task/$1';
$route['task/get/(\d+)'] = 'Task_controller/get_task/$1';
$route['timesheets'] = "TimeSheetController";
$route['timesheet/project_hrs'] = "TimeSheetController/get_projects_hrs";
$route['timesheet/get_timesheet_entries'] = "TimeSheetController/get_timesheet_entries";
$route['timesheet/get_user_ts_bydate_project'] = 'TimeSheetController/get_user_ts_bydate_project';
$route['timesheet/add'] = "TimeSheetController/add_timesheet";
*/
$route['templates/(:any)'] = "templates/view/$1";
$route['items'] = "items/index";
$route['itemsCreate']['post'] = "items/store";
$route['itemsEdit/(:any)'] = "items/edit/$1";
$route['itemsUpdate/(:any)']['put'] = "items/update/$1";
$route['itemsDelete/(:any)']['delete'] = "items/delete/$1";
$route['authenticate']['post'] = "User_Controller/auth_user";
$route['users'] = "User_Controller/index";
$route['auth']['post'] = "Auth/login";
$route['auth']['post'] = "Auth/register";
$route['addPurchaseEntry']['post'] = "PurchaseEntry/store";
