Template.guestPage.helpers
  pending: ->
    guest = Guests.findOne this._id
    return guest.status == 'Pending'

  accepted: ->
    guest = Guests.findOne this._id
    return guest.status == 'Accepted'

  declined: ->
    guest = Guests.findOne this._id
    return guest.status == 'Declined'

Template.guestPage.events
  'click .set-status': (e) ->
    Guests.update this._id, $set: status: e.target.id