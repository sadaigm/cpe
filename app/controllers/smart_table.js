app.controller('smartController', function(dataFactory, $scope, $http) {
	$scope.loading = false;
	$scope.getData = function() {
		$scope.loading = true;
		dataFactory.httpRequest("http://dummy.restapiexample.com/api/v1/employees", 'GET', {}).then(function(response) {
			$scope.employees = response;
			$scope.loading = false;
		});
	}
	$scope.getData();
	$scope.viewRecord = function(id) {
		if (id > 0) {
			dataFactory.httpRequest("http://dummy.restapiexample.com/api/v1/employee/" + id, 'GET', {}).then(function(response) {
				$scope.view_employee = response;
				$scope.loading = false;
			});
			// $http.get("http://dummy.restapiexample.com/api/v1/employee/" + id)
			// 	.then(function(response) {
			// 		modalInstance = $modal.open({
			// 			animation: false,
			// 			templateUrl: 'view/view_record.html',
			// 			controller: 'empViewCtrl',
			// 			scope: $scope,
			// 			size: '',
			// 			resolve: {
			// 				record: function() {
			// 					return response.data;
			// 				}
			// 			}
			// 		});
			// 	});

		}
	}
});