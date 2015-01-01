Template.guestDetailsEdit.events
  'click .delete': -> 
    if confirm 'Delete this guest?' 
      Guests.remove this._id 
      Router.go 'guests'
      
  'click .save': -> 
    # validateGuest(guest)
    
    Guests.update this._id,
      $set:
        name: $('[name="name"]').val()
        ticket: $('[name="ticket"]').val()
        status: $('[name="status"]').val()
        diet: $('[name="diet"]').val()       
    
    Router.go 'guestDetails', _id:this._id
