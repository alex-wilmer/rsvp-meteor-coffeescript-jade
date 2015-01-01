Template.details.created = ->
  Session.set 'detailsContent', 'detailsGeneral'

Template.details.helpers
  home: ->
    return if Session.get 'currentGuest' then 'home' else ''

  detailsContent: ->
    return Template[Session.get 'detailsContent']

Template.details.events
  'click .menu a': (e) ->
    Session.set 'detailsContent', e.target.id