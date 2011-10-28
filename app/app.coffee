# monkey patch "require" in the global scope
require('vendor/require').monkeypatch this

# global namespace
App = 
  Styles: {}

# require vendor libraries
_ = require('vendor/underscore')._
require 'vendor/titanium_utils'

# require app-wide styles
App.Styles = require('ui/styles').Styles


App.tests_enabled = false
require('test/enabled')
if App.tests_enabled
  require('test/tests')
else  
  require('initialize').initApp()
