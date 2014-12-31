Template.guestLogin.events

  'submit form': (e) ->
    
    e.preventDefault()
    
    ticket = e.target.ticket.value

    if !ticket
      return alert 'Please enter a ticket!'

    Meteor.call 'attemptLogin', ticket, (error, result) -> 
    
      if error
        return alert error.error
        
      if result.wrongTicket
        return alert 'Terribly sorry, but we couldn\'t find that ticket number!'
      
      Session.set 'currentGuest', result.guestId
      Router.go 'guestPage'