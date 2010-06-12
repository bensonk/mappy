$(function() {
  var map = new google.maps.Map($("#map_canvas")[0], {
    zoom: 14,
    center: new google.maps.LatLng(47.67, -122.38),
    mapTypeId: google.maps.MapTypeId.HYBRID
  });

  var addPoint = function(p) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(p.latitude, p.longitude),
      map: map,
      title: p.title,
    });
    var info = new google.maps.InfoWindow({
      content: "<h3>" + p.title + "</h3>"
    });
    google.maps.event.addListener(marker, "click", function() { info.open(map, marker); });
  }

  var lastPoll = 0;
  function poll() {
    $.post("/point/since/" + lastPoll, function(points, txtStatus) {
      lastPoll = new Date().getTime();
      $(points).each(function(_,p) { addPoint(p) });
      setTimeout(poll, 2000);
    }, "json");
  }
  poll();
});
