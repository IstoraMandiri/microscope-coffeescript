Meteor.errors = new Meteor.Collection null

Meteor.Errors = 
	throw: (message) ->
		Meteor.errors.insert
			message: message
			seen: false

	clear: ->
		Meteor.errors.remove
			seen: true