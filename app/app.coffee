# monkey patch "require" in the global scope
require('vendor/require').monkeypatch this

# require vendor libraries
require 'vendor/underscore'
require 'vendor/titanium_utils'

# global namespace
App = 
  Styles: require 'ui/styles'

# init app
require('initialize').init()
