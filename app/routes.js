var app = angular.module('main-App', ['ngRoute', 'angularUtils.directives.dirPagination', 'smart-table', 'angular-growl', '720kb.datepicker']);
app.config(['$routeProvider',
	function($routeProvider) {
		$routeProvider.
		when('/home', {
			templateUrl: 'templates/home.html',
			controller: 'AdminController'
		}).when('/logout', {
			resolve: {
				deadResolve: function($location, user) {
					user.clearData();
					$location.path('/');
				}
			}
		}).when('/', {
			resolve: {
				check: function($location, user) {
					if (user.isUserLoggedIn()) {
						$location.path('/home');
					}
				},
			},
			templateUrl: 'templates/login.html',
			controller: 'LoginController'
		}).
		when('/login', {
			resolve: {
				check: function($location, user) {
					if (user.isUserLoggedIn()) {
						$location.path('/home');
					}
				},
			},
			templateUrl: 'templates/login.html',
			controller: 'LoginController'
		}).
		when('/register', {
			resolve: {
				check: function($location, user) {
					if (user.isUserLoggedIn()) {
						$location.path('/home');
					}
				},
			},
			templateUrl: 'templates/register.html',
			controller: 'RegisterController'
		}).
		when('/smarttable', {
			resolve: {
				check: function($location, user) {
					if (!user.isUserLoggedIn()) {
						$location.path('/login');
					}
				},
			},
			templateUrl: 'templates/smart_table.html',
			controller: 'smartController'
		}).
		when('/listitems', {
			resolve: {
				check: function($location, user) {
					if (!user.isUserLoggedIn()) {
						$location.path('/login');
					}
				},
			},
			templateUrl: 'templates/list_items.html',
			controller: 'ItemController'
		}).
		when('/items', {
			resolve: {
				check: function($location, user) {
					if (!user.isUserLoggedIn()) {
						$location.path('/login');
					}
				},
			},
			templateUrl: 'templates/items.html',
			controller: 'ItemController'
		}).otherwise({
			template: '404'
		});


	}
]);