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

Template.postItem.rendered = ->
	# animate this bitch
	instance = @
	rank = instance.data._rank
	$this = $(@firstNode)
	postHeight = 80
	newPosition = rank * postHeight
	
	# if element has a currentPosition (i.e. it's not the first ever render) 
	if instance.currentPosition?
		previousPosition = instance.currentPosition
		# calculate difference between old position and new position and send element there
		delta = previousPosition - newPosition
		$this.css 'top', "#{delta}px"
	else
		# it's the first render, so hide it
		$this.addClass 'invisible'

	Meteor.defer ->
		instance.currentPosition = newPosition
		$this.css('top', '0px').removeClass 'invisible'


Template.postItem.events
	'click .upvote': (e) ->
		e.preventDefault()
	'click .upvoteable': (e) ->
		Meteor.call 'upvote', @_id

