# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do 
    Artist.create(name: Faker::Name.name)
end

40.times do
    Song.create(title: Faker::Hipster.words(number: rand(1..5)).join(" "), artist: Artist.all.sample)
end

3.times do 
    Playlist.create(name: Faker::Hipster.words(number: rand(1..3)).join(" ").titleize, user: User.first)
end