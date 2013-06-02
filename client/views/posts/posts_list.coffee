Template.newPosts.helpers
	options: ->
		obj = 
			sort: {submitted: -1}
			handle: newPostsHandle

Template.bestPosts.helpers
	options: ->
		obj = 
			sort: {votes:-1, submitted: -1}
			handle: bestPostsHandle


Template.postsList.helpers
	posts: ->
		Posts.find {},
			sort: @sort
			limit: @handle.limit()
	
	postsReady: ->
		@handle.ready()

	allPostsLoaded: ->
		@handle.ready() and Posts.find().count() < @handle.loaded()

Template.postsList.events
	'click .load-more': (e) ->
		e.preventDefault()
		@handle.loadNextPage()