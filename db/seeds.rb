def puts_or_log(text)
  if Rails.env.test?
    Rails.logger.info text
  else
    puts text
  end
end

def save?
  [true, false].sample
end

ActiveRecord::Base.transaction do
  puts_or_log "Destroying all users."
  User.destroy_all

  user_max = Rails.env.test? ? 10 : 100
  user_max.times do |n|
    user = User.new
    user.password = "123456"
    user.email = Faker::Internet.email

    user.save!
  end

end