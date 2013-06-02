Template.postItem.helpers
	ownPost: ->
		@userId is Meteor.userId()

	domain: ->
		a = document.createElement('a')
		a.href = @url
		return a.hostname