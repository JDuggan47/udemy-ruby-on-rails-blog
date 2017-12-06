FactoryBot.define do
  factory :user do
    password "password"
    admin false

    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "email#{n}@example.com"}
  end

  factory :admin, class: User do
    password "password"
    admin true

    sequence(:username) { |n| "admin#{n}" }
    sequence(:email) { |n| "admin#{n}@example.com"}
  end
end
