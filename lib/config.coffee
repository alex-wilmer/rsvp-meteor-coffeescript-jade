adminExists = Meteor.users.find().count() > 0

Accounts.config forbidClientAccountCreation: adminExists