Template.postPage.helpers
	currentPost: ->
		Posts.findOne Session.get 'currentPostId'
	
	comments: ->
		Comments.find
			postId: @_id