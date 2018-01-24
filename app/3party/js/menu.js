$(document).on('click', '.navbar-collapse.in', function(e) {

	if ($(e.target).is('a') && ($(e.target).attr('class') != 'dropdown-toggle')) {
		$(this).collapse('hide');
	}

});
$(document).on('click', '.navbar-brand', function(e) {

	if ($(e.target).is('a') && ($(e.target).attr('class') != 'dropdown-toggle')) {
		$(".navbar-collapse.in").collapse('hide');
	}

});

$("#reset").on("click", function() {
	$('#role option').prop('selected', function() {
		return this.defaultSelected;
	});
});