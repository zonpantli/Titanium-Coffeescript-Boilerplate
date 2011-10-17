var lang;
lang = (function() {
  switch (Ti.Locale.currentLanguage) {
    case "en":
      return "en";
    case "fi":
      return "fi";
    default:
      return "en";
  }
})();
exports.config = {
  lang: lang,
  ApiBaseUrl: 'https://dealium-staging.heroku.com/api/'
};