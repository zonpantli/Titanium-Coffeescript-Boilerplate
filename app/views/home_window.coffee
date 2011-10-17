exports.HomeWindow = () ->

  win = Ti.UI.createWindow
    title: 'home'

  label = Ti.UI.createLabel
    color : '#999'
    text : 'Home'
    font : 
      fontSize : '20dp'
      fontFamily : 'Helvetica Neue'
    width : 'auto'
    height : 'auto'
    top : '50dp'
  
  win.add label

  # return
  win