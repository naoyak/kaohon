namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_posts
    make_relationships
  end
end

def make_users
  
  20.times do |n|
    name  = Faker::Name.name
    username = Faker::Internet.user_name
    password  = "password"
    User.create!(name:     name,
                 username:    username,
                 password: password,
                 password_confirmation: password)
  end
end

def make_posts
  users = User.all
  
  4.times do
    users.each do |user|
    
      content = JSON.parse(RestClient.get("http://hipsterjesus.com/api?paras=1&type=hipster-centric&html=false"))["text"].truncate(100)
      user.posts.create(content: content)
   
    end
  end
end

def make_relationships
  users = User.all
  users.each_with_index do |user, i|
    5.times do
      user.friend(User.find(rand(User.count)+1))
    end
  end
end