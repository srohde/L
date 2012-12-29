# L is a leightweight localization solution.
# The locales have to be provided in JSON format.
# Placeholders are supported using curly brackets like  
# `Hello {0}.`
class L

  # _private_ Default locale
  @_locale: "br"

  # `locales` Path the the locales JSON file.  
  # `callback` Callback function invoked when file is loaded.
  @initFile: (locales, callback) ->
    $.getJSON locales, (json) ->
      L.initJSON json
      callback json

  # `json` Locales in JSON format.
  @initJSON: (json) ->
    L._l = json

  # `locale` Locale identifier like "en" or "de"
  @changeLocale: (locale) ->
    L._locale = locale

  # `key` Key of the string to look up  
  # `args...` Placeholder values
  @get: (key, args...) ->
    keyValue = L._l[key]
    if keyValue?
      value = keyValue[L._locale]
      if args
        for arg, i in args
          value = value.replace "{#{i}}", args[i]
      return value
    return "#{key}???"

window?.L = L
module?.exports = L