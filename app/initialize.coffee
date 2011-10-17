exports.initApp = () ->
  
  API = require('api/api').API
  NavigationController = require('controllers/navigation_controller').NavigationController
  HomeWindow = require('views/home_window').HomeWindow
  
  App.api = new API()
  App.navController = new NavigationController()
  App.navController.open new HomeWindow()

  
  