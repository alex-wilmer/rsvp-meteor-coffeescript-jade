Router.configure
  layoutTemplate: 'layout'

# Guest Routes

Router.route '/', name: 'splash'
Router.route '/details', name: 'details'
Router.route '/login', name: 'guestLogin'
Router.route '/home', 
  name: 'guestPage'
  waitOn: ->
    return Meteor.subscribe 'guest', Session.get 'currentGuest'
  data: ->
    return Guests.findOne()

# Admin Routes

Router.route '/guests', 
  name: 'guests'
  waitOn: ->
    return Meteor.subscribe 'guests'

Router.route '/guests/:_id', 
  name: 'guestDetails'
  waitOn: ->
    return Meteor.subscribe 'guest', this.params._id
  data: ->
    return Guests.findOne()

Router.route '/guests/:_id/edit',
  name: 'guestDetailsEdit'
  waitOn: ->
    return Meteor.subscribe 'guest', this.params._id
  data: ->
    return Guests.findOne()

# Hooks

requireGuestLogin = ->
  if !Session.get 'currentGuest'
    Router.go 'guestLogin'
  else this.next()

requireAdminLogin = ->
  if !Meteor.userId() 
    Router.go 'guests'
  else this.next()

Router.onBeforeAction requireGuestLogin, only: 'guestPage'
Router.onBeforeAction requireAdminLogin, only: ['guestDetails', 'guestDetailsEdit']