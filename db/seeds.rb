50.times do
  Movie.create(
    {
      title: Faker::Movie.title,
      text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
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

Movie.find_each(&:update_avg_rating)
