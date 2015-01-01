Template.guestPage.helpers
  accepted: ->
    guest = Guests.findOne this._id
    return guest.status == 'Accepted'
    
  declined: ->
    guest = Guests.findOne this._id
    return guest.status == 'Declined'

Template.guestPage.events
  'click a': (e) ->
    Guests.update this._id, $set: status: e.target.id