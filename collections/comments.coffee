@Comments = new Meteor.Collection 'comments'

Meteor.methods
	comment: (commentAttributes) ->
		user = Meteor.user()
		post = Posts.findOne commentAttributes.postId

		if !user
			throw new Meteor.Error 401, 'You need to be logged in'

		if !commentAttributes.body
			throw new Meteor.Error 422, 'Please write a comment'

		if !post
			throw new Meteor.Error 422, 'You must comment on a post'

		comment = _.extend _.pick(commentAttributes, 'postId', 'body'),
				userId: user._id
				author: user.username
				submitted: new Date().getTime()

		Posts.update comment.postId,
			$inc:
				commentsCount: 1

		Comments.insert comment