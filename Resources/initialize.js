exports.initApp = function() {
  var API, HomeWindow, NavigationController;
  API = require('api/api').API;
  NavigationController = require('controllers/navigation_controller').NavigationController;
  HomeWindow = require('views/home_window').HomeWindow;
  App.api = new API();
  App.navController = new NavigationController();
  return App.navController.open(new HomeWindow());
};