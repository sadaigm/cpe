app.controller('LoginController', function($scope, dataFactory, $rootScope, $http, $location, user) {
	//$rootScope.title = "Customer Login";
	$scope.error = '';
	$scope.role = 'customer';
	var headers = $rootScope.headers;
	$scope.login = function() {
		var username = $scope.username;
		var password = $scope.password;

		var postdata = {
			username: $scope.username,
			password: $scope.password,
			role: $scope.role
		}
		dataFactory.httpRequest('auth/login', 'POST', headers, {}, postdata).then(function(response) {

			// $http({
			// 	url: 'http://localhost/angularjs-mysql/server.php',
			// 	method: 'POST',
			// 	headers: {
			// 		'Content-Type': 'application/x-www-form-urlencoded'
			// 	},
			// 	data: 'username='+username+'&password='+password
			// }).then(function(response) {
			if (response.customstatus == 200) {
				user.saveData(response);
				$location.path('/listitems');
			} else {
				//alert(response.status+" - "+response.message);
				$scope.error = response.customstatus + " - " + response.message;
				$scope.username = "";
				$scope.password = "";
				$scope.role = "customer";
			}
		})
	}
});