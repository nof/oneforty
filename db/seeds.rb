require 'faker'

User.destroy_all

100.times do
  begin
    name = Faker::Internet.user_name
    User.create(
      email: Faker::Internet.safe_email,
      password: '12345678',
      password_confirmation: '12345678',
      name: name,
      popular_name: name
    )
  rescue
  end
end

users = User.all
users.each { |user|
  (rand 100).times {
    user.tweets.create(body: Faker::Lorem.paragraph)
  }

  users.sample(rand 100).each { |sample|
    begin user.follow! sample; rescue; end
  }
}
