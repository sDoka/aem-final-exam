function initMap() {
    var eventsMap = new google.maps.Map(document.getElementById('events-map'), {
        center: { lat: -34.397, lng: 150.644 },
        zoom: 12
    });
    var infoWindow = new google.maps.InfoWindow({ map: eventsMap });

    // Try HTML5 geolocation.
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('You are here');
            eventsMap.setCenter(pos);
        }, function() {
            handleLocationError(true, infoWindow, eventsMap.getCenter());
        });
    } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, eventsMap.getCenter());
    }

    var events = [];
    var geocoder = new google.maps.Geocoder();

    $('.event-list .event-item').each(function(index) {
        var $eventItem = $(this);
        var event = {};
        try {
            event.title = $eventItem.find('[data-event-title]').text();
            event.address = $eventItem.find('[data-event-address]').text();
            event.description = $eventItem.find('[data-event-description]').text();
            events.push(event);

            geocoder.geocode({ 'address': event.address },
                function(results, status) {

                    if (status == google.maps.GeocoderStatus.OK) {

                        console.log(results);

                        eventsMap.setCenter(results[0].geometry.location);

                        // Create location marker for the event

                        var eventMarker = new google.maps.Marker({
                            map: eventsMap,
                            position: results[0].geometry.location,
                            title: event.title
                        });

                        // Create pop-up for the event marker

                        var infoContent = '<h5>' + event.title + '</h5>' + '<p>' + event.description + '</p>';
                        var infoWindow = new google.maps.InfoWindow({
                            content: infoContent
                        });

                        // Add UI events

                        eventMarker.addListener('click', function() {
                            infoWindow.open(eventsMap, eventMarker);
                        });

                        $eventItem.find('[data-marker-anchor]').click(function(event) {
                            eventsMap.setCenter(results[0].geometry.location);
                            event.preventDefault();
                        });
                    } else {
                        console.error("Failed to init " + $eventItem + " event. " + "Google Maps geocoder WS response status: " + status);
                    }
                }
            );

        } catch (e) {
            console.error("Failed to init " + $eventItem + " event. " + e);
        };
    });
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
        'Error: The Geolocation service failed.' :
        'Error: Your browser doesn\'t support geolocation.');
}

