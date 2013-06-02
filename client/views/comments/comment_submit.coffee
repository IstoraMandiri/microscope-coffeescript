Template.commentSubmit.events
	'submit form': (e,tmpl) ->
		e.preventDefault()

		comment = 
			body: $(e.target).find('[name=body]').val()
			postId: tmpl.data._id

		Meteor.call 'comment', comment, (err,commentId) ->
			err and Meteor.Errors.throw err.reason

		$(e.target).find('[name=body]').val('')