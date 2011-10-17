exports.GeoLocation = (function() {
  function GeoLocation() {}
  GeoLocation.prototype.getCurrentLocation = function(options) {
    var _ref, _ref2;
        if ((_ref = options.success) != null) {
      _ref;
    } else {
      options.success = function() {};
    };
        if ((_ref2 = options.error) != null) {
      _ref2;
    } else {
      options.error = function() {};
    };
    Ti.Geolocation.purpose = "Geolocation based offers";
    Ti.Geolocation.accuracy = Ti.Geolocation.ACCURACY_BEST;
    return Ti.Geolocation.getCurrentPosition(function(e) {
      if (!e.success || e.error) {
        Ti.API.error(e.error);
        options.error(e.error);
      }
      if (e.success) {
        return options.success(e.coords);
      }
    });
  };
  return GeoLocation;
})();