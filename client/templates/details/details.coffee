Template.details.created = ->
  Session.set 'detailsTemplate', 'detailsGeneral'

Template.details.helpers
  home: ->
    return if Session.get 'currentGuest' then 'home' else ''

  detailsTemplate: ->
    return Template[Session.get 'detailsTemplate']

Template.details.events
  'click .menu a': (e) ->
    Session.set 'detailsTemplate', e.target.id