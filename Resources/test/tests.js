(function() {});
if (App.tests_enabled) {
  Ti.include('/test/lib/jasmine-1.0.2.js');
  require('test/lib/jasmine-titanium');
  require('test/example');
  jasmine.getEnv().addReporter(new jasmine.TitaniumReporter());
  jasmine.getEnv().execute();
}