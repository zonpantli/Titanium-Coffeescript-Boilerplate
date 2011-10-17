var NavigationController;
NavigationController = (function() {
  function NavigationController() {
    this.windowStack = [];
  }
  NavigationController.prototype.open = function(windowToOpen) {
    var containerWindow, that;
    this.windowStack.push(windowToOpen);
    that = this;
    windowToOpen.addEventListener('close', function() {
      return that.windowStack.pop();
    });
    windowToOpen.navBarHidden = windowToOpen.navBarHidden || false;
    if (this.windowStack.length === 1) {
      if (App.isAndroid) {
        windowToOpen.exitOnClose = true;
        return windowToOpen.open();
      } else {
        this.navGroup = Ti.UI.iPhone.createNavigationGroup({
          window: windowToOpen
        });
        containerWindow = Ti.UI.createWindow();
        containerWindow.add(this.navGroup);
        return containerWindow.open();
      }
    } else {
      if (App.isAndroid) {
        return windowToOpen.open();
      } else {
        return this.navGroup.open(windowToOpen);
      }
    }
  };
  NavigationController.prototype.home = function() {
    var win, windows, _i, _len;
    windows = this.windowStack.concat([]).slice(1);
    for (_i = 0, _len = windows.length; _i < _len; _i++) {
      win = windows[_i];
      if (this.navGroup) {
        this.navGroup.close(win);
      } else {
        win.close();
      }
    }
    return this.windowStack = [this.windowStack[0]];
  };
  return NavigationController;
})();
exports.NavigationController = NavigationController;