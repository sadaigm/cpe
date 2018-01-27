app.controller('RegisterController', function($scope, dataFactory, $rootScope, $http, $location, user) {
	$rootScope.title = "Customer Registration";
	$scope.error = '';
	$scope.role = 'customer';
	var headers = $rootScope.headers;
	user.activatePageStatus();
	$scope.register = function() {
		var username = $scope.username;
		var password = $scope.password;
		var name = $scope.name;
		var role = $scope.role;
		user.deactivatePageStatus();

		var postdata = {
			username: $scope.username,
			password: $scope.password,
			name: $scope.name,
			role: $scope.role
		}
		dataFactory.httpRequest('auth/register', 'POST', headers, {}, postdata).then(function(response) {

			// $http({
			// 	url: 'http://localhost/angularjs-mysql/server.php',
			// 	method: 'POST',
			// 	headers: {
			// 		'Content-Type': 'application/x-www-form-urlencoded'
			// 	},
			// 	data: 'username='+username+'&password='+password
			// }).then(function(response) {
			if (response.customstatus == 200) {
				//user.saveData(response);
				//alert(response.customstatus + " - " + response.message);
				$location.path('/login');
			} else {
				//alert(response.status+" - "+response.message);
				$scope.error = response.customstatus + " - " + response.message;
				$scope.username = "";
				$scope.name = "";
				$scope.password = "";
			}
		})
	}
});