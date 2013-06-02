Meteor.subscribe 'posts'

Deps.autorun ->
	Meteor.subscribe 'comments', Session.get 'currentPostId'