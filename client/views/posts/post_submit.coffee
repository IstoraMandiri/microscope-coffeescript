Template.postSubmit.events
	'submit form': (event) ->
		event.preventDefault();
		post = 
			url: $(event.target).find('[name=url]').val()
			title: $(event.target).find('[name=title]').val()
			message: $(event.target).find('[name=message]').val()


		Meteor.call 'post', post, (error,id) ->

			if error
				throwError error.reason

				if error.error is 302
					console.log '302 error', error.details
					Meteor.Router.to 'postPage', error.details

			else
				Meteor.Router.to 'postPage', id
			
		Meteor.Router.to 'postsList'		
