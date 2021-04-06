# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  Movie.create(
    {
      title: Faker::Movie.title,
      text: Faker::Lorem.paragraphs(number: 1)&.first,
      category: Movie::MOVIE_CATEGORIES[rand(9)]
    }
  )
end

5.times do
  User.create(
    {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'sample_password',
      password_confirmation: 'sample_password'
    }
  )
end

User.all.each do |user|
  Movie.all.each do |movie|
    Rating.create({value: rand(1..10), movie_id: movie.id, user_id: user.id})
  end
end
