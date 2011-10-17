class NavigationController
  
  constructor: () ->
    @windowStack =  []
    
  open: (windowToOpen) ->
    # add the window to the stack of windows managed by the controller
    this.windowStack.push windowToOpen

    # grab a copy of the current nav controller for use in the callback
    that = this;
    windowToOpen.addEventListener 'close', () ->
      that.windowStack.pop()

    # hack - setting this property ensures the window is "heavyweight" (associated with an Android activity)
    windowToOpen.navBarHidden = windowToOpen.navBarHidden || false

    # This is the first window
    if this.windowStack.length == 1
      if App.isAndroid
        windowToOpen.exitOnClose = true
        windowToOpen.open()
      else
        this.navGroup = Ti.UI.iPhone.createNavigationGroup
          window : windowToOpen

        containerWindow = Ti.UI.createWindow()
        containerWindow.add this.navGroup
        containerWindow.open()

    # All subsequent windows
    else
      if App.isAndroid
        windowToOpen.open()
      else
        this.navGroup.open windowToOpen

  home: () ->
    # store a copy of all the current windows on the stack
    windows = this.windowStack.concat([]).slice 1

    for win in windows
      if this.navGroup
        this.navGroup.close win
      else
        win.close()
    this.windowStack = [this.windowStack[0]]
    
exports.NavigationController = NavigationController
