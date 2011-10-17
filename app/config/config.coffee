lang = switch Ti.Locale.currentLanguage
  when "en" then "en"
  when "fi" then "fi"
  else "en"

exports.config = 

  lang : lang

  ApiBaseUrl : 'https://dealium-staging.heroku.com/api/'

