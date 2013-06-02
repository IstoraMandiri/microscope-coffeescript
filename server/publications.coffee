Meteor.publish 'posts', (limit) ->
	Posts.find {},
		sort: {submitted: -1}
		limit:limit


Meteor.publish 'comments', (postId) ->
	Comments.find
		postId: postId

Meteor.publish 'notifications', ->
	Notifications.find
		userId: @userId