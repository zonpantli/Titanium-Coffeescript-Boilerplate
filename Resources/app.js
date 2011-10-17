var App;
require('vendor/require').monkeypatch(this);
require('vendor/underscore');
require('vendor/titanium_utils');
App = {};
App({
  Styles: require('ui/styles')
});
require('initialize').init();