# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Message.count == 0
  Message.create(text: "hahahaha")
  Message.create(text: "nice haircut Jairo ;)")
  Message.create(text: "Morning guys")
  Message.create(text: "everything is hard for me... 😥")
  Message.create(text: "This is scaffolding magic?")
  pp "Messages created!"


  