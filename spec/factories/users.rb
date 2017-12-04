FactoryBot.define do
  factory :user do
    password "password"
    admin false

    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "email#{n}@example.com"}
  end

  factory :admin, class: User do
    username "mike123"
    email "mike@example.com"
    password "password"
    admin true
  end
end
