# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Blog.delete_all

50.times do 
  name = Faker::Name.name
  email = Faker::Internet.free_email
  title = Faker::Name.title
  body = Faker::Lorem.sentence(3)
  User.create!(name: name, email: email, password: 'password')
  user = User.last
  Blog.create!(title: title, body: body, creator: user)
  blog = Blog.last
  rand(10..100).times do
    content = Faker::Lorem.sentence(2)
    Comment.create!(content: content, commenter_id: rand(User.first.id..User.last.id), blog: blog)  
  end
end