Template.errors.helpers
	errors: ->
		console.log 'Found ',Errors.find().count(),'errors.'
		return Errors.find()