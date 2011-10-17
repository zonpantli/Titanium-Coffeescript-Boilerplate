class exports.GeoLocation

  constructor: () ->
    
  getCurrentLocation: (options) ->
    options.success  ?= ->
    options.error    ?= ->
    Ti.Geolocation.purpose = "Geolocation based offers"
    Ti.Geolocation.accuracy = Ti.Geolocation.ACCURACY_BEST
    Ti.Geolocation.getCurrentPosition (e) ->
      if !e.success || e.error
        Ti.API.error e.error
        options.error e.error
      options.success e.coords if e.success
