Meteor.subscribeWithPagination 'posts', 10

Deps.autorun ->
	Meteor.subscribe 'comments', Session.get 'currentPostId'

Meteor.subscribe 'notifications'