Package.describe
	summary: 'A pattern to display application errors to the user'

Package.on_use (api) ->
	api.use ['minimongo','mongo-livedata','templating','coffeescript'], 'client'
	api.add_files ['errors.coffee','errors_list.html','errors_list.coffee'], 'client'

Package.on_test (api) ->
	console.log 'testing'
	api.use 'errors', 'client'
	api.use ['tinytest','test-helpers','coffeescript'], 'client'
	api.add_files 'errors_tests.coffee', 'client'