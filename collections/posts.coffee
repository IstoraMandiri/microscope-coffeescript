@Posts = new Meteor.Collection 'posts'

@Posts.allow 
	insert: (userId, doc) ->
		# only allow if you are logged in
		return !! userId