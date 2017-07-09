#create example users
puts "Creating example users"

User.create!(first_name: "Example",
			 			 last_name: "User",
             email: "example@example.com",
             password: 'password',
			  		 password_confirmation: 'password')

User.create!(first_name: "Lana",
			 			 last_name: "Kane",
             email: "hands@example.com",
             password: 'password',
			 			 password_confirmation: 'password')

User.create!(first_name: "Sterling",
						 last_name: "Archer",
             email: "duchess@example.com",
             password: 'password',
						 password_confirmation: 'password')

User.create!(first_name: "Malory",
						 last_name: "Archer",
             email: "boss@example.com",
             password: 'password',
						 password_confirmation: 'password')

99.times do |n|
  first_name  = "User#{n}"
  last_name = "Example"
  email = "example-#{n+1}@example.com"
  User.create!(first_name:  first_name,
  				  	 last_name: last_name,
               email: email,
               password: 'password',
			  			 password_confirmation: 'password')
end

# Create friendships

puts "Creating friendships"

# Create friendship between first 2 users for feed
user=User.first
friendship = user.friendships.build(friend_id: 2)
friendship.save
friendship.update_attributes(accepted: true)

# Random friendships

users=User.order(:created_at).take(6)
users.each do |user|
	5.times do
		friend = User.find(rand(80)+7)
		friendship = user.friendships.build(friend_id: friend.id)
		friendship.save
		#leave some friendships as requests
		if rand(10) > 1
			friendship.update_attributes(accepted: true)
		end
	end
end

# Create example posts
puts "Creating posts"

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end

# Create likes and comments
puts "Creating comments and likes"

Post.all.each do |p|
  rand(5).times do
    user = User.find(1+rand(80))
    Comment.create(body: Faker::Lorem.sentence(5), post: p, user: user)
    user = User.find(1+rand(80))
    p.likes.create(user_id: user.id)
  end
end 

