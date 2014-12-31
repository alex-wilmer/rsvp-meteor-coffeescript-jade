Meteor.publish 'guests', -> return Guests.find()
Meteor.publish 'guest', (id) -> return Guests.find id