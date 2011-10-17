exports.init = () ->
  
  NavigationController = require 'controllers/navigation_controller'
  HomeWindow = require 'views/home_window'
  
  App.navController = new NavigationController()
  App.navController.open new HomeWindow()
  
  