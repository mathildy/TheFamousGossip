require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
TagGossipLink.destroy_all
Comment.destroy_all


10.times do
  city = City.create!(name: Faker::Address.city, zip_code: rand(70000..75000))
end


10.times do
  user = User.create!(first_name: Faker::Name.first_name, 
  last_name: Faker::Name.last_name,
  description: Faker::Quote.matz,
  email: Faker::Internet.email,
  age: rand(18..77),
  city: City.find(rand(City.first.id..City.last.id)),
  password_digest: Faker::Lorem.characters(number: 10)
  )
end


20.times do
  gossip = Gossip.create!(title: Faker::Book.title,
  content: Faker::ChuckNorris.fact,
  user: User.find(rand(User.first.id..User.last.id)))
end


10.times do
  tag = Tag.create!(title: Faker::Sports::Football.team)
end


Gossip.all.each do |gossip|
  TagGossipLink.create(gossip: gossip, tag: Tag.find(rand(Tag.first.id..Tag.last.id)))
end

rand(0..20).times do
  TagGossipLink.create(
    gossip: Gossip.find(rand(Gossip.first.id..Gossip.last.id)),
    tag: Tag.find(rand(Tag.first.id..Tag.last.id)))
end


20.times do
  Comment.create(content: Faker::ChuckNorris.fact,
    user: User.find(rand(User.first.id..User.last.id)),
    gossip: Gossip.find(rand(Gossip.first.id..Gossip.last.id)))
end


20.times do
  Like.create(user: User.find(rand(User.first.id..User.last.id)),
  gossip: Gossip.find(rand(Gossip.first.id..Gossip.last.id)))
end

