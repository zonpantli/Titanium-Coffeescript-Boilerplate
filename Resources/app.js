var App;
require('vendor/require').monkeypatch(this);
App = {
  Styles: {}
};
require('vendor/underscore');
require('vendor/titanium_utils');
App.Styles = require('ui/styles').Styles;
App.tests_enabled = false;
require('test/enabled');
if (App.tests_enabled) {
  require('test/tests');
} else {
  require('initialize').initApp();
}