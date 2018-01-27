app.service('user', function($rootScope) {
	$rootScope.title = "Customer Purchase Entry";
	var username;
	var loggedin = false;
	var id;
	var role;
	var token;
	var timestamp;
	// this value should be in sync with backend
	var expirationduration = "12";
	$rootScope.page = {};
	$rootScope.page.dataLoaded = false;
	$rootScope.userData;
	$rootScope.headers = {
		"Client-Service": "frontend-client",
		"Auth-Key": "simplerestapi",
		"Content-Type": "application/json"
	}

	//$rootScope.headers.push({key:"Client-Service",value:"frontend-client"});
	// "Client-Service": "frontend-client",
	// "Auth-Key": "simplerestapi",
	//  "Authorization": "$1$HY2H7rB0$2U.dlCsoHX21s/gvjCypG/",
	//  "User-ID": "1",
	//  "Content-Type": "application/json"
	this.getToken = function() {
		return token;
	}
	this.setToken = function(userToken) {
		token = userToken;
	};
	this.getName = function() {
		return username;
	};

	this.setID = function(userID) {
		id = userID;
	};
	this.getID = function() {
		return id;
	};

	this.isUserLoggedIn = function() {
		if (!!localStorage.getItem('login')) {
			loggedin = true;
			var data = JSON.parse(localStorage.getItem('login'));
			username = data.username;
			role = data.role;
			token = data.token;
			id = data.id;
			timestamp = data.timestamp;
			console.log(data);
			if (new Date().getTime() > timestamp) {
				loggedin = false;
				this.clearData();
			}
			$rootScope.userData = data;
			$rootScope.isloggedin = loggedin;
			$rootScope.headers['User-ID'] = id;
			$rootScope.headers['Authorization'] = token;
		}
		this.deactivatePageStatus();
		return loggedin;
	};

	this.saveData = function(data) {
		var expirationMS = expirationduration * 3600 * 1000;
		timestamp = new Date().getTime() + expirationMS;
		username = data.user;
		role = data.role;
		id = data.id;
		token = data.token;
		loggedin = true;
		$rootScope.isloggedin = loggedin;
		localStorage.setItem('login', JSON.stringify({
			username: username,
			id: id,
			role: role,
			token: token,
			timestamp: timestamp
		}));
		$rootScope.headers['User-ID'] = id;
		$rootScope.headers['Authorization'] = token;
	};

	this.clearData = function() {
		localStorage.removeItem('login');
		username = "";
		id = "";
		token = "";
		timestamp = "";
		loggedin = false;
		$rootScope.isloggedin = loggedin;
		$rootScope.headers['User-ID'] = "";
		$rootScope.headers['Authorization'] = "";
	}
	this.activatePageStatus = function() {
		$rootScope.page.dataLoaded = true;
	}
	this.deactivatePageStatus = function() {
		$rootScope.page.dataLoaded = false;
	}
})