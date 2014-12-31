Template.guests.events

  'submit .new-guest': (e) ->
    
    e.preventDefault()
      
    name = e.target.name.value
    
    if !name
      return alert 'Please enter a name!'
    
    guest = 
      name: name
      ticket: pad 5, Math.floor Math.random() * 10000
      status: 'pending'
     
    Meteor.call 'guestInsert', guest, (error) ->
      if error
        alert error.error

    e.target.name.value = ''


pad = (len, num) ->
  
  rounds = len - num.toString().length
  
  for round in rounds
    num = '0' + num
    
  return num
