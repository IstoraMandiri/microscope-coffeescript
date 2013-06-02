Template.header.helpers
	activeRouteClass: (args...) ->
		args.pop()
		active = _.any args, (name) ->
			location.pathname is Meteor.Router["#{name}Path"]()
		return active and 'active'