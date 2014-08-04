$(document).ready(function() {
	$('#search').on('ajax:success', function (e, data, status, xhr) {
		$('#internal-results').empty();
		$('#google-results').empty();
		var responses = JSON.parse(xhr.responseText);
		$.each(responses.internal, function(index, response) {
			var element = $('<div class="result-cover" />');
			element.css('background-image', 'url(' + response.cover_img + ')');
			var link = $('<a class="result-link" />');
			if (responses.a == 'rec') {
				link.attr('href', '/recommendations/new?book=' + response.id);
			} else {
				link.attr('href', '/discussions/new?book=' + response.id);
			}
			link.append(element);
			$('#internal-results').append(link);
		});
		$.each(responses.google, function(index, response) {
			var element = $('<div class="result-cover" />');
			element.css('background-image', 'url(' + response.cover_img + ')');
			var link = $('<a class="result-link" />');
			if (responses.a == 'rec') {
				link.attr('href', '/recommendations/new?gbook=' + response.isbn);
			} else {
				link.attr('href', '/discussions/new?gbook=' + response.isbn);
			}
			link.append(element);
			$('#google-results').append(link);
		});

	});
});
