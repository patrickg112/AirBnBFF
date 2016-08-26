require 'faker'

Traveler.delete_all
Host.delete_all
Review.delete_all
Request.delete_all


4.times do
  Host.create!({ username: Faker::Superhero.name,
                bio: "Love great conversation, connecting with inspirational and courageous people, exploring new places, writing, chai tea, practising yoga, riding bikes and creative work. Born and bred in the UK and Australia; I adore San Francisco, New York and Berlin – and owe a lot to my home city, Melbourne. Next big trip when I get the chance: India.",
                address: rand(1..5000).to_s+' '+rand(1..9).to_s+'th Avenue',
                city_state: 'New York, NY',
                host_expectations: rand(0.0..1.0),
                openness: rand(0.0..1.0),
                conscientiousness: rand(0.0..1.0),
                extraversion: rand(0.0..1.0),
                agreeableness: rand(0.0..1.0),
                emotional_range: rand(0.0..1.0)
                })
end

4.times do
  Host.create!({ username: Faker::Superhero.name,
                bio: "I'm passionate about food, family, travel, music, getting more for my money and my work as an executive board member of my synagogue. I am a low-impact guest when traveling solo and try to be low-impact when traveling with my wife and our 8 year-old.",
                address: rand(1..5000).to_s+' '+rand(1..9).to_s+'th Avenue',
                city_state: 'New York, NY',
                host_expectations: rand(1..5),
                new_exp: rand(1..5)
                })
end

4.times do
  Traveler.create!({username: Faker::Superhero.name,
              bio: "I'm passionate about food, family, travel, music, getting more for my money and my work as an executive board member of my synagogue. I am a low-impact guest when traveling solo and try to be low-impact when traveling with my wife and our 8 year-old.",
              guest_expectations: rand(1..5),
              new_exp: rand(1..5)
              })

end

4.times do
  Traveler.create!({username: Faker::Superhero.name,
              bio: "Love great conversation, connecting with inspirational and courageous people, exploring new places, writing, chai tea, practising yoga, riding bikes and creative work. Born and bred in the UK and Australia; I adore San Francisco, New York and Berlin – and owe a lot to my home city, Melbourne. Next big trip when I get the chance: India.",
              guest_expectations: rand(1..5),
              new_exp: rand(1..5)
              })
end


user_h1 = Host.first
user_h2 = Host.last
user_t1 = Traveler.first
user_t2 = Traveler.last
users = [user_h1, user_h2, user_t2, user_t1]
users.assign_personality

Request.create!(host: user_h1, traveler: user_t1)
