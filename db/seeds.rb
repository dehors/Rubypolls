# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: "luismartinez242011@gmail.com", uid:"123", provider:"facebook")
poll = MyPoll.create(title:"Que lenguaje de programacion es el mejor para ti", 
					description:"Queremosa saber que lenguaje son los preferidos de la gente",
					expires_at: DateTime.now + 1.year,
					user: user)
question = Question.create(description:"Te importa la eficiencia de ejecucion del programa",
						  my_poll: poll)
answer = Answer.create(description:"a) Si, me importa mucho",
						  question: question)