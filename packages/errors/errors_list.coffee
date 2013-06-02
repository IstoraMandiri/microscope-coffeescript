Template.meteorErrors.helpers
	errors: ->
		Meteor.errors.find()

Template.meteorError.rendered = ->
	error = @data
	Meteor.defer ->
		Meteor.errors.update error._id, 
			$set: 
				seen:true