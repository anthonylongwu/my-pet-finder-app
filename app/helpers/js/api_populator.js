var randomLong = function(){ 
  return (Math.random() * 0.0153) + -122.4002077;
};
var randomLat = function(){ 
  return (Math.random() * 0.00965) + 37.7868000;
};

for(var i = 0; i < 200; i++){
  var myLatlng = new google.maps.LatLng(randomLat(), randomLong());
  var resultMarker = new google.maps.Marker({
    position: myLatlng,
    title: "i" + i
  });
  resultMarker.setMap(map);
}
