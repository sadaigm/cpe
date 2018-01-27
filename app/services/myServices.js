app.factory('dataFactory', function($http, growl, user) {
	var myService = {
		httpRequest: function(url, method, header, params, dataPost, upload) {
			var passParameters = {};
			passParameters.url = url;
			if (typeof method == 'undefined') {
				passParameters.method = 'GET';
			} else {
				passParameters.method = method;
			}
			if (typeof header == 'undefined') {
				// passParameters.header = 'GET';
			} else {
				passParameters.headers = header;
			}
			if (typeof params != 'undefined') {
				passParameters.params = params;
				passParameters.params = params;
			}
			if (typeof dataPost != 'undefined') {
				passParameters.data = dataPost;
			}
			if (typeof upload != 'undefined') {
				passParameters.upload = upload;
			}
			var promise = $http(passParameters).then(function(response) {
				console.log(response);
				if (response.status == 200) {
					if (!(angular.isUndefined(response.data.message) && angular.isUndefined(response.data.customstatus))) {
						if(response.data.customstatus === 200)
						{
							growl.success(response.data.message, {
							title: 'Response Code - ' + response.data.customstatus,
							ttl: 1000
						});
						}
						else
						{
							growl.error(response.data.message, {
							title: 'Response Code - ' + response.data.customstatus,
							ttl: 1000
						});
						}
					}
					return response.data;
				} else {
					if (!(angular.isUndefined(response.data.message) && angular.isUndefined(response.data.customstatus))) {
						growl.error(response.data.message, {
							title: 'Response Code - ' + response.data.customstatus,
							ttl: 2000
						});
					}
					return;
				}
				if (typeof response.data == 'string' && response.data != 1) {
					if (response.data.substr('loginMark')) {
						location.reload();
						return;
					}
					growl.error(response.data, {
						title: 'Application!',
						ttl: 5000
					});
					// $.gritter.add({
					// 	title: 'Application',
					// 	text: response.data
					// });
					return false;
				}
				if (response.data.jsMessage) {
					growl.error(response.data.jsMessage, {
						title: response.data.jsTitle,
						ttl: 1000
					});
					// $.gritter.add({
					// 	title: response.data.jsTitle,
					// 	text: response.data.jsMessage
					// });
				}
				return response.data;
			}, function() {
				growl.error("An error occured while processing your request.", {
					title: "Application Error",
					ttl: 5000
				});
				// $.gritter.add({
				// 	title: 'Application',
				// 	text: 'An error occured while processing your request.'
				// });
			});
			user.activatePageStatus();
			return promise;
		}
	};
	return myService;
});