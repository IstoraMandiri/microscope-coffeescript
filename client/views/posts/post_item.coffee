Template.postItem.helpers
	ownPost: ->
		@userId is Meteor.userId()

	domain: ->
		a = document.createElement('a')
		a.href = @url
		return a.hostname

	upvotedClass: ->
		userId = Meteor.userId()
		if userId and !_.contains @upvoters, userId
			return 'btn-primary upvoteable'
		else
			return 'disabled'

Template.postItem.events
	'click .upvote': (e) ->
		e.preventDefault()
	'click .upvoteable': (e) ->
		Meteor.call 'upvote', @_id

