app.controller('PurchaseController', function(dataFactory, $scope, $http, $rootScope, user, $filter, growl) {

	//$rootScope.title = "Customer Items";
	$scope.data = [];
	$scope.pageNumber = 1;
	$scope.libraryTemp = {};
	$scope.totalItemsTemp = {};
	$scope.totalItems = 0;
	$scope.allItemsSelected = false;
	$scope.unitOfMeasurements = ["Litre", "Gram", "Kilogram", "Nos"];
	var current_user = $rootScope.userData.username;
	$scope.form = {};
	$scope.form.price = 0;
	$scope.form.quantity = 0;
	$scope.page_limit = 5;
	$scope.pages = [05, 10, 15, 20, 25];
	var headers = $rootScope.headers;
	$scope.pageChanged = function(newPage) {
		getResultsPage(newPage);
	};

	function constructPage() {
		clearSearch();
		getResultsPage(1);
	}
	constructPage();
	//getResultsPage(1);

	function clearSearch() {
		$scope.searchText = "";
		$scope.selected_item = [];
		$scope.allItemsSelected = false;
		$scope.form = {};
		$scope.form.price = 0;
		$scope.form.quantity = 0;
	}

	function getResultsPage(pageNumber) {
		if (!$.isEmptyObject($scope.libraryTemp)) {
			dataFactory.httpRequest('purchaseList?search=' + $scope.searchText + '&limit=' + $scope.page_limit + '&page=' + pageNumber + '&user=' + current_user, 'GET', headers).then(function(data) {
				console.log(data);
				$scope.data = data.response.data;
				$scope.totalItems = data.response.total;
				$scope.pageNumber = pageNumber;
			});
		} else {
			dataFactory.httpRequest('purchaseList?page=' + pageNumber + '&limit=' + $scope.page_limit + '&user=' + current_user, 'GET', headers).then(function(data) {
				console.log(data);
				clearSearch();
				$scope.data = data.response.data;
				$scope.totalItems = data.response.total;
				$scope.pageNumber = pageNumber;

			});
		}
	}
	$scope.exportData = function(file_type) {
		var filename = "export" + new Date().getTime();
		if (file_type === "csv") {
			alasql('SELECT * INTO CSV("' + filename + '.csv",{headers:true}) FROM ?', [$scope.data]);
		} else if (file_type === "excel") {
			alasql('SELECT * INTO XLSX("' + filename + '.xlsx",{headers:true}) FROM ?', [$scope.data]);
		} else if (file_type === "tab") {
			alasql('SELECT * INTO TAB("' + filename + '.txt",{headers:true}) FROM ?', [$scope.data]);
		} else if (file_type === "pdf") {
			html2canvas(document.getElementById('item_page'), {
				onrendered: function(canvas) {
					var data = canvas.toDataURL();
					var docDefinition = {
						content: [{
							image: data,
							width: 500,
						}]
					};
					pdfMake.createPdf(docDefinition).download(filename + ".pdf");
				}
			});
		} else if (file_type === "print") {
			html2canvas(document.getElementById('item_page'), {
				onrendered: function(canvas) {
					var data = canvas.toDataURL();
					var docDefinition = {
						content: [{
							image: data,
							width: 500,
						}]
					};
					var popupWin = window.open('', '_blank', 'width=1000,height=600');
					popupWin.document.open();
					popupWin.document.write('<html><head><link rel="stylesheet" type="text/css" href="style.css" /></head><body onload="window.print()"><img src="' + data + '"></body></html>');
					popupWin.document.close();
					popupWin.focus();
					//popupWin.print();
					//popupWin.close();
				}
			});
			// var printContents = document.getElementById("item_page").innerHTML;


		}
	};
	$scope.searchDB = function() {
		if ($scope.searchText.length >= 3) {
			if ($.isEmptyObject($scope.libraryTemp)) {
				$scope.libraryTemp = $scope.data;
				$scope.totalItemsTemp = $scope.totalItems;
				$scope.data = {};
			}
			getResultsPage(1);
		} else {
			if (!$.isEmptyObject($scope.libraryTemp)) {
				$scope.data = $scope.libraryTemp;
				$scope.totalItems = $scope.totalItemsTemp;
				$scope.libraryTemp = {};
				$scope.page_limit = 5;
			}
		}
	}

	function constructPurchaseForm(selectedProduct) {
		selectedProduct.purchase_amount = selectedProduct.quantity * selectedProduct.price;
		console.log(selectedProduct);
		$scope.form.item_idfk = selectedProduct.id;
		$scope.form.item_type = selectedProduct.item_type;
		$scope.form.price = selectedProduct.price;
		$scope.form.quantity = selectedProduct.quantity;
		$scope.form.title = selectedProduct.title;
		$scope.form.purchase_amount = selectedProduct.purchase_amount;
	}
	$scope.changedValue = function(titleSelected) {
		constructPurchaseForm(titleSelected);
	}
	$scope.changePageLimit = function() {
		getResultsPage(1);
	}
	$scope.getProductNames = function() {
		dataFactory.httpRequest('getProductNames?user=' + current_user, 'GET', headers).then(function(data) {
			console.log(data.response);
			$scope.titleList = data.response;

		});

	}
	$scope.saveAdd = function() {
		$scope.form.user = $rootScope.userData.username;
		dataFactory.httpRequest('addPurchaseEntry', 'POST', headers, {}, $scope.form).then(function(data) {
			$scope.data.push(data);
			$(".modal").modal("hide");
		});
	}

	function getCurTimeStamp() {
		var date = new Date();
		return $filter('date')(new Date(), 'yyyy-MM-dd HH:mm:ss');
	}

	function getTodayDate() {
		var date = new Date();
		return $filter('date')(new Date(), 'yyyy-MM-dd');
	}
	$scope.calculatePurchaseAmount = function() {
		$scope.form.purchase_amount = parseFloat(($scope.form.quantity * $scope.form.price).toFixed(2));
	}

	function showGrowl(message, title, delay) {
		growl.success(message, {
			title: title,
			ttl: delay
		});
	}

	function convertToDate(date) {
		return $filter('date')(new Date(), 'yyyy-MM-dd');
	}
	$scope.edit = function(id) {
		dataFactory.httpRequest('editPurchaseEntry/' + id, 'GET', headers).then(function(data) {
			console.log(data);
			$scope.form = data;
		});
	}
	$scope.saveEdit = function() {
		$scope.form.user = $rootScope.userData.username;
		dataFactory.httpRequest('updatePurchaseEntry/' + $scope.form.id, 'PUT', headers, {}, $scope.form).then(function(data) {
			$(".modal").modal("hide");
			$scope.data = apiModifyTable($scope.data, data.id, data);
		});
	}
	$scope.remove = function(item, index) {
		var result = confirm("Are you sure delete this item?");
		if (result) {
			dataFactory.httpRequest('deletePurchaseEntry/' + item.id, 'DELETE', headers).then(function(data) {
				$scope.data.splice(index, 1);
			});
		}
	}
	$scope.selected_item = [];
	$scope.selectEntity = function(index) {
		// If any entity is not checked, then uncheck the "allItemsSelected" checkbox
		//for (var i = 0; i < $scope.data.length; i++) {
		if (!$scope.data[index].isChecked) {
			$scope.allItemsSelected = false;
			$scope.selected_item.pop($scope.data[index]);
			return;
		} else {
			$scope.selected_item.push($scope.data[index]);
		}
		//}

		//If not the check the "allItemsSelected" checkbox
		$scope.allItemsSelected = true;
	};

	$scope.selectAll = function() {
		$scope.selected_item = [];
		// Loop through all the entities and set their isChecked property
		for (var i = 0; i < $scope.data.length; i++) {
			$scope.data[i].isChecked = $scope.allItemsSelected;
			if ($scope.allItemsSelected) {
				$scope.selected_item.push($scope.data[i]);
			} else {
				$scope.selected_item = [];
			}

		}
	};
	$scope.resetItem = function() {
		$scope.form = {};
	};

});