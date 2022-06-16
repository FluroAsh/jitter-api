# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0
  User.create(username:"Ash", email:"ash@email.com", password:"abc123", password_confirmation:"abc123")
  User.create(username:"Alex", email:"alex@email.com", password:"abc123", password_confirmation:"abc123")
  pp "Users created"
end

if Message.count == 0
  Message.create(text: "hahahaha", user_id: 1)
  Message.create(text: "nice haircut Jairo ;)", user_id: 2)
  Message.create(text: "Morning guys", user_id: 2)
  pp "Messages created"
end 