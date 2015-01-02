Template.guests.helpers
  guests: ->
    search = Session.get 'searchTerm'
    if search 
      return Guests.find name: new RegExp search, 'i'
    else return Guests.find {}, sort: name: 1

Template.guests.events
  'submit .new-guest': (e) ->
    e.preventDefault()
      
    name = e.target.name.value
    
    if !name
      return alert 'Please enter a name!'
    
    guest = 
      name: name
      ticket: pad 5, Math.floor Math.random() * 10000
      status: 'Pending'
     
    Meteor.call 'guestInsert', guest, (error, result) ->
      if error
        alert error.error

      if result.guestExists
        alert 'This guest already exists.'

    e.target.name.value = ''

  'keydown .search': (e) ->
    setSearchTerm = -> Session.set 'searchTerm', e.target.value
    setTimeout setSearchTerm, 0

pad = (len, num) ->
  rounds = len - num.toString().length
  for round in [1..rounds]
    num = '0' + num
  return num
