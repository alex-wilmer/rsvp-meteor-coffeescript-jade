Router.configure({
  layoutTemplate: 'layout'
});

// Guest Routes

Router.route('/', {name: 'splash'});

Router.route('/details', {name: 'details'});

Router.route('/login', {name: 'guestLogin'});

Router.route('/home', {
  name: 'guestPage'
, waitOn: function() {
    return Meteor.subscribe('guest', Session.get('currentGuest'));
  }
, data: function() {
    return Guests.findOne(Session.get('currentGuest'));
  }
});

// Admin Routes

Router.route('/guests', {
  name: 'guests'
, waitOn: function() {
    return Meteor.subscribe('guests');
  }
, data: function() {
    return { guests: Guests.find() };  
  }
});

Router.route('/guests/:_id', {
  name: 'guestDetails'
, waitOn: function() {
    return Meteor.subscribe('guest', this.params._id)
  }
, data: function() {
    return Guests.findOne(this.params._id);
  }
});

Router.route('/guests/:_id/edit', {
  name: 'guestDetailsEdit'
, waitOn: function() {
    return Meteor.subscribe('guest', this.params._id)
  }
, data: function() {
    return Guests.findOne(this.params._id);
  }
});

function requireGuestLogin () {
  if (!Session.get('currentGuest'))
    Router.go('guestLogin');
  else this.next();
}

function requireAdminLogin () {
  if (!Meteor.userId())
    Router.go('guests');
  else this.next();
}

Router.onBeforeAction(requireGuestLogin, {only:'guestPage'});

Router.onBeforeAction(requireAdminLogin, {
  only: ['guestDetails', 'guestDetailsEdit']
});