exports.init = function() {
  var Api, HomeWindow, NavigationController;
  Api = require('api/api');
  NavigationController = require('controllers/navigation_controller');
  HomeWindow = require('views/home_window');
  App.api = new Api();
  App.navController = new NavigationController();
  return App.navController.open(new HomeWindow());
};