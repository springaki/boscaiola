FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "123456"

    # factory :inactive_user do
    #   email nil
    # end
  end
end
