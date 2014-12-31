Template.details.helpers
  home: ->
    return if Session.get 'currentGuest' then 'home' else ''