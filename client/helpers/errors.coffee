@Errors = new Metoer.Collection null

@throwError = (message) ->
	Errors.insert
		message: message