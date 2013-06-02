Tinytest.add 'Errors collection works', (test) ->
	test.equal Meteor.errors.find({}).count(), 0
	Meteor.Errors.throw 'A new Error!'
	test.equal Meteor.errors.find({}).count(), 1
	Meteor.errors.remove({})

Tinytest.addAsync 'Errors template works', (test,done) ->
	Meteor.Errors.throw 'A new Error!'
	test.equal Meteor.errors.find({seen:false}).count(), 1
	
	OnscreenDiv Spark.render -> # render the template
		Template.meteorErrors()

	Meteor.setTimeout -> # wait a few milis
		test.equal Meteor.errors.find({seen:false}).count(), 0
		test.equal Meteor.errors.find({}).count(), 1
		Meteor.Errors.clear()
		test.equal Meteor.errors.find({seen:true}).count(), 0
		done()
	, 500